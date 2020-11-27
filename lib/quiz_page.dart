import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorials/Models/CommonModels.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tutorials/ProgramList.dart';
import 'package:flutter_tutorials/QuizFinished.dart';
import 'package:flutter_tutorials/global/ADmanger.dart';
import 'package:flutter_tutorials/global/GlobalWidgets.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
/*import 'package:admob_flutter/admob_flutter.dart';*/

import 'CommonCodeArea.dart';
import 'Models/CommonModels.dart';
import 'global/GLOBAL.dart';
import 'widget/wave_clipper_2.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final TextStyle _questionStyle = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white);

  int _currentIndex = 0;
  final Map<int, dynamic> _answers = {};
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  int selectedRadioTile, isOptionchoosed = 0, questionIndex = 0;
  String _submitbtnText = "Next";
/*  static AdmobReward rewardAd;*/
  BuildContext _buildContext;
  /* > selected radio tile tells which radio tile is selected
     > is option choosed indicated which option is selected
      > quesition index is say which question curruntly display
  *
  */
  int totalCorrectMcqByUser = 0;
  List<QuestionModel> questionList = new List();
  List<QuestionModel> totalQuestionList = GlobalWidgets().getQuizQuestions();
/*   AdmobInterstitial interstitialAd;*/
   ADmanger ads;
  @override
  void initState() {
    super.initState();
    generateQuestionRandomList(numberOfQuestion: 10);
    selectedRadioTile = -1;




  }
  @override
  void dispose() {

    super.dispose();

  }





  setSelectedRadioTile(int val) {
    setState(() {
      isOptionchoosed = 1;
      selectedRadioTile = val;

      //if correct mcq button is click by user score is updated
      if (selectedRadioTile == questionList[questionIndex].correctChoice) {
        totalCorrectMcqByUser = totalCorrectMcqByUser + 1;
        print("total corrects are: " + totalCorrectMcqByUser.toString());
      }
    });
  }

  static GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  generateQuestionRandomList({int numberOfQuestion}) async {
    List distinctIds;
    List<dynamic> ids = new List();
    Random random = new Random();
    print("totalQuestionList is ${totalQuestionList.length}");
    while (true) {
      int min = 1, max = totalQuestionList.length;
      double num = (min + random.nextInt(max - min) * random.nextDouble());
      int int_num = num.toInt();
      ids.add(int_num);
      distinctIds = ids.toSet().toList();
      if (distinctIds.length >= numberOfQuestion) break;
    }

    for (int i = 0; i < distinctIds.length; i++) {
      questionList.add(totalQuestionList[distinctIds[i]]);
    }

    print("random list is here" + distinctIds.toString());
  }



  @override
  Widget build(BuildContext context) {
    ads=new ADmanger(context);


    _buildContext = context;
    int selectedRadio;
    setSelectedRadio(int val) {
      setState(() {
        selectedRadio = val;
      });
    }

    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text("Flutter Quiz"),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              height: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    // question number shows here
                    CircleAvatar(
                      backgroundColor: Colors.white70,
                      child: Text("${questionIndex + 1}"),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Text(
                        "${questionList[questionIndex].question}",
                        style: (() {
                          if (GLOBAL(_buildContext).getdisplayHeight() > 600) {
                            return TextStyle(
                                fontSize: 18.0, color: Colors.white);
                          } else if (GLOBAL(_buildContext).getdisplayHeight() <=
                              600) {
                            return TextStyle(
                                fontSize: 15.0, color: Colors.white);
                          } else if (GLOBAL(_buildContext).getdisplayHeight() >=
                              1100) {
                            return TextStyle(
                                fontSize: 30.0, color: Colors.white);
                          }
                        }()),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: _getListOfQuestions(),
                  ),
                ),
                Flexible(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: RaisedButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      padding: MediaQuery.of(context).size.width > 800
                          ? const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 64.0)
                          : null,
                      child: Text("${_submitbtnText}",
                          style: TextStyle(color: Colors.white)),
                      onPressed: _nextSubmit,
                    ),
                  ),
                ),
                SizedBox(height: GLOBAL(context).getdisplayHeight()/10),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: SizedBox(height: ADmanger().getHeightForBannerAd()),
    );




  }

  void _nextSubmit() {
    if (isOptionchoosed == 1) {
      if (_submitbtnText.contains("Finish")) {
        QuestionModel model = new QuestionModel();
        model.setQuizResult(
            totalCorrectMcqByUser, 10, 10 - totalCorrectMcqByUser);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => QuizFinished(model)));
      } else {
        setState(() {
          questionIndex = questionIndex + 1;
          isOptionchoosed = 0;
          selectedRadioTile = -1;
          if (questionIndex + 1 >= questionList.length) {
            _submitbtnText = "Finish";
          }
        });
      }
    }
  }

  List<Widget> _getListOfQuestions() {
    List<String> choiceList = questionList[questionIndex].anslist;
    int correctchoice = questionList[questionIndex].correctChoice;

    List<Widget> choiceWidgetList = new List();
    for (int i = 0; i < choiceList.length; i++) {
      choiceWidgetList.add(AbsorbPointer(
        absorbing: (() {
          if (isOptionchoosed == 1) {
            return true;
          } else
            return false;
        }()),
        child: Container(
          color: (() {
            int tileIndex = i;
            if (isOptionchoosed == 1) {
              if (tileIndex == correctchoice) {
                return Colors.lightGreenAccent;
              } else {
                return Colors.redAccent;
              }
            }
          }()),
          child: RadioListTile(
            title: Text("${choiceList[i]}",
                style: (() {
                  if (GLOBAL(_buildContext).getdisplayHeight() > 600) {
                    return TextStyle(fontSize: 18.0);
                  } else if (GLOBAL(_buildContext).getdisplayHeight() <= 600) {
                    return TextStyle(fontSize: 14.0);
                  } else if (GLOBAL(_buildContext).getdisplayHeight() >= 1100) {
                    return TextStyle(fontSize: 30.0);
                  }
                }())),
            groupValue: selectedRadioTile,
            value: i,
            onChanged: (value) {
              setState(() {
                setSelectedRadioTile(value);
              });
            },
          ),
        ),
      ));
    } // end of loop

    return choiceWidgetList;
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
