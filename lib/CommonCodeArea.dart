import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_tutorials/CodeDisplayWebview.dart'
as CodeDisplayVarient;
import 'Models/CommonModels.dart';
import 'ProgramList.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends PreferredSize {
  final Widget child;
  final double height;
  WebLoadModel model;
  BuildContext context;

  CustomAppBar(
      {@required this.child, this.height = kToolbarHeight, this.context, this.model});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(model.programName),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  /*This is used to open project with play button*/
                  builder: (_context) =>
                      CodeDisplayVarient.ShowProjectWebview(model),
                ));
          },
          child: InkWell(
            child: Icon(Icons.code),
          ),
        ),
        SizedBox(width: 20),
        InkWell(
          child: Icon(Icons.more_vert_outlined),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}


class CommonCodeAreaStateless extends StatelessWidget {
  WebLoadModel model;
  BuildContext _context;

  CommonCodeAreaStateless(WebLoadModel args_model) {
    this.model = args_model;
  }


  @override
  Widget build(BuildContext context) {
    _context = context;

    String _widgetProgramName = (model.programName.toString());
    print(_widgetProgramName);
    return Scaffold(
        appBar: CustomAppBar(context: _context, model: model),
        body: _getDyanmicDataBySwitch(_widgetProgramName));
  }

  _getDyanmicDataBySwitch(String widgetProgramName) {
    widgetProgramName = (model.programName.toString()).toLowerCase();
    switch (widgetProgramName) {
      case "text":
        return _getTextExample;
        break;
      case "stack":
        return _getStackExample;
        break;
      case "simple alert dialog":
        return _getSimpleAlertBox();
        break;
      case "simple image display":
        return _getImageExample();
        break;
      default:
        return _programNotFound;
        break;
    }
  }

  Widget _getTextExample = new Container(
    child: Center(child: Text("Hello From Flutter")),
  );
  Widget _programNotFound = new Container(
    padding: EdgeInsets.only(top: 50),
    child: Text("Haha Program Not Found"),
  );
  Widget _getStackExample = new Center(
    child: Stack(
      fit: StackFit.passthrough,
      overflow: Overflow.visible,
      children: <Widget>[
        // Max Size Widget
        Container(
          height: 300,
          width: 400,
          color: Colors.green,
          child: Center(
            child: Text(
              'Top Widget: Green',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        Positioned(
          top: 30,
          right: 20,
          child: Container(
            height: 100,
            width: 150,
            color: Colors.blue,
            child: Center(
              child: Text(
                'Middle Widget',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        Positioned(
            top: 30,
            left: 20,
            child: Container(
              height: 100,
              width: 150,
              color: Colors.orange,
              child: Center(
                child: Text(
                  'Bottom Widget',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )),
      ],
    ),
  );
  Widget _getSimpleAlertBox() {
    showAlertDialog(_context) {
      // set up the button
      Widget okButton = FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(_context, rootNavigator: true).pop();
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Simple Alert"),
        content: Text("This is an alert message."),
        actions: [
          okButton,
          // you can number of button as much you can here
        ],
      );
      // show the dialog
      showDialog(
        context: _context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: RaisedButton(
          child: Text('Show alert'),
          onPressed: () {
            showAlertDialog(_context);
          },
        ),
      ),
    );
  } // end of alert box
  Widget _getImageExample(){
    return  Center(
      child: Column(
        children: <Widget>[
          SvgPicture.asset('assets/icons/main-logo.svg'),
          Text(
            'A tablet is a wireless touch screen computer that is smaller than a notebook but larger than a smartphone.',
            style: TextStyle(fontSize: 20.0),
          )
        ],
      ),
    );

  }


}
/*end of stateless*/


/*Begin statefull */
class CommonCodeAreaStateFull extends StatefulWidget {
  WebLoadModel model;

  CommonCodeAreaStateFull(WebLoadModel args_model) {
    this.model = args_model;
  }

  @override
  State<StatefulWidget> createState() => CommonCodeAreaStateFullState(model);
}

class CommonCodeAreaStateFullState extends State<CommonCodeAreaStateFull> {
  WebLoadModel model;
  static BuildContext _context;



  @override
  void initState() {
    super.initState();


  }

  CommonCodeAreaStateFullState(WebLoadModel args_model) {
    model = args_model;
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    String _widgetProgramName = (model.programName.toString());
    print(_widgetProgramName);
    return Scaffold(
        appBar: CustomAppBar(context: _context, model: model),
        body: this._getDyanmicDataBySwitch(_widgetProgramName, context));
  }

//CommonCodeAreaStateFullState
  _getDyanmicDataBySwitch(String widgetProgramName, BuildContext context) {
    widgetProgramName = (model.programName.toString()).toLowerCase();
    print("program to run : ${widgetProgramName}");
    switch (widgetProgramName) {
      case "text input":
        return _getTextInputExample;
        break;
      case "raised button":
        return _getRaisedButtonExample();
        break;
      case "drop down button":
        return _getDropDownButtonExample();
        break;
      case "icon button":
        return _getIconButtonExample();
        break;
      case "textfield alertdialog":
        return _getInputAlertBox();
        break;
      case "toast dialog":
        return _getToastDialog();
        break;

      case "basic alert dialog":
        return _getBasicDialog();
        break;
      default:
        return _programNotFound;
        break;
    }
  }

/* common variables*/
  String msg = "Flutter RaisedButton Example";
  String dropdownValue = 'One';
  int _speakervolume = 10;
  TextEditingController _textFieldController = TextEditingController();

  /*dynamic programs */
  Widget _getTextInputExample = new Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              // controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User Name',
                hintText: 'Enter Your Name',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              //  controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter Password',
              ),
            ),
          ),
          RaisedButton(
            textColor: Colors.white,
            color: Colors.blue,
            child: Text('Sign In'),
            onPressed: () {
              return showDialog(
                context: _context,
                builder: (_context) {
                  return AlertDialog(
                    title: Text("Alert Message"),
                    // Retrieve the text which the user has entered by
                    // using the TextEditingController.
                    content: Text("nameController.text"),
                    actions: <Widget>[
                      new FlatButton(
                        child: new Text('OK'),
                        onPressed: () {
                          Navigator.of(_context).pop();
                        },
                      )
                    ],
                  );
                },
              );
            },
          )
        ],
      ));
  Widget _programNotFound = new Container(
    padding: EdgeInsets.only(top: 50),
    child: Text("Oh NO Program Not Found"),
  );

  Widget _getRaisedButtonExample() {
    //  String msg = "There is example";
    return new Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              msg,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
            ),
            RaisedButton(
              child: Text(
                "Click Here",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  msg = "We have learned FlutterRaised button example.";
                });
              },
              color: Colors.red,
              textColor: Colors.yellow,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.grey,
            )
          ],
        ),
      ),
    );
  }

  Widget _getDropDownButtonExample() {
    return Center(
      child: new DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['One', 'Two', 'Free', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _getIconButtonExample() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.volume_up),
            iconSize: 50,
            color: Colors.brown,
            tooltip: 'Increase volume by 5',
            onPressed: () {
              setState(() {
                _speakervolume += 5;
              });
            },
          ),
          Text('Speaker Volume: $_speakervolume')
        ],
      ),
    );
  }

  Widget _getInputAlertBox() {
    showAlertDialog(_context) {
      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text('TextField AlertDemo'),
        content: TextField(
          controller: _textFieldController,
          decoration: InputDecoration(hintText: "TextField in Dialog"),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('SUBMIT'),
            onPressed: () {
              Navigator.of(_context, rootNavigator: true).pop();
            },
          )
        ],
      );
      // show the dialog
      showDialog(
        context: _context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return Center(
      child: FlatButton(
          child: Text(
            'Show Alert',
            style: TextStyle(fontSize: 20.0),
          ),
          padding: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          color: Colors.green,
          onPressed: () => showAlertDialog(_context)),
    );
  }

  Widget _getToastDialog() {
    void showToast() {
      Fluttertoast.showToast(
          msg: 'This is toast notification',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.yellow);
    }

    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Center(
        child: RaisedButton(
          child: Text('click to show'),
          onPressed: showToast,
        ),
      ),
    );
  } // end of alert box
  Widget _getBasicDialog() {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: RaisedButton(
            child: Text('Show alert'),
            onPressed: () {
              showDialog(context: context, child:
              new AlertDialog(
                title: new Text("Simple Alert"),
                content: new Text("This is an alert message."),
                actions: [okButton],
              )
              );
            },
          ),
        ),
      );
    }
  }
/*end of statefull*/
