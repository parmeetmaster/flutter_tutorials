import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tutorials/InterviewQuestions.dart';
import 'package:flutter_tutorials/ProgramList.dart';
import 'package:flutter_tutorials/global/ADmanger.dart';
import 'package:flutter_tutorials/global/GLOBAL.dart';
import 'package:flutter_tutorials/global/GlobalWidgets.dart';
import 'package:flutter_tutorials/programs/Test2.dart';
import 'package:flutter_tutorials/quiz_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Flutter Tutorials',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageState(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePageState extends StatefulWidget {
  @override
  _HomePageStateFull createState() => _HomePageStateFull();
}

class _HomePageStateFull extends State<HomePageState> with RouteAware {
  static BuildContext _buildcontext;
  static GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  Widget roundbtn = new Stack(
    alignment: Alignment.center,
    children: [
      Container(
        width: 160.0,
        height: 160.0,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          child: Image.asset('images/default_avatar.jpg'),
        ),
      ),
      Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          child: Container(
            width: 160.0,
            height: 160.0,
          ),
          onTap: () {},
        ),
      ),
    ],
  );

  @override
  void initState() {
    super.initState();
  }



  Widget _drawer = new GlobalWidgets().getDrawer(_buildcontext);

  @override
  void dispose() {
    print("home page disposed called");
    ads.disposeAll();
    super.dispose();
  }

 static ADmanger ads;

  @override
  Widget build(BuildContext context) {


    ads = new ADmanger(context);
    ads.disposeAll();
    ads.generateBannerAdWidgetAsPerDevice();


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Tutorials"),
          backgroundColor: Colors.blue,
        ),
        drawer: _drawer,
        body: Container(
          color: Colors.white,
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1,
            children: List.generate(6, (index) {
              return GestureDetector(
                child: Card(
                    child: Column(
                      children: [
                        SizedBox(height: GLOBAL(context).getdisplayHeight()*0.02),
                        Center(
                            child: Container(
                                height: GLOBAL(context).getdisplayHeight()*0.11,
                                width: GLOBAL(context).getdisplayHeight()*0.11,
                                child:
                                    SvgPicture.asset(_getSvgByIndex(index)))),
                        SizedBox(height: 10),
                        Text(_getCardNameByIndex(index),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: GLOBAL(context).getdisplayHeight()*0.018))
                      ],
                    ),
                    color: Colors.grey[100],
                    elevation: 5,
                    clipBehavior: Clip.hardEdge,
                    margin: EdgeInsets.fromLTRB(3, 2, 3, 8.0),
                    shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(0.0),
                    )),
                onTap: () {

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => _getStateByIndex(index)));
                },
              );
            }),
          ),
        ),
        bottomNavigationBar: SizedBox(height: ads.getHeightForBannerAd()),
      ),
    );

  }

  _getCardNameByIndex(dynamic index) {
    switch (index) {
      case 0:
        return "Introduction";
        break;
      case 1:
        return "Programs to Learn";
        break;
      case 2:
        return "Quiz";
        break;
      case 3:
        return "Flutter Job \n Interview Questions";
        break;
      case 4:
        return "Dart Programming \n Basics";
        break;
      case 5:
        return "About Developer and \n App Development Services ";
        break;
      default:
        return "No Card";
        break;
    }
  }

  _getSvgByIndex(dynamic index) {
    switch (index) {
      case 0:
        return "assets/icons/flutterio-icon.svg";
        break;
      case 1:
        return "assets/icons/code.svg";
        break;
      case 2:
        return "assets/icons/quiz.svg";
        break;
      case 3:
        return "assets/icons/job-interview.svg";
        break;
      case 4:
        return "assets/icons/dartlang-icon.svg";
        break;
      case 5:
        return "assets/icons/developer.svg";
        break;
      default:
        return "assets/icons/flutterio-icon.svg";
        break;
    }
  }

// its function return state for to move homepage menu to another activity
  _getStateByIndex(dynamic index) {
    switch (index) {
      case 0:
        return new Test2();
        break;
      case 1:
        return new ProgramsList();
        break;
      case 2:
        //return //new WidgetWithCodeView();

        return QuizPage();
/*        return new QuizFinished(new QuestionModel.QuizResult(
            finished_quiz_correct: 10,
            finished_quiz_total_Questions: 5,
            finished_quiz_incorrect: 5));*/
        break;
      case 3:
        return new InterviewQuestions();
        break;
      case 4:
        return new ProgramsList();
        ;
        break;
      case 5:
        (() async {
          const url = 'https://www.linkedin.com/in/parmeets834/';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        }());
        return HomePage();
        break;
      default:
        return new ProgramsList();
        break;
    }
  }
}
