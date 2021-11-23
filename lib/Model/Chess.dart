

// ignore_for_file: file_names

import 'dart:ui';

import 'package:flutter/material.dart';

class ChessPlayer {
  final int id;
  late final String name;
  final String image;
  final Color color1;
  final Color color2;

  ChessPlayer({required this.id ,required this.color1,required this.color2, required this.image});
}

List<ChessPlayer> ChessBoard = [
  ChessPlayer(id: 0, color1: Colors.black, color2: Colors.white, image: "assets/images/2.png"),
  ChessPlayer(id: 1 ,color1: Colors.white, color2: Colors.black, image: "assets/images/1.png")
];

List<int> historyLog = [0];

