import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tutorials/global/GLOBAL.dart';
import 'HomePage.dart';
import 'ProgramList.dart';
import 'package:connectivity/connectivity.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreenState(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreenState extends StatefulWidget {
  @override
  _SplashScreenStateState createState() => _SplashScreenStateState();
}
class _SplashScreenStateState extends State<SplashScreenState> {
  static Image _logo;

_checkInternetConnection() async{

  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
    GLOBAL.isInternetConnected=true;
  } else {
    GLOBAL.isInternetConnected=false;
  }

}

  @override
  void initState() {
    super.initState();
    _checkInternetConnection();


  }
  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 1200),
            () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                  (context) =>
                  HomePage()
              )
          );
        }
    );
    _logo=Image(image: AssetImage('assets/icons/logo.png'),height: GLOBAL(context).getdisplayHeight(),);
    return Container(
        color: Colors.white,
        child:Column(
          children: [

            Flexible(flex: 4,child: Container()),
              Flexible( flex: 4,  child:_logo ),
            Flexible( flex: 1,  child: Material(child: Text("Learn ➤ Grow ➤ Become Expert",
                style: TextStyle(fontSize: 15)
            ))),
            Flexible(flex: 4,child: Container(child:Center(child: CircularProgressIndicator())
            )
            ),
          ],
        )
    );
  }
}
