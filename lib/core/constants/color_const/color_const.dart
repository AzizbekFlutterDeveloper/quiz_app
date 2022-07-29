import 'package:flutter/material.dart';

class ColorConst {
  static final ColorConst _instance = ColorConst._init();
  static ColorConst get instance => _instance;

  Color blue = Color(0xff4361EE);
  Color white = Colors.white;
  Color red = Color(0xffEC1F2C);
  Color orange = Color(0xffF56F15);
  Color green = Color.fromARGB(255, 2, 126, 8);
  Color yellow = Color.fromARGB(255, 232, 209, 3);
  Color grey = Color.fromARGB(255, 3, 27, 72);

  ColorConst._init();
}