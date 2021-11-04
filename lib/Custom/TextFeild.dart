// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:chesss_watch/main.dart';

class TextFeild_ extends StatelessWidget {
  final String name;
  final Color color;
  final TextEditingController control;

  TextFeild_(
      {required this.name, required this.color, required this.control});

  @override
  Widget build(BuildContext context) {
    return Container(
        // ignore: prefer_const_constructors

        width: (MediaQuery.of(context).size.width * 0.65),
        // margin: const EdgeInsets.only(top: 20),
        child: TextField(
          autocorrect: true,
          controller: control,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            hintText: name,
            hintStyle: TextStyle(color: color),
            prefixIcon: Padding(
                padding: EdgeInsets.only(top: 0),
                child: Icon(
                  Icons.person,
                  color: color,
                )),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: color, width: 2.3),
            ),
            focusColor: color,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: color, width: 2.3),
            ),
          ),
          style: TextStyle(color: color),
        ));
  }
}
