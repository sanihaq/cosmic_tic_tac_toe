import 'package:flutter/foundation.dart';

class PlatformDetails {
  static PlatformDetails? _instance;
  PlatformDetails._();

  static PlatformDetails get instance {
    return _instance ??= PlatformDetails._();
  }

  bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;

  bool get isIos => defaultTargetPlatform == TargetPlatform.iOS;

  bool get isMacOS => defaultTargetPlatform == TargetPlatform.macOS;

  bool get isWindows => defaultTargetPlatform == TargetPlatform.windows;

  bool get isLinux => defaultTargetPlatform == TargetPlatform.linux;

  bool get isWeb => kIsWeb;

  bool get isDesktop => isMacOS || isWindows || isLinux;

  bool get isMobile => isIos || isAndroid;
}
