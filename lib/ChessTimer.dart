// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ChessTimer extends StatefulWidget {
  final Map<String, String> player;
  const ChessTimer({Key? key, required this.player}) : super(key: key);

  @override
  _ChessTimerState createState() => _ChessTimerState();
}

class _ChessTimerState extends State<ChessTimer> {
  late var width, height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(

        // backgroundColor: const Color(0xffffffff),
        body: Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            width: width,
            height: height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"), fit: BoxFit.fill),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: (height * 0.15),
                ),

                SizedBox(
                  width  : (width * 0.5),
                  height : (height * 0.5),
                  child: Stack(children: [
                    Image.asset("assets/images/1.png", fit: BoxFit.fill, height : (height * 0.25)),
                    Positioned(top: height * 0.105,right: width * 0.175,  child: Text("data"))  ,
                  ],),
                )

              ],
            )));
  }
}
