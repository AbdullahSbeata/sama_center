import 'dart:io';

import 'package:admob_flutter/admob_flutter.dart';
class AdsManager {
  static bool testMode = false;

  static String get appId{
    if(Platform.isAndroid) {
      return 'ca-app-pub-2517709019707539~4576649349';
    }
    else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get interstatialAdUnitId {
    if(testMode) {
      return AdmobInterstitial.testAdUnitId;
    }
      return "ca-app-pub-2517709019707539/8857555575";
  }

}