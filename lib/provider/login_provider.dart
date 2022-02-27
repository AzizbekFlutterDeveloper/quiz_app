import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginProvider extends ChangeNotifier{
  TextEditingController? controller = TextEditingController();
  Color container = Colors.transparent;
  Color text = Colors.white;
  void next(){
    if(controller!.text.length > 2){
      container = Colors.white;
      text = Color(0xff4361EE);
    } 
  }
}