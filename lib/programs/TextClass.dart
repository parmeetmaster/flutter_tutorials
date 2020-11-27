import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_tutorials/Models/CommonModels.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/widgets.dart';

class ProjectLoad extends StatefulWidget {
  final WebLoadModel model;
  ProjectLoad({Key key,@required this.model}) : super(key: key);

  @override
  ProjectLoadStateFull createState() => ProjectLoadStateFull();
}

class ProjectLoadStateFull extends State<ProjectLoad> {

  /*Input data class */
  dynamic str = "Change Text Show Here";
  TextEditingController _textcontroller = new TextEditingController();
/*Input data ends here */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Icon(Icons.code),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.search),
            ),
            Icon(Icons.more_vert),
          ],

        ),
        body: getProject(widget.model.programName), // we are passing name to get container

    );
  }


  // its used to get Projects
  Widget getProject(dynamic data){
    if(data=="Input Data"){
      return  Container(
        );
    }



  }


}



