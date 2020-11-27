import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

class GLOBAL {

  static bool isInternetConnected;

  BuildContext context;
  BuildContext _globalContext;

// true stands for testing is ON
  GLOBAL([mcontext]) {
    this.context = mcontext;
    getdeviceSizeByRatio();
  }



  double getdisplayWidth() {
    return MediaQuery.of(context).size.width;
  }

  double getdisplayHeight() {
    return MediaQuery.of(context).size.height;
  }
  var isPortrait;
  var islandscape;
  double getdeviceSizeByRatio() {
    print("Global size of complete display width:" +
        MediaQuery.of(context).size.width.toString() +
        "height" +
        MediaQuery.of(context).size.height.toString() +
        " pixel size " +
        MediaQuery.of(context).devicePixelRatio.toString());
     isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
     islandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

/*
    if (getDeviceType() == Type_Mobile && isPortrait) {
    //small mobile devices
      if (getdisplayHeight() <= 640 && getdisplayWidth() < 380)
        return 0.77;
      else // large mobile devices
        return 1.0;
    } else if (getDeviceType() == Type_Tablet && isPortrait) {
      //all tablet devices
      return MediaQuery.of(context).devicePixelRatio / 0.7;
    }
*/ /*Landscape mode configuration */ /*
    if (getDeviceType() == Type_Mobile && islandscape) {
      if (getdisplayHeight() <= 350 && getdisplayWidth() < 550)
        return 1.3;
      else // large mobile devices
        return 2.0;
    } else if (getDeviceType() == Type_Tablet && islandscape) {
      return MediaQuery.of(context).devicePixelRatio / 0.45;
    }*/

    if (isPortrait) {
      return MediaQuery.of(context).devicePixelRatio * 0.38;
    } else {
      return MediaQuery.of(context).devicePixelRatio * 1.5;
    }
  }

  var Type_Tablet = 2;
  var Type_Mobile = 1;

  getDeviceType() {
    if (Device.get().isTablet) {
      return Type_Tablet;
    } else {
      return Type_Mobile;
    }
  }


}
