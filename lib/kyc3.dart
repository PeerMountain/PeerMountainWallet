import 'dart:async';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyc3/services/services.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.dart';
import 'app/router/routes.dart';
import 'cubits/cubits.dart';
import 'utils/navigation_utils.dart';

class Kyc3App extends StatefulWidget {
  const Kyc3App({Key? key}) : super(key: key);

  @override
  State<Kyc3App> createState() => _Kyc3AppState();
}

class _Kyc3AppState extends State<Kyc3App> {
  @override
  void initState() {
    super.initState();

    /// load last set theme
    WidgetsBinding.instance!.addPostFrameCallback((timestamp) async {
      context.read<ThemeCubit>().changeTheme(prefs.getThemeMode());
    });
  }

  Widget myBuilder(BuildContext context, Widget child) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();
    final botToastBuilder = BotToastInit();
    return MaterialApp(
      title: 'Kyc3 Peer Mountain Application',

      debugShowCheckedModeBanner: false,

      /// Add navigation key for navigation throughout the current app session
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [BotToastNavigatorObserver()],

      /// setup bot toast for loader and other ui utilities
      builder: (context, child) {
        child = myBuilder(context, child!);
        child = botToastBuilder(context, child);
        return child;
      },

      /// Add theme
      theme: Palette.lightTheme,
      darkTheme: Palette.darkTheme,
      // themeMode: ThemeMode.light,
      // themeMode: ThemeMode.dark,
      themeMode: themeCubit.state,

      /// Add app routes
      /// Starts with pre-loader splash screen
      initialRoute: '/',
      routes: {'/': (_) => const PreLoader()},
      onGenerateRoute: AppRouter.instance.onGenerateRoute,
    );
  }
}

class PreLoader extends StatefulWidget {
  const PreLoader({Key? key}) : super(key: key);

  @override
  _PreLoaderState createState() => _PreLoaderState();
}

class _PreLoaderState extends State<PreLoader> {
  @override
  void initState() {
    super.initState();

    initData();
  }

  void initData() async {
    final showIntros = prefs.getIntros();
    final allDone = prefs.getAllDone();

    /// init anonymous xmpp server channel.
    anonymousService.initXmppServer(
      onError: () {
        showErrorDialog(
          title: Strings.authenticationFailed,
          description: Strings.errorMsgForConnectionAuthFailed,
        );
      },
      onReady: () async {
        if (showIntros) {
          /// Goto on boarding introduction screens
          Timer(const Duration(seconds: 3), () async {
            navUtils.gotoIntros();
          });
        } else {
          /// Goto login or initial selection screen
          if (!allDone) {
            Timer(const Duration(seconds: 3), () async {
              navUtils.gotoInitialSelectScreen();
            });
          }
        }
      },
    );

    /// Do not wait for xmpp connection as its not needed.
    /// All set now we can access privateKey from secure storage
    if (allDone) {
      Timer(const Duration(seconds: 3), () async {
        final privateKey = await safeStorage.readPrivateKey();
        if (privateKey.isReadSuccess) {
          cryptoAccount = web3Service.getUserCryptoAccount(privateKey!)!;

          anonymousSendService.sendExchangeKeyRequest();
          navUtils.gotoMainScreen();
          return;
        } else {
          showErrorDialog(
            title: Strings.authenticationFailed,
            description: Strings.errorMsgForConnectionAuthFailed,
          ).then((value) {
            exit(0);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    return Scaffold(
      backgroundColor: Palette.accentColor,
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesSplash),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
