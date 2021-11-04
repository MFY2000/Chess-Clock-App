// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:chesss_watch/Model/Chess.dart';
import 'package:flutter/material.dart';

class ClockCard extends StatefulWidget {
  final int index;
  const ClockCard({Key? key, required this.index}) : super(key: key);

  @override
  _ClockCardState createState() => _ClockCardState();
}

class _ClockCardState extends State<ClockCard> {
  late var width, height;
  late ChessPlayer player;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    player = ChessBoard[widget.index];

    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(player.image, fit: BoxFit.fill, height: (height * 0.25)),
          Text(
            "9:59:59",
            style: TextStyle(color: player.color, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
