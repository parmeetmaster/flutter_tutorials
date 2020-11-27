import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tutorials/Models/CommonModels.dart';
import 'package:flutter_tutorials/programs/TextClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

import 'dart:math' as math;

class GlobalWidgets {
  BuildContext context;

  GlobalWidgets([context]) {
    this.context = context;
  }

  getInterviewQuestions() {
    List<Widget> interviewQuestions = new List();
    interviewQuestions.add(SizedBox(height: 20.0));
    interviewQuestions.add(Container(
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.grey[200],
      child: ExpansionTile(
        title: Text(
          "What is Flutter?",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: <Widget>[
          ListTile(
            title: Text('Answer:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.2),
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text:
                      "Flutter is an open-source UI toolkit from Google for crafting beautiful, natively compiled applications for desktop, web, and mobile from a single codebase. Flutter apps are built using the Dart programming language.",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Atma',
                    color: Colors.black,
                  ),
                ),
              ),
              // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
            ),
          ),
        ],
      ),
    ));
    interviewQuestions.add(Container(
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.grey[200],
      child: ExpansionTile(
        title: Text(
          "How many types of widgets are there in Flutter?",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: <Widget>[
          ListTile(
            title: Text('Answer:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.2),
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text:
                      "There are two types of widgets:\n 1. StatelessWidget : A widget that does not require mutable state.\n 2. StatefulWidget: A widget that has mutable state.",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Atma',
                    color: Colors.black,
                  ),
                ),
              ),
              // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
            ),
          ),
        ],
      ),
    ));
    interviewQuestions.add(Container(
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.grey[200],
      child: ExpansionTile(
        title: Text("What are Null-aware operators?",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            )),
        children: <Widget>[
          ListTile(
            title: Text(
              'Answer:',
              style: _getCommonAnsFontProperties(),
            ),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.2),
            child: ListTile(
              title: Column(
                children: [
                  RichText(
                    text: TextSpan(
                        text: "",
                        style: _getCommonAnsFontProperties(),
                        children: [
                          TextSpan(
                              text:
                                  "\u2022 Dart offers some handy operators for dealing with values that might be null.\n",
                              style: _getCommonAnsFontProperties()),
                          TextSpan(
                              text:
                                  "\u2022 One is the ??= assignment operator, which assigns a value to a variable only if that variable is currently null: \n\n",
                              style: _getCommonAnsFontProperties()),
                          TextSpan(
                              text:
                                  "We can use the below command to compile the release mode:",
                              style: _getCommonAnsFontProperties()),
                        ]),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color:
                        Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(0.3),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("int a; // The initial value of a is null.\n"
                          "a ??= 3;\n"
                          "print(a);  // <-- Prints 3.\n"
                          "a ??= 5;\n"
                          "print(a);  // <-- Still prints 3."),
                    ),
                  ),
                  Text(
                      "\n \u2022 Another null-aware operator is ??, which returns the expression on its left unless that expression’s value is null, in which case it evaluates and returns the expression on its right:\n"),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color:
                        Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(0.3),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("print(1 ?? 3); // <-- Prints 1.\n"
                          "print(null ?? 12); // <-- Prints 12.\n"),
                    ),
                  ),
                ],
              ),
              // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
            ),
          ),
        ],
      ),
    ));
    interviewQuestions.add(Container(
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.grey[200],
      child: ExpansionTile(
        title: Text(
          "What is Dart and why does Flutter use it?",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: <Widget>[
          ListTile(
            title: Text('Answer:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.2),
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text:
                      "Dart is an object-oriented, garbage-collected programming language that you use to develop Flutter apps. It was also created by Google, but is open-source, and has community inside and outside Google. Dart was chosen as the language of Flutter for the following reason:\n\n "
                      ""
                      "\u2022  Dart is AOT (Ahead Of Time) compiled to fast, predictable, native code, which allows almost all of Flutter to be written in Dart. This not only makes Flutter fast, virtually everything (including all the widgets) can be customized.\n\n "
                      "\u2022  Dart can also be JIT (Just In Time) compiled for exceptionally fast development cycles and game-changing workflow (including Flutter’s popular sub-second stateful hot reload).\n\n"
                      "\u2022  Dart allows Flutter to avoid the need for a separate declarative layout language like JSX or XML, or separate visual interface builders, because Dart’s declarative, programmatic layout is easy to read and visualize. And with all the layout in one language and in one place, it is easy for Flutter to provide advanced tooling that makes layout a snap.\n\n",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Atma',
                    color: Colors.black,
                  ),
                ),
              ),
              // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
            ),
          ),
        ],
      ),
    ));
    interviewQuestions.add(Container(
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.grey[200],
      child: ExpansionTile(
        title: Text(
          "What is a Widget and mention its importance in Flutter?",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: <Widget>[
          ListTile(
            title: Text('Answer:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.2),
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text:
                      "\u2022 Widgets are basically the UI components in Flutter.\n\n"
                      "\u2022 It is a way to describe the configuration of an Element.\n\n"
                      "\u2022 They are inspired from components in React.\n\n"
                      "Widgets are important in Flutter because everything within a Flutter application is a Widget , from a simple “Text” to “Buttons” to “Screen Layouts”.",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Atma',
                    color: Colors.black,
                  ),
                ),
              ),
              // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
            ),
          ),
        ],
      ),
    ));
    interviewQuestions.add(Container(
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.grey[200],
      child: ExpansionTile(
        title: Text(
          "What is an App state?",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: <Widget>[
          ListTile(
            title: Text('Answer:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.2),
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text:
                      "\u2022 State that is not ephemeral, that you want to share across many parts of your app, and that you want to keep between user sessions, is what we call application state (sometimes also called shared state).\n\n"
                      "\u2022 Examples of application state: - User preferences - Login info - Notifications in a social networking app - The shopping cart in an e-commerce app - Read/unread state of articles in a news app",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Atma',
                    color: Colors.black,
                  ),
                ),
              ),
              // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
            ),
          ),
        ],
      ),
    ));
    interviewQuestions.add(Container(
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.grey[200],
      child: ExpansionTile(
        title: Text(
          "What is the difference between “main()”  and “runApp()”  functions in Flutter?",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: <Widget>[
          ListTile(
            title: Text('Answer:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.2),
            child: ListTile(
              title: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "main ()",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.amberAccent,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        " : function came from Java-like languages so it's where all program started, without it, you can't write any program on Flutter even without UI.\n\n",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Atma',
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "runApp()",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.amberAccent,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        " : function should return Widget that would be attached to the screen as a root of the Widget Tree that will be rendered.",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Atma',
                      color: Colors.black,
                    ),
                  )
                ]),
              ),
              // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
            ),
          ),
        ],
      ),
    )); //What is the difference between "main()" and "runApp()" functions in Flutter?
    interviewQuestions.add(Container(
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.grey[200],
      child: ExpansionTile(
        title: Text(
          "Differentiate between required and optional parameters in Dart",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: <Widget>[
          ListTile(
            title: Text('Answer:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.2),
            child: ListTile(
              title: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "Required Parameters",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        " : Dart required parameters are the arguments that are passed to a function and the function or method required all those parameters to complete its code block.\n\n",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Atma',
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "Optional Parameters :",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        "\u2022 Optional parameters are defined at the end of the parameter list, after any required parameters.\n\n",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Atma',
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        "\u2022 In Flutter/Dart, there are 3 types of optional parameters: - Named - Parameters wrapped by ",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Atma',
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "{ }",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.amberAccent,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: " \n - eg. ",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Atma',
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "getUrl(int color, [int favNum])",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.amberAccent,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: " \n - Positional - Parameters wrapped by ",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Atma',
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "[ ]",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.amberAccent,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: " ) - eg. ",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Atma',
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "getUrl(int color, {int favNum})",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.amberAccent,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        " - Default - Assigning a default value to a parameter. - eg.",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Atma',
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "getUrl(int color, [int favNum = 6])",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.amberAccent,
                      color: Colors.black,
                    ),
                  )
                ]),
              ),
              // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
            ),
          ),
        ],
      ),
    ));
    interviewQuestions.add(Container(
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.grey[200],
      child: ExpansionTile(
        title: Text(
          "What are top 5 features of Flutter Language?",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: <Widget>[
          ListTile(
            title: Text('Answers:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.2),
            child: ExpansionTile(
              title: Text(
                'Object Oriented',
                //style: TextStyle(backgroundColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2)),
              ),
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Dart is an object-oriented language. '
                    'It supports object-oriented programming features like classes, '
                    'interfaces, etc. A class in terms of OOP is a blueprint for creating objects.'
                    ' A class encapsulates data for the object.',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Atma'),
                  ),
                  // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
                )
              ],
            ),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.2),
            child: ExpansionTile(
              title: Text(
                'Cross Platform',
                //style: TextStyle(backgroundColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2)),
              ),
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Flutter is first ever mobile only cross-platform development framework. It supports only iOS and Android which allows Flutter to concentrate on the mobile only features without worrying about the web and other platforms.',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Atma'),
                  ),
                  // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
                )
              ],
            ),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.3),
            child: ExpansionTile(
              title: Text(
                'Flutter is an Open-Source',
                //style: TextStyle(backgroundColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2)),
              ),
              children: <Widget>[
                ListTile(
                  title: Text(
                    'If you are planning to hire a flutter app development company for your next app development project, then it is worth to know that Flutter is an open-source language. No matter how complex your project is, developers can easily turn your app idea into a perfect solution by simply leveraging the broad choice of built-in beautiful material design, including rich motion APIs, Cupertino widgets, smooth natural scrolling behavior and so on. As it is open-source, therefore, developers can explore countless design options while developing an app with Flutter.',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Atma'),
                  ),
                  // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
                )
              ],
            ),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.3),
            child: ExpansionTile(
              title: Text(
                'Fast App Development with Hot Reload',
              ),
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Flutter’s hot reload feature makes it stand apart from the crowd. This feature allows developers to quickly and easily experiment, build UI, add features and debug apps in real-time. Hot reload instantly reflects the changes you made in coding, so you don’t need to first save the file to view the effects of the final adjustments. Hot reload can reflect updates in the current state of the app and allow you to continue with the code execution and developers complete the project development in a real-time.',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Atma'),
                  ),
                  // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
                )
              ],
            ),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.2),
            child: ExpansionTile(
              title: Text(
                'Robust',
                //style: TextStyle(backgroundColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2)),
              ),
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Flutter and Dart Combines makes an effort to eliminate error-prone situations by emphasizing mainly on compile time error checking and runtime checking.',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Atma'),
                  ),
                  // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
                )
              ],
            ),
          ),

          /*  ExpansionTile(
                      title: Text(
                        'Sub title',
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text('data'),
                        )
                      ],
                    )*/
        ],
      ),
    ));
    interviewQuestions.add(Container(
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.grey[200],
      child: ExpansionTile(
        title: Text(
          "What is the difference between a StatelessWidget and a StatefulWidget in Flutter?",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: <Widget>[
          ListTile(
            title: Text('Answers:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.2),
            child: ExpansionTile(
              title: Text(
                'Stateless Widget',
                //style: TextStyle(backgroundColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2)),
              ),
              children: <Widget>[
                ListTile(
                  title: RichText(
                    text: TextSpan(
                      text:
                          " Stateless widgets are the widgets that don’t change i.e. they are immutable. Its appearance and properties remain unchanged throughout the lifetime of the widget. In simple words, Stateless widgets cannot change their state during the runtime of the app, which means the widgets cannot be redrawn while the app is in action. ",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Atma',
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\n\nExample : ',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              'Icon, IconButton, and Text are examples of stateless widgets. ',
                        ),
                      ],
                    ),
                  ),
                  // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
                ),
                ListTile(
                  title: RichText(
                    text: TextSpan(
                      text:
                          " Stateful Widgets are the ones that change its properties during run-time. They are dynamic i.e., they are mutable and can be drawn multiple times within its lifetime. It can change its appearance in response to events triggered by user interactions or when it receives data. ",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Atma',
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\n\nExample : ',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              'Checkbox, Radio Button, Slider, InkWell, Form, and TextField are examples of Stateful widgets.',
                        ),
                      ],
                    ),
                  ),
                  // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
                )
              ],
            ),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.2),
            child: ExpansionTile(
              title: Text(
                'Stateful Widget',
                //style: TextStyle(backgroundColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2)),
              ),
              children: <Widget>[
                ListTile(
                  title: RichText(
                    text: TextSpan(
                      text:
                          " Stateful Widgets are the ones that change its properties during run-time. They are dynamic i.e., they are mutable and can be drawn multiple times within its lifetime. It can change its appearance in response to events triggered by user interactions or when it receives data. ",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Atma',
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\n\nExample : ',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              'Checkbox, Radio Button, Slider, InkWell, Form, and TextField are examples of Stateful widgets.',
                        ),
                      ],
                    ),
                  ),
                  // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
                )
              ],
            ),
          )
        ],
      ),
    ));
    interviewQuestions.add(Container(
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.grey[200],
      child: ExpansionTile(
        title: Text(
          "What is Flutter tree shaking?",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: <Widget>[
          ListTile(
            title: Text('Answers:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.2),
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text:
                      "Tree shaking is an optimization technique to remove the unused module in the bundle during the build process. It is a dead code elimination technique used to optimize the code. ",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Atma',
                    color: Colors.black,
                  ),
                ),
              ),
              // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
            ),
          ),
        ],
      ),
    ));
    interviewQuestions.add(Container(
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.grey[200],
      child: ExpansionTile(
        title: Text(
          "What is BuildContext?",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: <Widget>[
          ListTile(
            title: Text('Answer:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.2),
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text:
                      "BuildContext in Flutter is the part of the widgets in the Element tree so that each widget has its own BuildContext. We mainly use it to get a reference to another widget or theme. For example, if we want to use a material design element, it is required to reference it to the scaffold. We can get it using the Scaffold.of(context) method.",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Atma',
                    color: Colors.black,
                  ),
                ),
              ),
              // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
            ),
          ),
        ],
      ),
    ));
    interviewQuestions.add(Container(
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.grey[200],
      child: ExpansionTile(
        title: Text(
          "What is a Spacer widget?",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: <Widget>[
          ListTile(
            title: Text('Answer:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.2),
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text:
                      "The Spacer widget, located in the App Design, in order to adds an additional buffer of space in between your widgets.",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Atma',
                    color: Colors.black,
                  ),
                ),
              ),
              // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
            ),
          ),
        ],
      ),
    ));
    interviewQuestions.add(Container(
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.grey[200],
      child: ExpansionTile(
        title:
            Text("What is the difference between hot restart and hot reload?",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
        children: <Widget>[
          ListTile(
            title: Text(
              'Answers:',
              style: _getCommonAnsFontProperties(),
            ),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.2),
            child: ExpansionTile(
              title: Text(
                'Hot Reload',
                //style: TextStyle(backgroundColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2)),
              ),
              children: <Widget>[
                ListTile(
                  title: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              '\u2022  Flutter hot reload features works with a combination of Small r key on command prompt or Terminal.\n\n',
                          style: _getCommonAnsFontProperties(),
                        ),
                        TextSpan(
                          text:
                              '\u2022  Hot reload feature quickly compile the newly added code in our file and sent the code to Dart Virtual Machine. After done updating the Code Dart Virtual Machine update the app UI with widgets.\n \n',
                          style: _getCommonAnsFontProperties(),
                        ),
                        TextSpan(
                          text:
                              '\u2022  Hot Reload takes less time then Hot restart.\n \n',
                          style: _getCommonAnsFontProperties(),
                        ),
                        TextSpan(
                          text:
                              '\u2022  There is also a drawback in Hot Reload, If you are using States in your application then Hot Reload preservers the States so they will not update on Hot Reload our set to their default values.',
                          style: _getCommonAnsFontProperties(),
                        ),
                      ],
                    ),
                  ),
                  // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
                ),
              ],
            ),
          ),
          // next tile is hot restart title and data
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.2),
            child: ExpansionTile(
              title: Text(
                'Hot Restart',
                //style: TextStyle(backgroundColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2)),
              ),
              children: <Widget>[
                ListTile(
                  title: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              '\u2022  Hot restart is much different than hot reload.\n\n',
                          style: _getCommonAnsFontProperties(),
                        ),
                        TextSpan(
                          text:
                              '\u2022  In Hot restart, it destroys the preserves State value and set them to their default. So if you are using state value in your application then after every hot restart the developer gets fully compiled application and all the states will be set to their defaults.\n \n',
                          style: _getCommonAnsFontProperties(),
                        ),
                        TextSpan(
                          text:
                              '\u2022  The app widget tree is completely rebuilt with a new typed code.\n \n',
                          style: _getCommonAnsFontProperties(),
                        ),
                        TextSpan(
                            text:
                                '\u2022  Hot Restart takes much higher time than Hot reload.',
                            style: _getCommonAnsFontProperties()),
                      ],
                    ),
                  ),
                  // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
                ),
              ],
            ),
          )
        ],
      ),
    ));
    interviewQuestions.add(Container(
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.grey[200],
      child: ExpansionTile(
        title: Text("What is pubspec.yaml file?",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            )),
        children: <Widget>[
          ListTile(
            title: Text(
              'Answer:',
              style: _getCommonAnsFontProperties(),
            ),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.2),
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text:
                      "It is the project's configuration file that will use a lot during working with the Flutter project. It allows you how your application works. It also allows us to set the constraints for the app. This file contains:\n\n"
                      "\u2022 Project general settings such as name, description, and version of the project.\n\n"
                      "\u2022 Project dependencies.\n\n"
                      "\u2022 Project assets (e.g., images, audio, etc.).",
                  style: _getCommonAnsFontProperties(),
                ),
              ),
              // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
            ),
          ),
        ],
      ),
    ));
    interviewQuestions.add(Container(
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.grey[200],
      child: ExpansionTile(
        title: Text("Tell me something About Row and Column Widget?",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            )),
        children: <Widget>[
          ListTile(
            title: Text(
              'Answer:',
              style: _getCommonAnsFontProperties(),
            ),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.2),
            child: ListTile(
              title: RichText(
                text: TextSpan(
                    text:
                        "Row and column are the two essential widgets in Flutter that allows developers to align children horizontally and vertically according to our needs. These widgets are very necessary when we design the application user interface in Flutter.\n\n",
                    style: _getCommonAnsFontProperties(),
                    children: [
                      TextSpan(
                          text: "Key Points\n\n",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Atma',
                            color: Colors.black,
                          )),
                      TextSpan(
                          text:
                              "\u2022 Row and Column widgets are the most commonly used layout patterns in the Flutter application.\n",
                          style: _getCommonAnsFontProperties()),
                      TextSpan(
                          text: "\u2022 Both may take several child widgets.\n",
                          style: _getCommonAnsFontProperties()),
                      TextSpan(
                          text:
                              "\u2022 A child widget can also be a row or column widget.\n",
                          style: _getCommonAnsFontProperties()),
                      TextSpan(
                          text:
                              "\u2022 We can stretch or constrain a particular children's widget.\n",
                          style: _getCommonAnsFontProperties()),
                      TextSpan(
                          text:
                              "\u2022 Flutter also allows developers to specify how child widgets can use row and column widgets' available space.\n",
                          style: _getCommonAnsFontProperties()),
                    ]),
              ),
              // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
            ),
          ),
        ],
      ),
    ));
    interviewQuestions.add(Container(
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.grey[200],
      child: ExpansionTile(
        title: Text("What is Row Widget?",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            )),
        children: <Widget>[
          ListTile(
            title: Text(
              'Answer:',
              style: _getCommonAnsFontProperties(),
            ),
          ),
          Container(
            color: _getRandomColor(),
            child: ListTile(
              title: RichText(
                text: TextSpan(
                  text:
                      "This widget arranges its children in a horizontal direction on the screen. In other words, it will expect child widgets in a horizontal array. If the child widgets need to fill the available horizontal space, we must wrap the children widgets in an Expanded widget.\n\n"
                      "A row widget does not appear scrollable because it displays the widgets within the visible view. So it is considered wrong if we have more children in a row which will not fit in the available space. If we want to make a scrollable list of row widgets, we need to use the ListView widget.\n\n"
                      "We can control how a row widget aligns its children based on our choice using the property crossAxisAlignment and mainAxisAlignment. The row's cross-axis will run vertically, and the main axis will run horizontally. See the below visual representation to understand it more clearly.",
                  style: _getCommonAnsFontProperties(),
                ),
              ),
              // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
            ),
          ),
          SizedBox(height: 10),
          Image.asset('assets/icons/rowimg.png'),
          Container(
              margin: EdgeInsets.only(top: 10, bottom: 20),
              color: _getRandomColor(),
              child: Text(
                  "Note: Flutter row widget has several other properties like mainAxisSize, textDirection, verticalDirection, etc. Here, we will discuss only mainAxisAlignment and crossAxisAlignment properties.")),
          RichText(
            text: TextSpan(
                text:
                    "We can align the row's children widget with the help of the following properties:\n\n",
                style: _getCommonAnsFontProperties(),
                children: [
                  TextSpan(
                      text:
                          "\u2022 start: It will place the children from the starting of the main axis.\n",
                      style: _getCommonAnsFontProperties()),
                  TextSpan(
                      text:
                          "\u2022 end: It will place the children at the end of the main axis.\n",
                      style: _getCommonAnsFontProperties()),
                  TextSpan(
                      text:
                          "\u2022 center: It will place the children in the middle of the main axis.\n",
                      style: _getCommonAnsFontProperties()),
                  TextSpan(
                      text:
                          "\u2022 spaceBetween: It will place the free space between the children evenly.\n",
                      style: _getCommonAnsFontProperties()),
                  TextSpan(
                      text:
                          "\u2022 spaceAround: It will place the free space between the children evenly and half of that space before and after the first and last children widget.\n",
                      style: _getCommonAnsFontProperties()),
                  TextSpan(
                      text:
                          "\u2022 spaceEvenly: It will place the free space between the children evenly and before and after the first and last children widget.\n",
                      style: _getCommonAnsFontProperties()),
                ]),
          )
        ],
      ),
    ));
    interviewQuestions.add(Container(
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.grey[200],
      child: ExpansionTile(
        title: Text(
          "What is the difference between WidgetsApp and MaterialApp?",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: <Widget>[
          ListTile(
            title: Text('Answers:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.2),
            child: ExpansionTile(
              title: Text(
                'WidgetsApp',
                //style: TextStyle(backgroundColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2)),
              ),
              children: <Widget>[
                ListTile(
                  title: Text(
                    '1) WidgetsApp is used for basic navigation. It includes many foundational widgets '
                    'together with the widgets library that Flutter uses to create the UI of our app.\n\n'
                    '2) WidgetsApp class is the base class for MaterialApp class.\n\n'
                    '3) It wraps several widgets that are required for building the application.',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Atma'),
                  ),
                  // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
                )
              ],
            ),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.2),
            child: ExpansionTile(
              title: Text(
                'MaterialApp',
                //style: TextStyle(backgroundColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2)),
              ),
              children: <Widget>[
                ListTile(
                  title: Text(
                    '1) MaterialApp, along with the material library, is a layer that is built on the top of WidgetsApp and its library. '
                    'It implements Material Design that provides a unified look and feels to our app on any platform.\n\n'
                    '2) It offers many interesting tools such as Navigator or Theme for developing the application.\n\n'
                    '3) It wraps several widgets that are required for building material design applications.',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Atma'),
                  ),
                  // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
                )
              ],
            ),
          ),
        ],
      ),
    ));
    interviewQuestions.add(Container(
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.grey[200],
      child: ExpansionTile(
        title: Text("What is profile mode, and when do you use it?",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            )),
        children: <Widget>[
          ListTile(
            title: Text(
              'Answer:',
              style: _getCommonAnsFontProperties(),
            ),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.2),
            child: ListTile(
              title: Column(
                children: [
                  RichText(
                    text: TextSpan(
                        text: "",
                        style: _getCommonAnsFontProperties(),
                        children: [
                          TextSpan(
                              text:
                                  "\u2022 Profile mode is used to measure the performance of our applications. In this mode, some debugging ability is maintained to profile your app's performance. This mode is disabled on the emulator and simulator because they are not representative of real performance.\n",
                              style: _getCommonAnsFontProperties()),
                          TextSpan(
                              text:
                                  "\u2022 Flutter also allows developers to specify how child widgets can use row and column widgets' available space.\n",
                              style: _getCommonAnsFontProperties()),
                        ]),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color:
                        Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(0.3),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("  flutter run --profile"),
                    ),
                  )
                ],
              ),
              // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
            ),
          ),
        ],
      ),
    ));
    interviewQuestions.add(Container(
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.grey[200],
      child: ExpansionTile(
        title: Text("What is release mode, and when do you use it?",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            )),
        children: <Widget>[
          ListTile(
            title: Text(
              'Answer:',
              style: _getCommonAnsFontProperties(),
            ),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.2),
            child: ListTile(
              title: Column(
                children: [
                  RichText(
                    text: TextSpan(
                        text: "",
                        style: _getCommonAnsFontProperties(),
                        children: [
                          TextSpan(
                              text:
                                  "\u2022 Release mode allows us to optimize the codes and generate them without any debug data in a fully optimized form. In this mode, many of the application's code will be entirely removed or rewritten.\n",
                              style: _getCommonAnsFontProperties()),
                          TextSpan(
                              text:
                                  "\u2022 We use this mode when we are ready to release the app. It enables maximum optimization and minimal footprint size of the application \n\n",
                              style: _getCommonAnsFontProperties()),
                          TextSpan(
                              text:
                                  "We can use the below command to compile the release mode:",
                              style: _getCommonAnsFontProperties()),
                        ]),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color:
                        Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(0.3),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("  flutter run --release"),
                    ),
                  )
                ],
              ),
              // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
            ),
          ),
        ],
      ),
    ));
    interviewQuestions.add(Container(
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.grey[200],
      child: ExpansionTile(
        title: Text(
          "Explain the different types of Streams?",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: <Widget>[
          ListTile(
            title: Text('Answer:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.2),
            child: ListTile(
              title: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "There are two kinds of streams. \n\n",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "1. Single subscription streams",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.amberAccent,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        "  The most common kind of stream. - It contains a sequence of events that are parts of a larger whole. Events need to be delivered in the correct order and without missing any of them.\n - This is the kind of stream you get when you read a file or receive a web request. - Such a stream can only be listened to once. Listening again later could mean missing out on initial events, and then the rest of the stream makes no sense. - When you start listening, the data will be fetched and provided in chunks.\n\n",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Atma',
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "2) Broadcast streams",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.amberAccent,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        " It intended for individual messages that can be handled one at a time. This kind of stream can be used for mouse events in a browser, for example.\n"
                        "\n \u2022 You can start listening to such a stream at any time, and you get the events that are fired while you listen.\n"
                        "\n \u2022 More than one listener can listen at the same time, and you can listen again later after canceling a previous subscription.",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Atma',
                      color: Colors.black,
                    ),
                  )
                ]),
              ),
              // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
            ),
          ),
        ],
      ),
    ));
    interviewQuestions.add(Container(
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.grey[200],
      child: ExpansionTile(
        title: Text("What is Future in Flutter/Dart?",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            )),
        children: <Widget>[
          ListTile(
            title: Text(
              'Answer:',
              style: _getCommonAnsFontProperties(),
            ),
          ),
          Container(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(0.2),
            child: ListTile(
              title: Column(
                children: [
                  RichText(
                    text: TextSpan(
                        text: "",
                        style: _getCommonAnsFontProperties(),
                        children: [
                          TextSpan(
                              text:
                                  "\u2022 A Future is used to represent a potential value, or error, that will be available at some time in the future. Receivers of a Future can register callbacks that handle the value or error once it is available. For example:\n",
                              style: _getCommonAnsFontProperties()),
                          TextSpan(
                              text:
                                  "\u2022 If a future doesn’t produce a usable value, then the future’s type is ",
                              style: _getCommonAnsFontProperties()),
                          TextSpan(
                            text: "Future<void>\n",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.white,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                              text:
                                  "\u2022 A future represents the result of an asynchronous operation, and can have two states:\n",
                              style: _getCommonAnsFontProperties()),
                          TextSpan(
                            text: "1) Uncompleted: ",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                              text:
                                  "When you call an asynchronous function, it returns an uncompleted future. That future is waiting for the function’s asynchronous operation to finish or to throw an error.\n",
                              style: _getCommonAnsFontProperties()),
                          TextSpan(
                            text: "2) Completed : ",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                              text:
                                  "If the asynchronous operation succeeds, the future completes with a value. Otherwise it completes with an error.",
                              style: _getCommonAnsFontProperties()),
                        ]),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color:
                        Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(0.3),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Future<int> future = getFuture();\n\n"
                          "future.then((value) => handleValue(value))\n"
                          ".catchError((error) => handleError(error));"),
                    ),
                  )
                ],
              ),
              // tileColor:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.2),
            ),
          ),
        ],
      ),
    ));
    return interviewQuestions;
  }

  _getCommonAnsFontProperties() {
    return TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Atma',
      color: Colors.black,
    );
  }

  _getCommonQuestionFontProperties() {
    return TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    );
  }

  _getRandomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(0.2);
  }

  getQuizQuestions() {
    List<QuestionModel> totalQuestionList = [
      QuestionModel(
          question: "Is flutter is Platform Independent Language",
          anslist: ["yes", "No", "else", "i dont know"],
          correctChoice: 0),
      QuestionModel(
          question: "If dart is not available it's mean flutter also not works",
          anslist: ["yes", "No"],
          correctChoice: 1),
      QuestionModel(
          question:
              "Flutter is an __________ mobile application development framework created by Google.",
          anslist: [
            "Open-source",
            "Shareware",
            "Both(Open-source and Shareware)",
            "None of the above"
          ],
          correctChoice: 0),
      QuestionModel(
          question:
              "Flutter is used to develop applications for __________ and __________.",
          anslist: ["Android", "iOS", "Both(Android and iOS)", "None"],
          correctChoice: 2),
      QuestionModel(
          question:
              "The first version of Flutter was known as codename __________ and ran on the Android operating system.",
          anslist: ["Cloud", "Sky", "Rain", "None"],
          correctChoice: 1),
      QuestionModel(
          question:
              "Flutter's engine, written primarily in C++, provides low-level rendering support using Google's Skia graphics library.",
          anslist: [
            "True",
            "False",
          ],
          correctChoice: 0),
      QuestionModel(
          question:
              "Flutter apps are written in the __________ language and make use of many of the language's more advanced features.",
          anslist: ["Dart", "Java", "C", "Swift"],
          correctChoice: 0),
      QuestionModel(
          question: "What is Flutter?",
          anslist: [
            "Programming Language",
            "Framework",
            "Dart Support Library",
            "None"
          ],
          correctChoice: 1),
      QuestionModel(
          question: "What is splash screen in Flutter?.",
          anslist: [
            "First State of an application",
            "Service of an application",
            "Method of an application",
            "Initial screen of an application"
          ],
          correctChoice: 3),
      QuestionModel(
          question:
              "Due to App Store restrictions on dynamic code execution, Flutter apps use __________ compilation on iOS.",
          anslist: [
            "Both",
            "ahed-of-code (AOC)",
            "ahead-of-time (AOT) ",
            "None"
          ],
          correctChoice: 2),
      QuestionModel(
          question:
              "Flutter apps are written in the __________ language and make use of many of the language's more advanced features.",
          anslist: ["True", "False"],
          correctChoice: 0),
      QuestionModel(
          question:
              " What are the functionalities of HTTP Client Class in Flutter",
          anslist: [
            "Connection management",
            " Cookies management",
            "Authentication management",
            "All of the above",
            "None of the above"
          ],
          correctChoice: 3),
      QuestionModel(
          question:
              "What is the purpose of Widget build(BuildContext context) in Flutter?",
          anslist: [
            "To create an State",
            " To create a graphical window for Widgets",
            "It allows the developers to write the program",
            "None of the above"
          ],
          correctChoice: 1),
      QuestionModel(
          question: "Which Primary language in flutter?",
          anslist: ["Java", "Kotlin", "Dart", "C++"],
          correctChoice: 2),
      QuestionModel(
          question: "Is Dart Native can Run Web Applicattion?",
          anslist: ["Yes", "No"],
          correctChoice: 1),
      QuestionModel(
          question: "Null-aware  ??= assignment operator is Used for?",
          anslist: [
            "assigns a value to a variable only if that variable is currently null",
            "??= is Ternary Operator",
            "None of above"
          ],
          correctChoice: 0),
      QuestionModel(
          question: "async, await in Flutter/Dart?",
          anslist: [
            "Future",
            "Stream",
            "Both(async and await)",
            "None Above",
            "None of above"
          ],
          correctChoice: 2),
      QuestionModel(
          question: "InitState is used for",
          anslist: [
            "Generate Data before build called",
            "Its call after build ",
            "Both above",
            "None Above",
          ],
          correctChoice: 0),
      QuestionModel(
          question: "@required is used for?",
          anslist: [
            "Its used in named parameter",
            "Its used above function",
            "Both above",
            "None Above",
          ],
          correctChoice: 0),
      // widgets related questions
      QuestionModel(
          question: "Can we assign values in dart like this byte val=22; ",
          anslist: [
            "Yes",
            "No",
          ],
          correctChoice: 1),
      QuestionModel(
          question: "Types of custom Widgets?",
          anslist: [
            "Stateless",
            "StateFul",
            "None",
            "A and B",
          ],
          correctChoice: 3),
      QuestionModel(
          question: "Which of following is not supported Flutter Framework?",
          anslist: [
            "Gif",
            "Esp",
            "Png",
            "Wbmp",
          ],
          correctChoice: 1),
      QuestionModel(
          question: "What is size of Int Variable ?",
          anslist: [
            "8 bit",
            "16 bit",
            "32 bit",
            "64 bit",
          ],
          correctChoice: 2),
      QuestionModel(
          question: "What is size of Float Variable ?",
          anslist: [
            "8 bit",
            "16 bit",
            "32 bit",
            "64 bit",
          ],
          correctChoice: 2),
      QuestionModel(
          question: "What is Default value of Int variable",
          anslist: [
            "null",
            "0",
            "Depend upon a variable",
            "Not Assigned",
          ],
          correctChoice: 1),
      QuestionModel(
          question: "What is default value of an Instance Variable  ",
          anslist: [
            "null",
            "0",
            "Depend upon the type of variable",
            "Not Assigned",
          ],
          correctChoice: 2),
      QuestionModel(
          question: "What is default value of an Local Variable  ",
          anslist: [
            "null",
            "0",
            "Depend upon the type of variable",
            "Not Assigned",
          ],
          correctChoice: 3),
      QuestionModel(
          question: "What is Container  ",
          anslist: [
            "Used to display Text",
            "Used to Display videos",
            "Used to contain Child Elements",
            "None",
          ],
          correctChoice: 2),
      QuestionModel(
          question: "What is size of byte Variable  ",
          anslist: [
            "8 bit",
            "16 bit",
            "32 bit",
            "64 bit",
          ],
          correctChoice: 0),
      QuestionModel(
          question: "What is size of short Variable  ",
          anslist: [
            "8 bit",
            "16 bit",
            "32 bit",
            "64 bit",
          ],
          correctChoice: 2),
      QuestionModel(
          question: "Specifying the seperator betweeen each item using?",
          anslist: [
            "ListView.builder",
            "ListView.itemSeparter",
            "ListView.custom",
            "ListView.separated",
          ],
          correctChoice: 3),
      QuestionModel(
          question: "What is Sliver in Flutter?",
          anslist: [
            "Store data in common database",
            "Hidden task executor",
            "Padding in layout",
            "A portion of a scrollable area",
          ],
          correctChoice: 3),
      QuestionModel(
          question: "What is Sliver in Flutter?",
          anslist: [
            "Store data in common database",
            "Hidden task executor",
            "Padding in layout",
            "A portion of a scrollable area",
          ],
          correctChoice: 3),
      QuestionModel(
          question: "To get maximum width and height,you should set?",
          anslist: [
            "double.INFINITY",
            "double.width.height",
            "double.Constraints",
            "None of All Above",
          ],
          correctChoice: 0),
    ];

    return totalQuestionList;
  }

  getProgramList() {
    String _commonImagePrefix = "assets/icons/";
    String _commonPrimaryUrl = "assets/webpages/primaryhtml/";
    String _commonExplanationUrl="assets/webpages/explanation/";
    String _commonYamlUrl = "assets/webpages/yaml/";
    String _commonInfoPistUrl = "assets/webpages/infoPist/";

    List<WebLoadModel> itemList = [
      WebLoadModel(
          programName: "Text",
          imagelink: "assets/icons/letter.svg",
          map_url: {
            "primaryUrl": _commonPrimaryUrl+"textpp.txt",
            "yaml": null,
            "explanation": "assets/webpages/explanation/TextExp.html",
            "android_manifest": null,
            "infopist": null,
            "readonline": null,
          },
          yamlUrl: "Text",
          ProjectLoad: ProjectLoad(),
          trigger: WebLoadModel.COMMONCODEAREA_STATELESS),
      WebLoadModel(
          programName: "Text Input",
          imagelink: "assets/icons/text-editor.svg",
          map_url: {
            "primaryUrl": "assets/webpages/primaryhtml/textinputexample.txt",
            "yaml": null,
            "explanation": "assets/webpages/explanation/TextInputExp.html",
            "android_manifest": null,
            "infopist": null,
            "readonline": null,
          },
          yamlUrl: "Text",
          ProjectLoad: ProjectLoad(),
          trigger: WebLoadModel.COMMONCODEAREA_STATEFULL),
      WebLoadModel(
          programName: "Stack",
          imagelink: "assets/icons/layer.svg",
          map_url: {
            "primaryUrl": "assets/webpages/primaryhtml/stack.txt",
            "yaml": null,
            "explanation": "assets/webpages/explanation/stackExp.html",
            "android_manifest": null,
            "infopist": null,
            "readonline": null,
          },
          yamlUrl: "Text",
          ProjectLoad: ProjectLoad(),
          trigger: WebLoadModel.COMMONCODEAREA_STATELESS),
      WebLoadModel(
          programName: "Button Examples",
          imagelink: null,
          map_url: null,
          yamlUrl: null,
          ProjectLoad: null,
          trigger: WebLoadModel.TITLE),
      WebLoadModel(
          programName: "Raised Button",
          imagelink: "assets/icons/btn1.svg",
          map_url: {
            "primaryUrl": "assets/webpages/primaryhtml/raisedbuttonexample.txt",
            // "primaryUrl": "assets/webpages/pg.html",
            "yaml": null,
            "explanation": "assets/webpages/explanation/raisedbtnExp.html",
            "android_manifest": null,
            "infopist": null,
            "readonline": null,
          },
          yamlUrl: "Text",
          ProjectLoad: ProjectLoad(),
          trigger: WebLoadModel.COMMONCODEAREA_STATEFULL),
      WebLoadModel(
          programName: "Drop Down Button",
          imagelink: "assets/icons/btn2.svg",
          map_url: {
            "primaryUrl": "assets/webpages/primaryhtml/dropdown.txt",
            "yaml": null,
            "explanation": "assets/webpages/explanation/dropdownexp.html",
            "android_manifest": null,
            "infopist": null
          },
          yamlUrl: "Text",
          ProjectLoad: ProjectLoad(),
          trigger: WebLoadModel.COMMONCODEAREA_STATEFULL),
      WebLoadModel(
          programName: "Icon Button",
          imagelink: "assets/icons/btn3.svg",
          map_url: {
            "primaryUrl": "assets/webpages/primaryhtml/iconbuttonExample.txt",
            "yaml": null,
            "explanation": "assets/webpages/explanation/iconbuttonexp.html",
            "android_manifest": null,
            "infopist": null,
            "readonline":
                "https://api.flutter.dev/flutter/material/IconButton-class.html",
          },
          yamlUrl: "Text",
          ProjectLoad: ProjectLoad(),
          trigger: WebLoadModel.COMMONCODEAREA_STATEFULL),
      WebLoadModel(
          programName: "Dialogs",
          imagelink: null,
          map_url: null,
          yamlUrl: null,
          ProjectLoad: null,
          trigger: WebLoadModel.TITLE),
      WebLoadModel(
          programName: "Toast Dialog",
          imagelink: "assets/icons/pop-up3.svg",
          map_url: {
            "primaryUrl": "assets/webpages/primaryhtml/toastexample.txt",
            "yaml": "assets/webpages/yaml/toast.html",
            "explanation": "assets/webpages/explanation/toastexp.html",
            "android_manifest": null,
            "infopist": null,
            "readonline": null,
          },
          yamlUrl: "Text",
          ProjectLoad: ProjectLoad(),
          trigger: WebLoadModel.COMMONCODEAREA_STATEFULL),
      WebLoadModel(
          programName: "Basic Alert Dialog",
          imagelink: "assets/icons/pop-up.svg",
          map_url: {
            "primaryUrl": "assets/webpages/primaryhtml/basicalert.txt",
            "yaml": null,
            "explanation": "assets/webpages/explanation/basicalertexp.html",
            "android_manifest": null,
            "infopist": null,
            "readonline": null,
          },
          yamlUrl: "Text",
          ProjectLoad: ProjectLoad(),
          trigger: WebLoadModel.COMMONCODEAREA_STATEFULL),
      WebLoadModel(
          programName: "TextField AlertDialog need repair",
          imagelink: "assets/icons/pop-up1.svg",
          map_url: {
            "primaryUrl":
                "assets/webpages/primaryhtml/textinputdialogexample.html",
            "yaml": null,
            "explanation": "assets/webpages/programnotfound.html",
            "android_manifest": null,
            "infopist": null,
            "readonline": null,
          },
          yamlUrl: "Text",
          ProjectLoad: ProjectLoad(),
          trigger: WebLoadModel.COMMONCODEAREA_STATEFULL),
      WebLoadModel(
          programName: "Simple Image Display",
          imagelink: _commonImagePrefix + "picture.svg",
          map_url: {
            "primaryUrl":
                _commonPrimaryUrl+"simpleimage.txt",
            "yaml": null,
            "explanation": _commonExplanationUrl+"simpleImage.html",
            "android_manifest": null,
            "infopist": null,
            "readonline": null,
          },
          yamlUrl: "Text",
          ProjectLoad: ProjectLoad(),
          trigger: WebLoadModel.COMMONCODEAREA_STATELESS),
    ];

    return itemList;
  }

  getDrawer(BuildContext _buildcontext) {
    return new Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Parmeet Singh Sachdeva"),
            accountEmail: Text(""),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text(
                "P",
                style: TextStyle(fontSize: 25.0),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Follow Me On:",
                style: TextStyle(
                    color: Colors.grey[500], fontWeight: FontWeight.bold),
              )),
          ListTile(
            leading: Icon(Icons.camera),
            title: Text("Follow Me On Instagram"),
            onTap: () {
              (() async {
                const url = 'https://www.instagram.com/parmeets_/';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              }());
            },
          ),
          Divider(
            color: Colors.grey[500],
          ),
          ListTile(
            leading: Icon(Icons.money),
            title: Text("Download Video Seassion"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Rating"),
            onTap: () {
              (() async {
                const url =
                    'https://play.google.com/store/apps/details?id=com.learnflutter.flutter';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              }());
            },
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.bookmark),
            title: Text("Feedback"),
            onTap: () {
              (() async {
                const url =
                    'mailto:parmeets834@gmail.com?subject=FeedBack for Flutter Tutorials App&body=I want plz add this feature';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              }());
            },
          ),
          Divider(
            color: Colors.grey[500],
          ),
          Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Share:",
                style: TextStyle(
                    color: Colors.grey[500], fontWeight: FontWeight.bold),
              )),
          ListTile(
              leading: Icon(Icons.share),
              title: Text("Share Application"),
              onTap: () {
                (() {
                  Share.share(
                      'This is Playstore No.1 Flutter Learning App \n https://play.google.com/store/apps/details?id=com.learnflutter.flutter',
                      subject: 'Look what I made!');
                }());

                Navigator.pop(_buildcontext);
              }),
          Divider(
            color: Colors.grey[500],
          ),
          Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Help:",
                style: TextStyle(
                    color: Colors.grey[500], fontWeight: FontWeight.bold),
              )),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text("Contact Us"),
            onTap: () {
              (() async {
                const url = 'https://www.linkedin.com/in/parmeets834/';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              }());
            },
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.shieldVirus),
            title: Text("Privacy and Policy"),
            onTap: () {
              Navigator.pop(_buildcontext);
            },
          ),
        ],
      ),
    );
  }
}
