// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:chesss_watch/ChessTimer.dart';
import 'package:chesss_watch/Custom/ClockCard.dart';
import 'package:chesss_watch/Custom/TextFeild.dart';
import 'package:chesss_watch/Custom/Timer.dart';
import 'package:chesss_watch/Model/Chess.dart';
import 'package:chesss_watch/Screen/StartInfroScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int start;
  late bool startButton;

  late List<ChessPlayer> lst;
  final TimerStyle _timerStyle = TimerStyle.ring;
  TimerProgressTextCountDirection _progressTextCountDirection =
      TimerProgressTextCountDirection.count_down;
  late double height, width;

  @override
  void initState() {
    // initialize timercontroller
    lst = ChessBoard;
    startButton = true;
    start = 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Column(children: [
            ClockCard(
              chessSide: ChessBoard[1],
              start: start == 0,
              timerStyle: _timerStyle,
              onTapClock: onTapStart,
              progressTextCountDirection: _progressTextCountDirection,
            ),
            ClockCard(
              chessSide: ChessBoard[0],
              start: start == 1,
              timerStyle: _timerStyle,
              onTapClock: onTapStart,
              progressTextCountDirection: _progressTextCountDirection,
            )
          ]),
        ],
      ),
    );
  }

  void onTapStart() {
    setState(() {
      start = start == 0 ? 1 : 0;
    });
  }

  void toChangeState() {
    setState(() {
      startButton = !startButton;
    });

    if (!startButton) {
      setState(() {
        start = 2;
      });
    } else {
      onTapStart();
    }
  }

  void _setCountDirection(TimerProgressTextCountDirection countDirection) {
    setState(() {
      _progressTextCountDirection = countDirection;
    });
  }
}
