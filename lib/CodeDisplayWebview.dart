import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tutorials/CommonCodeArea.dart';
import 'package:flutter_tutorials/HomePage.dart';

import 'package:flutter_tutorials/NoUsed/source_code_view.dart';
import 'package:flutter_tutorials/ProgramList.dart';
import 'package:flutter_tutorials/global/ADmanger.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
/*import 'package:admob_flutter/admob_flutter.dart';*/

import 'Models/CommonModels.dart';
import 'global/GLOBAL.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

class ShowProjectWebview extends StatefulWidget {
  WebLoadModel _webLoadModel;

  ShowProjectWebview(WebLoadModel model) {
    _webLoadModel = model;

    print("codename is" + _webLoadModel.programName);
  }

  @override
  _ShowProjectWebviewState createState() =>
      _ShowProjectWebviewState(_webLoadModel);
}

class _ShowProjectWebviewState extends State<ShowProjectWebview> {
  static WebLoadModel _webLoadModel;
  static String _programname;

  _ShowProjectWebviewState(WebLoadModel model) {
    _webLoadModel = null;
    _webLoadModel = model;
  }

  static GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  static WebViewController _webViewController;
  static TextEditingController _teController = new TextEditingController();
  static bool showLoading = false;
/*  static AdmobBannerSize bannerSize;
  static AdmobInterstitial interstitialAd;
  static AdmobReward rewardAd;*/
  static BuildContext _context;

  /* function of init*/
  static String purl, yamlurl, explanationurl, android_manifesturl, infopisturl,readonlineUrl;

  @override
  void initState() {
    super.initState();
    purl = null;
    yamlurl = null;
    explanationurl = null;
    android_manifesturl = null;
    infopisturl = null;
    purl = _webLoadModel.map_url["primaryUrl"];
    yamlurl = _webLoadModel.map_url["yaml"];
    explanationurl = _webLoadModel.map_url["explanation"];
    android_manifesturl = _webLoadModel.map_url["android_manifest"];
    infopisturl = _webLoadModel.map_url["infopist"];
    readonlineUrl = _webLoadModel.map_url["readonline"];
    print("prim is : ${_webLoadModel.map_url["android_manifest"]}");
    // You should execute `Admob.requestTrackingAuthorization()` here before showing any ad.
    _programname = _webLoadModel.programName;
print("text example ${readonlineUrl}");
    BackButtonInterceptor.add(myInterceptor);

  }

  int _stackindex=0;
  _setState(stackindex_args ){
   setState(() {
     _stackindex=stackindex_args;
   });

  }
  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Navigator.of(_context).pushReplacement(new MaterialPageRoute(builder:
        (BuildContext context) => new ProgramsList()));
    print("BACK BUTTON!"); // Do some stuff.
    return true;
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  void updateLoading(bool ls) {
    this.setState(() {
      showLoading = ls;
    });
  }

  static Future<void> loadHtmlFromAssets(
      String filename, WebViewController webViewController) async {
    String fileText = await rootBundle.loadString(filename);
    String url=Uri.dataFromString(fileText,mimeType: 'text/html', encoding: Encoding.getByName('utf-8')).toString();
    print("this is url "+filename);
    webViewController.loadUrl(url);
  }

  static Future<void> loadHtmlFromUrl(
      String urlstr, WebViewController webViewController) async {

    webViewController.loadUrl(urlstr);
  }
  /*Ui development starts here*/

  /*Top App Bar */

  /*List of button horizontal list view custom maded*
  
   */

 static Widget _chooseLoadWithModelOrWithoutModel(WebLoadModel model){

    if(model.trigger==WebLoadModel.COMMONCODEAREA_STATELESS){
      return CommonCodeAreaStateless(model);

    } else if(model.trigger==WebLoadModel.COMMONCODEAREA_STATEFULL){
      return CommonCodeAreaStateFull(model);
    }


  }



  @override
  Widget build(BuildContext context) {
    _context = context;


    return Scaffold(
   /*   bottomNavigationBar: Container(
       // width: GLOBAL(_context).getdisplayWidth(),
        color: Colors.black,
        child: AdmobBanner(
          adUnitId: GLOBAL(context).getBannerAdUnitId(),
          adSize: GLOBAL(context).getFullBannerSize(),
          listener: (AdmobAdEvent event, Map<String, dynamic> args) {
            handleEvent(event, args, 'Banner');
          },
          onBannerCreated: (AdmobBannerController controller) {

          },
        ),
      ),*/

      body: SafeArea(
        minimum: EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
                fit: FlexFit.tight,
                flex: 3,
                child: Container(
                  child: Container(
                      color: Colors.blue,

                      //margin: EdgeInsets.only(top: 20, left: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                //Open the drawer
                              },
                            ),
                          ),
                          Expanded(
                            flex: 12,
                            child: Text(
                              "" + _programname,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: new GestureDetector(
                                    child: ClipOval(
                                      child: Material(
                                        color: Colors.white, // button color
                                        child: InkWell(
                                          splashColor: Colors.green[400], // inkwell color
                                          child: SizedBox(width: 56, height: 40, child: Icon(Icons.play_arrow)),
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  /*This is used to open project with play button*/
                                                  builder: (context) =>
                                                      _chooseLoadWithModelOrWithoutModel(_webLoadModel),
                                                ));
                                          },
                                        ),
                                      ),
                                    ))),
                          ),
                          Expanded(
                            flex: 2,
                            child: Icon(Icons.menu),
                          ),
                        ],
                      )),
                )),
            /*------------------------------------------top app bar ends here ---------------------------------*/

            /*------------------------------------------ button horizontal list starts here ---------------------------------*/
            Flexible(
                fit: FlexFit.tight,
                flex: 3,
                child: new Container(
                    color: Colors.blueAccent,
                    height: 50,
                    child: Scrollbar(
                      child: new ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          if (purl != null)
                            GestureDetector(
                                child: Container(
                                    child: FlatButton(
                                        child: Text(
                                      "Main.dart",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    decoration: BoxDecoration(
                                        color: Colors.blueAccent)),
                                onTap: () {
                                  _setState(0);

                                /*  loadHtmlFromAssets(
                                      _webLoadModel.map_url['primaryUrl'],
                                      _webViewController);*/
                                }),
                          if (yamlurl != null)
                            Container(
                                child: FlatButton(
                                  child: Text(
                                    "Pubspec.yaml",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () => {
                                  _setState(1),
                                    loadHtmlFromAssets(
                                        _webLoadModel.map_url['yaml'],
                                        _webViewController)
                                  },
                                ),
                                decoration:
                                    BoxDecoration(color: Colors.blueAccent)),
                          if (explanationurl != null)
                            Container(
                              child: FlatButton(
                                child: Text(
                                  "Explanation",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  _setState(1);
                                  loadHtmlFromAssets(
                                      _webLoadModel.map_url['explanation'],
                                      _webViewController);
                                },
                              ),
                              decoration:
                                  BoxDecoration(color: Colors.blueAccent),
                            ),
                          if (android_manifesturl != null)
                            Container(
                              child: FlatButton(
                                child: Text(
                                  "Android Manifest",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () => {
                                      _setState(1),
                                  loadHtmlFromAssets(
                                      _webLoadModel.map_url['android_manifest'],
                                      _webViewController)
                                },
                              ),
                              decoration:
                                  BoxDecoration(color: Colors.blueAccent),
                            ),
                          if (infopisturl != null)
                            Container(
                              child: FlatButton(
                                child: Text(
                                  "Info.Plist",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () => {
                                  _setState(1),
                                  loadHtmlFromAssets(
                                      _webLoadModel.map_url['infopist'],
                                      _webViewController)
                                },
                              ),
                              decoration:
                                  BoxDecoration(color: Colors.blueAccent),
                            ),
                          if (readonlineUrl != null)
                            Container(
                              child: FlatButton(
                                child: Text(
                                  "Read Online",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () => {
                                  _setState(1),
                                  loadHtmlFromUrl(
                                      readonlineUrl,
                                      _webViewController)
                                },
                              ),
                              decoration:
                              BoxDecoration(color: Colors.blueAccent),
                            ),

                        ],
                      ),
                    ))),

            /*------------------------------------------ button horizontal list ends here ---------------------------------*/

            /*------------------------------------------ webview starts here---------------------------------*/

            Flexible(
              fit: FlexFit.tight,
              flex: 40,
              child: IndexedStack(
                index: _stackindex,
                children: <Widget>[
                  SourceCodeView(
                      filePath: purl),
                  WebView(
                    initialUrl: "",
                    onPageStarted: (data) {
                      updateLoading(true);
                    },
                    onPageFinished: (data) {
                      updateLoading(false);
                    },
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (webViewController) {
                      _webViewController = webViewController;
                      loadHtmlFromAssets(_webLoadModel.map_url['primaryUrl'],
                          _webViewController);
                    },
                    gestureRecognizers: Set()
                      ..add(Factory<DragGestureRecognizer>(
                          () => VerticalDragGestureRecognizer()
                            ..onStart = (DragStartDetails details) {
                              print("darg start");
                            }
                            ..onUpdate = (DragUpdateDetails details) {
                              print("Drag update: $details");
                            }
                            ..onDown = (DragDownDetails details) {
                              double a = details.globalPosition.dy;
                              print("Drag down: $a");
                            }
                            ..onCancel = () {
                              print("Drag cacel");
                            }
                            ..onEnd = (DragEndDetails details) {
                              print("Drag end");
                            })),
                  ),

                (showLoading)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Center()
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(height: ADmanger.activeBannerAdSize.height.toDouble()),
    );
  }


  static void showSnackBar(String content) {
    scaffoldState.currentState.showSnackBar(
      SnackBar(
        content: Text(content),
        duration: Duration(milliseconds: 1500),
      ),
    );
  }
}
