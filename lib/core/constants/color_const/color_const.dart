import 'package:flutter/material.dart';

class ColorConst {
  static final ColorConst _instance = ColorConst._init();
  static ColorConst get instance => _instance;

  Color blue = Color(0xff4361EE);
  Color white = Colors.white;
  Color red = Color(0xffEC1F2C);
  Color orange = Color(0xffF56F15);
  Color green = Color.fromARGB(255, 23, 174, 31);
  Color yellow = Colors.yellow;
  
  ColorConst._init();
}