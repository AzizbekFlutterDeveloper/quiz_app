import 'package:app/core/sizeconfige/colors.dart';
import 'package:app/core/sizeconfige/size_config.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';

class CheckBoxProvider extends ChangeNotifier {
  List color = [
    MyColors.myWhite,
    MyColors.myWhite,
    MyColors.myWhite,
  ];
  List textColor = [
    MyColors.myBlue,
    MyColors.myBlue,
    MyColors.myBlue,
  ];
  bool check = false;
  int item = 0;
  List icon = [
    Icon(Icons.circle,color: Color(0xffDFDFE2),size: getHeight(28),),
    Icon(Icons.circle,color: Color(0xffDFDFE2),size: getHeight(28)),
    Icon(Icons.circle,color: Color(0xffDFDFE2),size: getHeight(28)),
  ];

  void correctFunction(index) {
    item = index;
    textColor[index] = MyColors.myWhite;
    color[index] =  MyColors.myBlue;
    icon[index] = Icon(Icons.check_circle,color: MyColors.myWhite,);
    check = true;
    notifyListeners();
  }

  void wrongFunction(index){
    item = index;
    color[index] = Colors.red;
    textColor[index] = MyColors.myWhite;
    icon[0] = Icon(Icons.check_circle,color: MyColors.myBlue,);
    icon[index] = Icon(Icons.cancel,color: MyColors.myWhite,);
    check = true;
    notifyListeners();
  }

  void finishFunction(index){
    color[index] = MyColors.myWhite;
    icon[index] = Icon(Icons.circle,color: Color(0xffDFDFE2),);
    textColor[index] = MyColors.myBlue;
    check = false;
    notifyListeners();
  }
}
