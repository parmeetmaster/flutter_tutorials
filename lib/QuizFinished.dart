import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorials/Models/CommonModels.dart';
import 'package:flutter_tutorials/global/ADmanger.dart';


class QuizFinished extends StatefulWidget {
  QuestionModel questionModel;


  QuizFinished(QuestionModel questionModel ){
    this.questionModel=questionModel;
  }

  @override
  QuizFinishedState createState() => QuizFinishedState(questionModel);
}

class QuizFinishedState extends State<QuizFinished> {
  QuestionModel questionModel;

  @override
  void initState() {
/*    QuestionModel model = new QuestionModel();
    model.setQuizResult(
        5, 10, 10 - 5);
    this.questionModel=model;*/


  }





  _startInterceptorAd(){
    ads.createInterstitialAd("QuizFinished")..load()..show();
  }


  QuizFinishedState(QuestionModel questionModel){
    this.questionModel=questionModel;
  }


  ADmanger ads;

  @override
  Widget build(BuildContext context) {
 ads=new ADmanger(context);

    final TextStyle titleStyle = TextStyle(
        color: Colors.black87,
        fontSize: 16.0,
        fontWeight: FontWeight.w500
    );
    final TextStyle trailingStyle = TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 20.0,
        fontWeight: FontWeight.bold
    );

    // TODO: implement build
  return  Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        elevation: 0,
        backgroundColor: Colors.blue[700],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Theme.of(context).primaryColor,
          Theme.of(context).accentColor
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Total Questions", style: titleStyle),
                  trailing: Text("${questionModel.finished_quiz_total_Questions}", style: trailingStyle),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Score", style: titleStyle),
                  trailing: Text("${questionModel.finished_quiz_correct / questionModel.finished_quiz_total_Questions * 100}%",
                      style: trailingStyle),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Correct Answers", style: titleStyle),
                  trailing: Text("${questionModel.finished_quiz_correct}",
                      style: trailingStyle),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Incorrect Answers", style: titleStyle),
                  trailing: Text(
                      "${questionModel.finished_quiz_incorrect}",
                      style: trailingStyle),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.white,
                    child: Text("Go Home"),
                    onPressed: () {
                     _startInterceptorAd();
                    },
                  ),
                  RaisedButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.white,
                    child: Text("Share This App"),
                    onPressed: () {
                     _startInterceptorAd();
                    },
                  ),
                ],
              ),


            ],
          ),
        ),
      ),

    );
  }
}
