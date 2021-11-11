// ignore_for_file: prefer_const_constructors

import 'package:chesss_watch/ChessTimer.dart';
import 'package:chesss_watch/Custom/TextFeild.dart';
import 'package:chesss_watch/Custom/Timer.dart';
import 'package:chesss_watch/Model/Chess.dart';
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
      
      home: MyHomePage(title: 'Chess Watch',),
    );
  }
}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key,required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  late bool start;

  late TimerController _timerController1;
  late TimerController _timerController2;
  final TimerStyle _timerStyle = TimerStyle.ring;
  TimerProgressTextCountDirection _progressTextCountDirection = TimerProgressTextCountDirection.count_down;


  @override
  void initState() {
    // initialize timercontroller
    start = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: <Widget>[
          SimpleTimer(
            duration: const Duration(seconds: 600),
            controller: _timerController1,
            timerStyle: _timerStyle,
            onTapClock: onTapStart,
            progressTextCountDirection: _progressTextCountDirection,
          ),

          SimpleTimer(
            duration: const Duration(seconds: 600),
            controller: _timerController2,
            timerStyle: _timerStyle,
            onTapClock: onTapStart,
            progressTextCountDirection: _progressTextCountDirection,
          ),
          
          ],
      ),
    );
  }

  void onTapStart(){
    if(start){
      _timerController2.start();
      _timerController1.stop();
    }
    else{
      _timerController2.stop();
      _timerController1.start();
    }

    setState(() {
      start = !start;
    });
  }


  void _setCountDirection(TimerProgressTextCountDirection countDirection) {
    setState(() {
      _progressTextCountDirection = countDirection;
    });
  }

}


