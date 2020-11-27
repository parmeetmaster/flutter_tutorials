import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorials/HomePage.dart';
import 'package:flutter_tutorials/global/ADmanger.dart';
import 'package:flutter_tutorials/global/GLOBAL.dart';
import 'package:flutter_tutorials/global/GlobalWidgets.dart';
import 'package:flutter_tutorials/programs/TextClass.dart';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tutorials/quiz_page.dart';

import 'CodeDisplayWebview.dart';
import 'CommonCodeArea.dart';
import 'Models/CommonModels.dart';


// import 'package:admob_flutter_example/extensions.dart';

class ProgramsList extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext progcontext) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProgramListStafulWidgetClass(title: 'Flutter Programs List'),
    );
  }
}

class ProgramListStafulWidgetClass extends StatefulWidget {
  final String title;

  var arrayofstudents;

  ProgramListStafulWidgetClass({Key key, this.title}) : super(key: key);

  @override
  _ProgramListStafulWidgetClassState createState() =>
      _ProgramListStafulWidgetClassState();
}

class _ProgramListStafulWidgetClassState extends State<ProgramListStafulWidgetClass>with RouteAware {
  static GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  int _counter = 0;
  var itemname;
  ADmanger ads2;

  static List<WebLoadModel> itemList =  GlobalWidgets().getProgramList();

  ScrollController _scrollController = new ScrollController();
  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
  @override
  void initState() {
    super.initState();


  }


  @override
  void dispose() {
    print("app is dispose program list");
    ads2.disposeInitalisationAds();

    super.dispose();
  }

  @override
  void didPush() {
    print('didPush FirstPage');
  }

  @override
  void didPopNext() {
    print('didPopNext FirstPage');
  }

  @override
  void didPop() {
    print('didPop FirstPage');
  }

  @override
  void didPushNext() {
    print('didPushNext FirstPage');
  }

  @override
  Widget build(BuildContext progcontext) {
    ads2 = new ADmanger(progcontext);

    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double delta = 200.0; // or something else..
      if (maxScroll - currentScroll <= delta) {
        print("Scroll Ends");
      }
    });

    GLOBAL _globalobj = new GLOBAL(progcontext);
    dynamic _titlecontainerheight = _globalobj.getdisplayHeight() / 15;
    double _svgCustomSize = _globalobj.getdisplayHeight() / 18;


          return Scaffold(
            appBar: AppBar(

                title: new Center(
                    child:
                        new Text(widget.title, textAlign: TextAlign.center))),
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  for (var i = 0; i <= itemList.length - 1; i++)
                    if (itemList[i].trigger ==
                            WebLoadModel.COMMONCODEAREA_STATEFULL ||
                        itemList[i].trigger ==
                            WebLoadModel.COMMONCODEAREA_STATELESS)
                      Container(
                        width: GLOBAL(progcontext).getdisplayWidth(),
                        child: Container(
                          child: Card(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        right: 20,
                                        left: 10),
                                    alignment: AlignmentDirectional.center,
                                    child: Container(
                                        height: _svgCustomSize,
                                        child: SvgPicture.asset(
                                            itemList[i].imagelink)),
                                  ),
                                ),

                                //title area
                                Expanded(
                                  flex: 8,
                                  child: GestureDetector(
                                    child: Text(
                                      "${itemList[i].programName}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black),
                                    ),
                                    onTap: () //async
                                        {
                                      //await
                                      Navigator.push(
                                          progcontext,
                                          MaterialPageRoute(
                                            /*This is used to open showproject loads*/
                                            builder: (progcontext) =>
                                                ShowProjectWebview(itemList[i]),
                                          ));
                                    },
                                  ),
                                ),

                                // widget play button area
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    alignment: AlignmentDirectional.center,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            progcontext,
                                            MaterialPageRoute(
                                              /*This is used to open project with play button*/
                                              builder: (progcontext) =>
                                                  _chooseLoadWithModelOrWithoutModel(
                                                      itemList[i]),
                                            
                                            ));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(45))),
                                        child: Container(
                                          width: 35,
                                          height: 35,
                                          child: Icon(
                                            Icons.play_circle_filled,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )

                    else if (itemList[i].trigger == WebLoadModel.TITLE)
                      Container(
                        width: GLOBAL(progcontext).getdisplayWidth(),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            color: Colors.lightBlue[200],
                            child: Padding(
                                padding: EdgeInsets.only(left: 20,top: 5,bottom: 5),
                                child: Text("${itemList[i].programName}",
                                    style: TextStyle(
                                        color: Colors.blue[900],
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)))),
                      )
                ])),
            bottomNavigationBar: SizedBox(height: ADmanger().getHeightForBannerAd()),
          );


  }

/*This is method load activity, with parameter is load container or complete new project */
  static final LOAD_WITH_PARAMETER = 1, LOAD_WITHOUT_PARAMETER = 2;

  static Widget loadClass(WebLoadModel model) {



    if (model.trigger == LOAD_WITH_PARAMETER) {
      return ProjectLoad(model: model);
    } else if (model.trigger == LOAD_WITHOUT_PARAMETER) {
      return model.ProjectLoad;
    }
  }




  Widget _chooseLoadWithModelOrWithoutModel(WebLoadModel model) {
    if (model.trigger == WebLoadModel.COMMONCODEAREA_STATELESS) {
      return CommonCodeAreaStateless(model);
    } else if (model.trigger == WebLoadModel.COMMONCODEAREA_STATEFULL) {
      return CommonCodeAreaStateFull(model);
    }
  }
}
