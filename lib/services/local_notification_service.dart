import 'dart:convert';
import 'dart:io';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/models/chat/chat_model.dart';
import 'package:kyc3/models/hive_adapters/contact/kyc_contact.dart';
import 'package:kyc3/models/kyc_base_message.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest_all.dart' as tz;

import 'base_service.dart';

final localNotificationService = LocalNotificationService.instance;

/// Streams are created so that app can respond to notification-related events
/// since the plugin is initialised in the `main` function
final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String?> selectNotificationSubject = BehaviorSubject<String?>();

const MethodChannel platform = MethodChannel('dexterx.dev/flutter_local_notifications_example');

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

class LocalNotificationService extends BaseService {
  LocalNotificationService._();

  static LocalNotificationService get instance => LocalNotificationService._();

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void init() async {
    showLog("LocalNotificationService initState called.");

    // initialise the plugin. app_icon needs to be a added as a drawable
    // resource to the Android head project
    const initSettingsAndroid = AndroidInitializationSettings('app_icon');

    final initSettingsIOS = DarwinInitializationSettings(
      onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
    );

    final initializationSettings = InitializationSettings(
      android: initSettingsAndroid,
      iOS: initSettingsIOS,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: _onSelectNotification,
    );

    await _configureLocalTimeZone();

    /// if app has been launched by any notifications or not
    final notificationAppLaunchDetails = !kIsWeb && Platform.isLinux
        ? null
        : await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  }

  Future<void> _configureLocalTimeZone() async {
    if (kIsWeb || Platform.isLinux) {
      return;
    }
    tz.initializeTimeZones();
  }

  /// Will be called when user taps on notification
  ///
  /// This will be called for following platforms :
  ///
  /// 1. All Android versions
  /// 2. iOS version > 10 and macos
  /// 3. linux
  ///
  void _onSelectNotification(String? payload) {
    selectNotificationSubject.add(payload);

    if (payload != null) {
      final baseMessage = KycBaseMessage.fromJson(jsonDecode(payload));
      final type = EnumToString.fromString(MessageType.values, baseMessage.type!);
      switch (type) {
        case MessageType.chat:
          final chatMessage = ChatModel.fromJson(jsonDecode(baseMessage.message!));
          final receiver = KycContact()
            ..nickName = chatMessage.senderNickname
            ..fullName = chatMessage.senderFullname
            ..blockchainAddress = chatMessage.senderJid!.removeHost()
            ..jid = chatMessage.senderJid
            ..image = chatMessage.senderProfileUrl;
          navigationService.navigateTo(
            Routes.chatScreen.value,
            arguments: ChatScreenArguments(user: receiver),
          );
          break;
        default:
      }
    }
  }

  /// Will be called when user taps on notification
  ///
  /// This will be called only for iOS versions older than 10.
  void _onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) {
    didReceiveLocalNotificationSubject.add(
      ReceivedNotification(
        id: id,
        title: title,
        body: body,
        payload: payload,
      ),
    );
    _onSelectNotification(payload);
  }

  void requestPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  Future<void> showSimpleNotification({
    required String title,
    required String body,
    String? data,
  }) async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      '__kyc3_pms_messaging_notification__',
      'Messaging Channel',
      channelDescription: 'This channel will be used to show messaging notifications.',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const notificationDetails = NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      100,
      title,
      body,
      notificationDetails,
      payload: data,
    );
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    didReceiveLocalNotificationSubject.close();
  }
}
