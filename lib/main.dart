// ignore_for_file: prefer_const_constructors

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
      title: 'Chess Watch',
      
      home: StartScreen(),
    );
  }
}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  late int start;
  late List<ChessPlayer> lst;
  TimerStyle _timerStyle = TimerStyle.ring;
  TimerProgressTextCountDirection _progressTextCountDirection = TimerProgressTextCountDirection.count_down;


  @override
  void initState() {
    // initialize timercontroller
    lst = ChessBoard;
    start = 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: <Widget>[
          ClockCard(
            chessSide: ChessBoard[1],
            start: start == 1 ,
            timerStyle: _timerStyle,
            onTapClock: onTapStart,
            progressTextCountDirection: _progressTextCountDirection,
          ),

          ClockCard(
            chessSide: ChessBoard[0],
            start: start == 0,
            timerStyle: _timerStyle,
            onTapClock: onTapStart,
            progressTextCountDirection: _progressTextCountDirection,
          ),
          
          
          

          ],
      ),
    );
  }

  void onTapStart(){
    setState(() {
      start = start == 0 ? 1: 0;
    });
  }


  void _setCountDirection(TimerProgressTextCountDirection countDirection) {
    setState(() {
      _progressTextCountDirection = countDirection;
    });
  }

}

