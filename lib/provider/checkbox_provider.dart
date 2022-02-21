import 'package:flutter/material.dart';

class CheckBoxProvider extends ChangeNotifier {
  List color = [
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
  ];
  bool check = false;
  int index1 = 0;
  int item1 = 0;
  List icon = [
    Icon(Icons.circle_outlined,color: Colors.grey,),
    Icon(Icons.circle_outlined,color: Colors.grey,),
    Icon(Icons.circle_outlined,color: Colors.grey,),
    Icon(Icons.circle_outlined,color: Colors.grey,),
  ];

  void correctFunction(index) {
    color[index] = Colors.green;
    icon[index] = Icon(Icons.check_circle,color: Colors.green,);
    check = true;
    notifyListeners();
  }

  void wrongFunction(index,item){
    index1 = index;
    item1 = item;
    color[item] = Colors.red;
    icon[item] = Icon(Icons.cancel,color: Colors.red,);
    color[index] = Colors.green;
    icon[index] = Icon(Icons.check_circle,color: Colors.green,);
    check = true;
    notifyListeners();
  }

  void finishFunction(index,item){
    color[item] = Colors.grey;
    icon[item] = Icon(Icons.circle_outlined,color: Colors.grey,);
    color[index] = Colors.grey;
    icon[index] = Icon(Icons.circle_outlined,color: Colors.grey,);
    check = false;
    notifyListeners();
  }
}
