import 'package:app/core/constants/color_const/color_const.dart';
import 'package:flutter/widgets.dart';

class ColorChangeNotifier extends ChangeNotifier{

  Color colorP = ColorConst.instance.blue;
  List colors = [
    ColorConst.instance.blue,
    ColorConst.instance.green,
    ColorConst.instance.orange,
    ColorConst.instance.grey,
    ColorConst.instance.yellow,
  ];
  void changeColor(int i){
    colorP = colors[i];
    notifyListeners();
  }
}