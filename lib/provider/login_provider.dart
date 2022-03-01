import 'dart:io';

import 'package:flutter/material.dart';

import '../core/data.dart';
import '../model/model.dart';
import '../service/box_hive.dart';

class LoginProvider extends ChangeNotifier{
  TextEditingController? controller = TextEditingController();
  Color container = Colors.transparent;
  Color text = Colors.white;
  File picture = File("");
  String til = "O'zbekcha";
  int index = 0;

  String name = "";
  nameCha(String ism){
    name = ism;

    notifyListeners();

  }
  
  void tilAlmash(name){
    til = tillar[name];
    index = name;
    notifyListeners();
  }
  
  void next(){
    if(controller!.text.length > 2){
      container = Colors.white;
      text = Color(0xff4361EE);
    } 
  }

  Future addClients() async {
    
    final client = Model()
      ..name = controller!.text
      ..img = picture.path
      ..id = index;

    final box = BoxServise.getbox();
    box.add(client);
    print(box.values);
    notifyListeners();
  }

  

  void addPicture(v){
    picture = File(v.path);
    notifyListeners();
  }

}