import 'dart:io';
import 'dart:math';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_admob/firebase_admob.dart';

import 'GLOBAL.dart';

const TESTING_OFF = 100;
const TESTING_ON = 200;
const TESTING_MODE = TESTING_OFF;

const FULLBANNER = AdSize.fullBanner;
const LARGEBANNER = AdSize.largeBanner;
const SMARTBANNER = AdSize.smartBanner;
const MEDIUMRECTANGLE = AdSize.mediumRectangle;
const LEADERBOARD = AdSize.leaderboard;
const BANNER = AdSize.banner;

class ADmanger {
  String testDevice = 'YOUR_DEVICE_ID';

  BuildContext context;
  static BannerAd bannerAd;
  NativeAd nativeAd;
  InterstitialAd interstitialAd;
  int _coins = 0;
  String appid; //FirebaseAdMob.testAppId
  static AdSize activeBannerAdSize;
  MobileAdTargetingInfo targetingInfo;

  getAppId() {
    if (TESTING_MODE == TESTING_OFF) {
      return "ca-app-pub-9421269541566983~3966250309";
    } else {
      // return "ca-app-pub-5776810454825709~9030344497";
      return FirebaseAdMob.testAppId;
    }
  }

  Future<void> start() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  ADmanger([BuildContext _argscontext]) {
    context = null;
    this.appid = getAppId();
    context = _argscontext;
    targetingInfo = MobileAdTargetingInfo(
      // testDevices: testDevice != null ? <String>[testDevice] : null,
      testDevices: <String>[],

      childDirected: true,
      nonPersonalizedAds: true,
    );
    start();
    init();
  }

  init() {
    FirebaseAdMob.instance.initialize(appId: appid);

    RewardedVideoAd.instance.listener =
        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      print("RewardedVideoAd event $event");
      if (event == RewardedVideoAdEvent.rewarded) {
        _coins += rewardAmount;
      }
    };
  }

  void disposeAll() async {
    try {
      await interstitialAd?.dispose();
      await bannerAd?.dispose();
      await nativeAd?.dispose();
    } catch (Exception) {}
  }

  void disposeInitalisationAds() async {
    try {
      await interstitialAd?.dispose();
      // await bannerAd?.dispose();
      //await nativeAd?.dispose();

    } catch (Exception) {}
  }

  BannerAd createBannerAd() {
    print("banner id is " + getBannerAdId());

    bannerAd = BannerAd(
      adUnitId: this.getBannerAdId(),
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );
    return bannerAd;
  }

  BannerAd createCustomBannerAd(AdSize _size) {
    activeBannerAdSize = _size; // use to determine bottom naviation space

    bannerAd = BannerAd(
      adUnitId: this.getBannerAdId(),
      size: _size,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );

    return bannerAd;
  }

  String getBannerAdId() {
    //top one is real
    if (TESTING_MODE == TESTING_OFF) {
      if (Platform.isIOS) {
        return 'ca-app-pub-3940256099942544/2934735716';
      } else if (Platform.isAndroid) {
        return 'ca-app-pub-9421269541566983/8598602211';
      }
    } // ends here

    else if (TESTING_MODE == TESTING_ON) {
      // here we add orignal ids
      // if testing is disable
      if (Platform.isIOS) {
        return 'ca-app-pub-3940256099942544/2934735716';
      } else if (Platform.isAndroid) {
        return 'ca-app-pub-3940256099942544/6300978111';
      }
    }
    return null;
  }

  InterstitialAd createInterstitialAd(String statename) {

    print("Admanager ${statename}");
    interstitialAd = InterstitialAd(
      adUnitId: this.getInterstitialAdId(),
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event $event");

        if (event.toString().contains("closed") ||
            event.toString().contains("failedToLoad")) {
          disposeInitalisationAds();
          //sleep(new Duration(seconds: 1));
          Navigator.of(context).pop();
        }
      },
    );
    return interstitialAd;
  }

  String getInterstitialAdId() {
    if (TESTING_MODE == TESTING_OFF) {
      if (Platform.isIOS) {
        return 'ca-app-pub-5776810454825709/1622611859';
      } else if (Platform.isAndroid) {
        return 'ca-app-pub-9421269541566983/2046663979';
      }
    } // ends here
    else if (TESTING_MODE == TESTING_ON) {
      // here we add orignal ids
      // if testing is disable
      if (Platform.isIOS) {
        return 'ca-app-pub-3940256099942544/2934735716';
      } else if (Platform.isAndroid) {
        return 'ca-app-pub-3940256099942544/1033173712';
      }
    }
    return null;
  }

  NativeAd createNativeAd() {
    nativeAd = NativeAd(
      adUnitId: NativeAd.testAdUnitId,
      factoryId: 'adFactoryExample',
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("$NativeAd event $event");
      },
    );

    return nativeAd;
  }

  String getRewardBasedVideoAdId() {
    if (TESTING_MODE == TESTING_OFF) {
      if (Platform.isIOS) {
        return 'ca-app-pub-5776810454825709/1622611859';
      } else if (Platform.isAndroid) {
        return 'ca-app-pub-5776810454825709/6566684878';
      }
    } // ends here
    else if (TESTING_MODE == TESTING_ON) {
      // here we add orignal ids
      // if testing is disable
      if (Platform.isIOS) {
        return 'ca-app-pub-3940256099942544/2934735716';
      } else if (Platform.isAndroid) {
        return 'ca-app-pub-3940256099942544/5224354917';
      }
    }
    return null;
  }

  double getHeightForBannerAd() {
    // print("Size of my devices is${GLOBAL(context).getdisplayHeight()}");
    return (activeBannerAdSize.height).toDouble();
  }

  generateBannerAdWidgetAsPerDevice() {
    disposeAll();
    if (GLOBAL(context).getDeviceType() == GLOBAL(context).Type_Tablet) {
      createCustomBannerAd(FULLBANNER)
        ..load()
        ..show();
      return;
    } else if ((GLOBAL(context).getDeviceType() ==
        GLOBAL(context).Type_Mobile)) {
      if (GLOBAL(context).getdisplayHeight() < 750) {
        createCustomBannerAd(BANNER)
          ..load()
          ..show();
        return;
      } else if (GLOBAL(context).islandscape) {
        createCustomBannerAd(BANNER)
          ..load()
          ..show();
        return;
      } else if (GLOBAL(context).isPortrait) {
        createCustomBannerAd(LARGEBANNER)
          ..load()
          ..show();
        return;
      }
    } // end of mobile banner
  }
}
