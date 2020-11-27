
import 'package:flutter/material.dart';
import 'package:flutter_tutorials/global/ADmanger.dart';
import 'dart:math' as math;

import 'package:flutter_tutorials/global/GlobalWidgets.dart';

class InterviewQuestions extends StatelessWidget {
  ADmanger ads;
  @override
  void dispose() {

    print("home page disposed called");
    ads.disposeAll();

  }
  @override
  Widget build(BuildContext context) {
    ads = new ADmanger(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flutter Interview Question'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            children: GlobalWidgets(context).getInterviewQuestions()
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(height:  ADmanger(context).getHeightForBannerAd()) ,
    );
  }
}
