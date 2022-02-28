import 'package:hive_flutter/hive_flutter.dart';

import '../core/data.dart';

class BoxServise{
  static Box? box;
  static getBox()async{
    box = await Hive.openBox("data");
  }
}