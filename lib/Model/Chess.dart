

// ignore_for_file: file_names

import 'dart:ui';

import 'package:chesss_watch/Custom/Timer.dart';
import 'package:flutter/material.dart';

class ChessPlayer {
  late final String name;
  final String image;
  final Color color;

  ChessPlayer({required this.color, required this.image});
}

List<ChessPlayer> ChessBoard = [
  ChessPlayer(color: Colors.black, image: "images/1.png"),
  ChessPlayer(color: Colors.white, image: "images/2.png"),

];