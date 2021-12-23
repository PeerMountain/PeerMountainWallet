import 'dart:core';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:kyc3/cubits/cubits.dart';
import 'package:kyc3/di/locator.dart';
import 'package:kyc3/services/services.dart';
import 'package:kyc3/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xmpp_stone/xmpp_stone.dart' as xmpp;

import 'app.dart';
import 'storage/hive_storage.dart';

double screenHeight = 0.0;
double screenWidth = 0.0;

bool isEmulator = false;

final eventBus = EventBus();
final deviceInfoService = locator<DeviceInfoService>();
final web3Service = locator<Web3DartService>();
final web3Repository = locator<Web3Repository>();
final navigationService = locator<NavigationService>();
final dialogService = locator<DialogService>();

/// XMPP Services
final anonymousService = locator<AnonymousService>();
final normalXmppService = locator<NormalXmppService>();

final prefs = locator<Prefs>();
final safeStorage = locator<BioStorage>();
final hiveStorage = locator<HiveStorage>();

const NA = "NA";
const somethingWentWrongM = "Something went wrong, please try again later!";
const somethingWentWrongN =
    "Oop's sorry something went wrong from our side, we are working on fixing the problem. "
    "Please try again.";

Future<bool> isNetworkConnected() async {
  try {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      return true;
    } else {
      return false;
    }
  } on SocketException catch (e) {
    showLog("isNetworkConnected exception =====>>> $e");
  }

  return false;
}

void somethingWentWrong() {
  showSnackbar(somethingWentWrongM);
}

void noInternet() {
  showSnackbar(Strings.noInternet);
}

void showLog(String msg) {
  debugPrintThrottled(msg, wrapWidth: 200);
}

void showPrint(Object? msg) {
  print(msg);
}

showLogXmpp(String message) {
  const tag = 'kyc3';
  xmpp.Log.d(tag, message);
}

void showToast(String? msg) {
  // Fluttertoast.showToast(msg: msg ?? somethingWentWrong);
}

void showBotToastNotification(
  String? message, {
  Alignment? alignment,
  Duration? duration,
  Color? textColor,
  Color? backgroundColor,
}) {
  final context = StackedService.navigatorKey!.currentContext!;
  BotToast.showSimpleNotification(
    title: message ?? somethingWentWrongM,
    align: alignment,
    backgroundColor: backgroundColor,
    titleStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: textColor),
    duration: duration ?? const Duration(seconds: 3),
  );
}

void showCustomBotToastNotification(String title, String? message, {VoidCallback? onTap}) {
  BotToast.showCustomNotification(
    toastBuilder: (function) {
      return Card(
        elevation: 5.0,
        child: ListTile(
          onTap: onTap,
          title: Texts(
            title,
            fontSize: 16,
          ),
          subtitle: message != null && message.isNotEmpty
              ? Texts(
                  message.trimRight(),
                  fontSize: 14,
                )
              : null,
          trailing: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => function.call(),
          ),
        ),
      );
    },
    duration: const Duration(seconds: 4),
  );
}

Future<void> showSnackbar([String? msg, BuildContext? context, Color? color]) async {
  ScaffoldMessenger.of(context ?? StackedService.navigatorKey!.currentContext!).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(
        msg ?? somethingWentWrongM,
        style: const TextStyle(color: Colors.white),
      ),
      duration: const Duration(milliseconds: 2000),
    ),
  );
}

Future<void> showSuccessSnackbar([String? msg, BuildContext? context]) async {
  ScaffoldMessenger.of(context ?? StackedService.navigatorKey!.currentContext!).showSnackBar(
    SnackBar(
      backgroundColor: Colors.green,
      content: Text(
        msg ?? somethingWentWrongM,
        style: const TextStyle(color: Colors.white),
      ),
      duration: const Duration(milliseconds: 2000),
    ),
  );
}

Future<void> showErrorSnackbar([String? msg, BuildContext? context]) async {
  ScaffoldMessenger.of(context ?? StackedService.navigatorKey!.currentContext!).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        msg ?? somethingWentWrongM,
        style: const TextStyle(color: Colors.white),
      ),
      duration: const Duration(milliseconds: 2000),
    ),
  );
}

void hideKeyboard([BuildContext? context]) {
  if (context != null) {
    FocusScope.of(context).unfocus();
    FocusScope.of(context).requestFocus(FocusNode());
  } else {
    SystemChannels.textInput.invokeMethod<String>('TextInput.hide');
  }
}

/// Defaults to 30 seconds for better UX.
const Duration timeout = Duration(seconds: 30);
CancelFunc? loading;

void showLoader({String? request, Duration? timeout}) {
  loading = BotToast.showCustomLoading(
    backgroundColor: Colors.black54,
    toastBuilder: (func) => const APILoader(),
    duration: timeout,
    backButtonBehavior: BackButtonBehavior.ignore,
    onClose: () {},
  );
}

void showLoadingDialog({String? message = "Loading", String? description, List<Widget>? actions}) {
  actions ??= [TextButton(onPressed: () {}, child: const Texts("OK"))];

  final alertDialog = AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 5),
        Row(
          children: [
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Palette.accentColor),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Texts(
                    message!.sCap(),
                    fontSize: 18.0,
                  ),
                  if (description != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Texts(
                        description,
                        fontSize: 14.0,
                        color: StackedService.navigatorKey!.currentContext!.subtitleColor,
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );

  loading = BotToast.showCustomLoading(
    ignoreContentClick: true,
    backgroundColor: Colors.black54,
    toastBuilder: (func) => alertDialog,
    backButtonBehavior: BackButtonBehavior.ignore,
    onClose: () {},
  );
}

void hideLoader() => loading?.call();

void changeTheme() {
  final context = StackedService.navigatorKey!.currentContext!;
  context.read<ThemeCubit>().toggle();
}

/// WORKS ONLY IN ANDROID NO EFFECT IN IOS
/// To prevent user to take screenshots
Future<bool> secureScreen() async =>
    Platform.isAndroid ? await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE) : false;

/// WORKS ONLY IN ANDROID NO EFFECT IN IOS
/// To allow user to take screenshots
Future<bool> unsecureScreen() async =>
    Platform.isAndroid ? await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE) : false;

void logAccount() => showLog("logAccount =====>>> $cryptoAccount");

Future<dynamic> showSuccessDialog({String? title, String? description}) async {
  return await dialogService.showCustomDialog(
    variant: DialogType.success,
    title: title ?? "Success!",
    description: description,
  );
}

Future<dynamic> showErrorDialog({String? title, String? description}) async {
  return await dialogService.showCustomDialog(
    variant: DialogType.error,
    title: title ?? "Error!",
    description: description,
  );
}

void showPaymentProgressNotification([BuildContext? context]) async {
  context ??= StackedService.navigatorKey!.currentContext!;

  loading = BotToast.showWidget(
    toastBuilder: (void Function() cancelFunc) {
      return SafeArea(
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                margin: p10,
                child: ListTile(
                  selected: true,
                  selectedTileColor: Theme.of(context!).backgroundColor,
                  title: const Texts(
                    "Payment in progress...",
                    fontSize: 18.0,
                  ),
                  subtitle: Texts(
                    "Normal response time is ranging between 1-5 minutes.",
                    fontSize: 14.0,
                    color: context.subtitleColor,
                  ),
                  trailing: const SizedBox(
                      width: 40,
                      child: NativeLoader.android(
                        scale: 0.8,
                      )),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

const imageNFT =
    "https://lh3.googleusercontent.com/SFC7V0h3qENhtjT2hUdIbyEUEonirb2GHjIx28To8SBINQjzPHJAQ0YRcfkpyDP1tAkdQSgg8qsK3U4w8rle1hi8F0bPX0KdX0SH_Q=w600";
