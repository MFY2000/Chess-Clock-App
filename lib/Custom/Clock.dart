// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:chesss_watch/Model/Chess.dart';
import 'package:flutter/material.dart';

class ClockCard extends StatefulWidget {
  final int index;

  late Map<String, double> Time = {"Hours": 0, "Minutes": 10, "Seconds": 0};

  ClockCard({Key? key, required this.index}) : super(key: key);

  @override
  _ClockCardState createState() => _ClockCardState();
}

class _ClockCardState extends State<ClockCard> {
  late var width, height;
  late ChessPlayer player;
  late String timeTodisplay = "00:10:00";
  late int status = 0; // 1 => Running, 0 => Stop, 3 => Timeover

  void Start() {
    status = 1;
    Running();
  }

  void Stop() {
    setState(() { status = 0; });
    print("call");
  }

  Future<void> Running() async {
    if (status == 1) {
      sleep(const Duration(seconds: 1));
      afterASecond();
      // await Future.delayed(const Duration(seconds: 1), (){ print("1"); });
    } else {
      setState(() {
        timeTodisplay = "Time over";
      });
    }
  }

  afterASecond() {
    display();

    double? Seconds = widget.Time["Seconds"];
    if (Seconds == 0) {
      if (widget.Time["Minutes"] == 0) {
        status = 3;
      } else {
        widget.Time["Seconds"] = 59;
        widget.Time["Minutes"] = (widget.Time["Minutes"]! - 1);
      }
    } else {
      widget.Time["Seconds"] = (Seconds! - 1);
    }
    Running();
  }

  void display() {
    setState(() {
      timeTodisplay = widget.Time["Hours"].toString().padRight(2) +
          " : " +
          widget.Time["Minutes"].toString().padRight(2) +
          " : " +
          widget.Time["Seconds"].toString().padRight(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    player = ChessBoard[widget.index];

    Start();


    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(player.image, fit: BoxFit.fill, height: (height * 0.25)),
          Text(
            timeTodisplay,
            style: TextStyle(color: player.color, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
