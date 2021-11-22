// ignore_for_file: file_names

import 'package:chesss_watch/Model/Chess.dart';
import 'package:chesss_watch/Screen/Custom/Timer.dart';
import 'package:flutter/material.dart';

class ClockCard extends StatefulWidget {
  TimerStyle timerStyle;
  TimerProgressTextCountDirection progressTextCountDirection;
  bool start;
  final void Function(int index) onTapClock;
  final ChessPlayer chessSide;

  ClockCard(
      {Key? key,
      required this.progressTextCountDirection,
      required this.timerStyle,
      required this.start,
      required this.onTapClock,
      required this.chessSide})
      : super(key: key);

  @override
  _ClockCardState createState() => _ClockCardState();
}

class _ClockCardState extends State<ClockCard>
    with SingleTickerProviderStateMixin {
  late TimerController timerController;

  @override
  void initState() {
    // initialize timercontroller
    timerController = TimerController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.start ? timerController.start() : timerController.stop();
    return SimpleTimer(
      chessSide: widget.chessSide,
      duration: const Duration(seconds: 600),
      controller: timerController,
      timerStyle: widget.timerStyle,
      onTapClock: widget.onTapClock,
      progressTextCountDirection: widget.progressTextCountDirection,
    );
  }
}
