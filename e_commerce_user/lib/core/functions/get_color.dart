import 'package:flutter/material.dart';

Color getColorFromString(String colorString) {
  final colorName = colorString.trim().toLowerCase();
  final colorMap = {
    'amber': Colors.amber,
    'black': Colors.black,
    'blue': Colors.blue,
    'bluegrey': Colors.blueGrey,
    'brown': Colors.brown,
    'cyan': Colors.cyan,
    'deeporange': Colors.deepOrange,
    'deeppurple': Colors.deepPurple,
    'green': Colors.green,
    'grey': Colors.grey,
    'indigo': Colors.indigo,
    'lightblue': Colors.lightBlue,
    'lightgreen': Colors.lightGreen,
    'lime': Colors.lime,
    'orange': Colors.orange,
    'pink': Colors.pink,
    'purple': Colors.purple,
    'red': Colors.red,
    'teal': Colors.teal,
    'transparent': Colors.transparent,
    'white': Colors.white,
    'silver': Colors.grey,
    'yellow': Colors.yellow,
  };
  Color myColor = colorMap[colorName] ?? Colors.black;
  return myColor;
}
