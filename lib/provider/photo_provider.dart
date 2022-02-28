import 'dart:io';

import 'package:flutter/widgets.dart';

class PhotoProvider extends ChangeNotifier{
  File picture = File("");

  void addPicture(v){
    picture = File(v.path);
    notifyListeners();
  }
}