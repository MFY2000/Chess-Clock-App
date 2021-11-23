// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:chesss_watch/Model/Chess.dart';
import 'package:chesss_watch/Screen/Custom/ClockCard.dart';
import 'package:chesss_watch/Screen/Custom/Timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int start;
  String btnState = "Start";

  late List<ChessPlayer> lst;
  final TimerStyle _timerStyle = TimerStyle.ring;
  TimerProgressTextCountDirection _progressTextCountDirection =
      TimerProgressTextCountDirection.count_down;
  late double height, width;

  @override
  void initState() {
    // initialize timercontroller
    lst = ChessBoard;
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
          Container(
            child: Column(children: [
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
          ),
          Positioned(
            top: (height * 0.4775),
            right: (width * 0.375),
            child: GestureDetector(
              onTap: () => {toChangeState(btnState)},
              // autofocus: false,
              child: Container(
                height: (height * 0.045),
                width: (width * 0.25),
                alignment: Alignment.center,
                child: Text(
                  btnState,
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: btnState == "Start"
                      ? const Color(0xff00ff08)
                      : Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onTapStart(int index) {
    if (btnState == "Stop") {
      if (start != index) {
        print("Runing State: $start | ClickBy: $index | Log: $historyLog");

        setState(() {
          start = start == 0 ? 1 : 0;
          historyLog.add(index);
        });
        print("Runing State: $start | ClickBy: $index | Log: $historyLog \n");
      }
    }
  }

  void toChangeState(String index) {
    setState(() {
      if (index == "Start") {
        start = historyLog.last;
        btnState = "Stop";
      } else {
        start = 2;
        btnState = "Start";
      }
    });
  }

  void _setCountDirection(TimerProgressTextCountDirection countDirection) {
    setState(() {
      _progressTextCountDirection = countDirection;
    });
  }
}
