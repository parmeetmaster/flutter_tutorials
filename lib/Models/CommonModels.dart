import 'dart:core';

import 'package:flutter/cupertino.dart';

class WebLoadModel {
  static const dynamic ADS = 3;
  static const dynamic COMMONCODEAREA_STATELESS = 1;
  static const dynamic COMMONCODEAREA_STATEFULL = 2;
  static const dynamic TITLE = 4;

  dynamic map_url, imagelink, yamlUrl, programName, trigger;
  Widget ProjectLoad;
  Map<String, String> webpages;

  WebLoadModel(
      {this.programName,
      this.imagelink,
      this.map_url,
      this.yamlUrl,
      this.ProjectLoad,
      this.trigger});
}

class QuestionModel {
  dynamic question, correctChoice;
  var anslist;
  int finished_quiz_correct,
      finished_quiz_total_Questions,
      finished_quiz_incorrect;

  QuestionModel({this.question, this.anslist, this.correctChoice});

  QuestionModel.QuizResult({int finished_quiz_correct, int finished_quiz_total_Questions, int finished_quiz_incorrect}){
    this.finished_quiz_correct=finished_quiz_correct;
    this.finished_quiz_total_Questions=finished_quiz_total_Questions;
    this.finished_quiz_incorrect=finished_quiz_incorrect;

  }

  void setQuizResult(int finished_quiz_correct, int finished_quiz_total_Questions, int finished_quiz_incorrect){
    this.finished_quiz_correct=finished_quiz_correct;
    this.finished_quiz_total_Questions=finished_quiz_total_Questions;
    this.finished_quiz_incorrect=finished_quiz_incorrect;

  }



/*  setQuizResult(dynamic finished_quiz_correct, dynamic finished_quiz_total_Questions, dynamic finished_quiz_incorrect) {
    this.finished_quiz_correct = finished_quiz_correct;
    this.finished_quiz_total_Questions = finished_quiz_correct;
    this.finished_quiz_incorrect = finished_quiz_incorrect;
  }*/



 // static QuestionModel setResult({int finished_quiz_correct, int finished_quiz_total_Questions, int finished_quiz_incorrect}) {}


}
