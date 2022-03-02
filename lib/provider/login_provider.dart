import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/data.dart';
import '../core/sizeconfige/colors.dart';

class LoginProvider extends ChangeNotifier{
  late TextEditingController? controller = TextEditingController(text: name);
  Color container = Colors.transparent;
  Color text = MyColors.myWhite;
  File picture = File("");
  String til = "O'zbekcha";
  int? index = 0;
  String name = "";
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> counter;
  
  void addDB()async{
    final SharedPreferences prefs = await _prefs;
    await prefs.setInt('til', index ?? 0);
    await prefs.setString("name", controller!.text);

    name = prefs.getString("name")?? ""; 
    notifyListeners();
  }
   

  nameCha(String ism){
    name = ism;
    notifyListeners();

  }
  
  void tilAlmash(name)async{
    final SharedPreferences prefs = await _prefs;
    await prefs.setInt('til', name ?? 0);
    til = tillar[name];
    index = prefs.getInt("til");
    notifyListeners();
  }

  
  void next(){
    if(controller!.text.length > 2){
      container = MyColors.myWhite;
      text =  MyColors.myBlue;
      notifyListeners();
    } 
  }

  

  

  void addPicture(v){
    picture = File(v.path);
    
    notifyListeners();
  }

}