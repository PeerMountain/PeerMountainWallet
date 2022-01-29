import 'dart:async';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyc3/services/services.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.dart';
import 'cubits/cubits.dart';

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
      title: Strings.appTitle,

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
        bool isValid = false;
        final privateKey = await safeStorage.readPrivateKey(
          cancelText: Strings.usePin,
          statusUnknown: () {
            isValid = false;
          },
          errorHwUnavailable: () {
            isValid = false;
          },
          onUsePin: () {
            isValid = false;
          },
          errorNoBiometricEnrolled: () {
            isValid = false;
          },
          errorNoHardware: () {
            isValid = false;
          },
        );

        if (privateKey.isReadSuccess) {
          gotoMainScreen(privateKey!);
        } else {
          if (!isValid) {
            followPinFlow();
            return;
          }

          /// unknown error here
          _showErrorDialog();
        }
      });
    }
  }

  void followPinFlow() async {
    /// create pin here
    final userPin = await secureStorage.readPin();
    final securePvKey = await secureStorage.readPrivateKey();

    if (securePvKey == null || securePvKey == "" || userPin == null || userPin == "") {
      final result = await showErrorDialog(
        title: Strings.authenticationFailed,
        description: Strings.errorMsgAuthFailed,
        okText: Strings.usePin,
      );
      final response = await navUtils.gotoCreateOrChangePinScreen();

      if (response == true) {
        gotoMainScreen(securePvKey);
      } else {
        /// show error dialog here stating cant continue without pin
        _showErrorDialog();
      }
    } else {
      final authType = prefs.getAuthType();

      /// create new pin here
      if (authType == Keys.bio) {
        final response = await navUtils.gotoCreateOrChangePinScreen();

        if (response == true) {
          prefs.setAuthType(Keys.pin);
          gotoMainScreen(securePvKey);
        } else {
          _showErrorDialog();
        }
      } else {
        /// valid user pin here and then goto main screen
        final result = await navUtils.gotoValidatePinScreen();

        if (result == true) {
          gotoMainScreen(securePvKey);
        } else {
          _showErrorDialog();
        }
      }
    }
  }

  void _showErrorDialog() {
    showErrorDialog(
      title: Strings.authenticationFailed,
      description: Strings.errorMsgForConnectionAuthFailed,
    ).then((value) {
      exit(0);
    });
  }

  void gotoMainScreen(String privateKey) {
    cryptoAccount = web3Service.getUserCryptoAccount(privateKey)!;

    anonymousSendService.sendExchangeKeyRequest();
    navUtils.gotoMainScreen();
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
