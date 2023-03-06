import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo {
  static final DeviceInfoPlusWindowsPlugin _info =
      DeviceInfoPlusWindowsPlugin();

  static Future<DeviceInfoPlusWindowsPlugin> get getInfo async => _info;
}
