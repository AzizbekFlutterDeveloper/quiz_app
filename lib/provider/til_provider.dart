import 'package:flutter/widgets.dart';

import '../core/data.dart';

class TilProvider extends ChangeNotifier{
  String til = "O'zbekcha";
  int index = 0;

  void tilAlmash(name){
    til = tillar[name];
    index = name;
    notifyListeners();
  }
}