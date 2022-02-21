
import 'package:flutter/material.dart';
import 'package:simple_timer/simple_timer.dart';

class PageParovider extends ChangeNotifier {
   int index = 0; 
  
  void page(){
    index += 1;
    notifyListeners();
  }
}