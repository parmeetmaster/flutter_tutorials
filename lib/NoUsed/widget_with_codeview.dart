library widget_with_codeview;

import 'package:flutter/material.dart';

import 'source_code_view.dart';

class WidgetWithCodeView extends StatefulWidget {
  // Path of source file (relative to project root). The file's content will be
  // shown in the "Code" tab.
  final String sourceFilePath;
  final Widget child;
  final String codeLinkPrefix;

  const WidgetWithCodeView({
    Key key,
    @required this.child,
    @required this.sourceFilePath,
    this.codeLinkPrefix,
  }) : super(key: key);

  static const _TABS = <Widget>[
    Tab(
      child: ListTile(
        leading: Icon(Icons.phone_android, color: Colors.white),
        title: Text('Preview', style: TextStyle(color: Colors.white)),
      ),
    ),
    Tab(
      child: ListTile(
        leading: Icon(Icons.code, color: Colors.white),
        title: Text('Code', style: TextStyle(color: Colors.white)),
      ),
    ),
  ];

  @override
  _WidgetWithCodeViewState createState() => _WidgetWithCodeViewState();
}

class _WidgetWithCodeViewState extends State<WidgetWithCodeView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String get routeName => '/${this.runtimeType.toString()}';

  Widget get sourceCodeView => SourceCodeView(
      filePath: this.widget.sourceFilePath,
      codeLinkPrefix: this.widget.codeLinkPrefix);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: GestureDetector(
          onLongPress: ((){
            print("copy code not allowed");

          }()),
          child: SourceCodeView(
            filePath: 'lib/main.dart',

          ),
        ),
      ),
    );
  }
}

