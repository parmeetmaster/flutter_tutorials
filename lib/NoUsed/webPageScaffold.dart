/*
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class WebViewLoadUI extends StatefulWidget {
  WebViewLoadUI({Key key}) : super(key: key);

 @override
  WebViewLoadUIState createState() => WebViewLoadUIState();
}

class WebViewLoadUIState extends State<WebViewLoadUI> {

  Future<dynamic> _loadLocalHTML() async {
    return await rootBundle.loadString('assets/webpages/pg.html');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _loadLocalHTML(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return WebviewScaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(MediaQuery.of(context).size.height/9),
              child: AppBar(
                backgroundColor: Colors.white,
              ),
            ),
            withZoom: true,
            withJavascript: true,
            appCacheEnabled: true,
            url: new Uri.dataFromString(snapshot.data, mimeType: 'text/html')
                .toString(),


          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
*/
