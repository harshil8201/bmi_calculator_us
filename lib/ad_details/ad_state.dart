import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4681060581165022/6309209479';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-4681060581165022/1379837491';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4681060581165022/7034508917';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-4681060581165022/8156018891';
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}
