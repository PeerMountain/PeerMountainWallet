import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:kyc3/app/app.dart';

@lazySingleton
class DeviceInfoService {
  late AndroidDeviceInfo androidInfo;
  late IosDeviceInfo iOSDeviceInfo;

  Future<void> init() async {
    try {
      if (Platform.isAndroid) {
        androidInfo = await DeviceInfoPlugin().androidInfo;
        isEmulator = !androidInfo.isPhysicalDevice!;
        prefs.setSystemVersion(androidInfo.version.sdkInt.toString());
        return;
      }

      if (Platform.isIOS) {
        iOSDeviceInfo = await DeviceInfoPlugin().iosInfo;
        isEmulator = !iOSDeviceInfo.isPhysicalDevice;
        prefs.setSystemVersion(iOSDeviceInfo.systemVersion!);
        return;
      }
    } catch (e, stackTrace) {
      showLog("deviceInfoInit exception =====>>> $e");
      showLog("deviceInfoInit exception stackTrace =====>>> $stackTrace");
    }
  }
}
