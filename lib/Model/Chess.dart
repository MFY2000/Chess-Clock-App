

// ignore_for_file: file_names

import 'dart:ui';

import 'package:chesss_watch/Custom/Timer.dart';
import 'package:flutter/material.dart';

class ChessPlayer {
  late final String name;
  final String image;
  final Color color1;
  final Color color2;

  ChessPlayer({required this.color1,required this.color2, required this.image});
}

List<ChessPlayer> ChessBoard = [
  ChessPlayer(color1: Colors.black, color2: Colors.white, image: "assets/images/2.png"),
  ChessPlayer(color1: Colors.white, color2: Colors.black, image: "assets/images/1.png"),

];