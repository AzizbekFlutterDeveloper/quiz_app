import 'package:flutter/material.dart';

class CheckBoxProvider extends ChangeNotifier {
  List color = [
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
  ];
  bool check = false;
  int item = 0;
  List icon = [
    Icon(Icons.circle_outlined,color: Colors.grey,),
    Icon(Icons.circle_outlined,color: Colors.grey,),
    Icon(Icons.circle_outlined,color: Colors.grey,),
    Icon(Icons.circle_outlined,color: Colors.grey,),
  ];

  void correctFunction(index) {
    item = index;
    color[index] = Colors.green;
    icon[index] = Icon(Icons.check_circle,color: Colors.green,);
    check = true;
    notifyListeners();
  }

  void wrongFunction(index){
    item = index;
    color[index] = Colors.red;
    icon[index] = Icon(Icons.cancel,color: Colors.red,);
    check = true;
    notifyListeners();
  }

  void finishFunction(index){
    color[index] = Colors.grey;
    icon[index] = Icon(Icons.circle_outlined,color: Colors.grey,);
    check = false;
    notifyListeners();
  }
}
