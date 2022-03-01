import 'package:hive_flutter/hive_flutter.dart';

import '../model/model.dart';

class BoxServise{
  static  Box<Model> getbox() => Hive.box<Model>('data');
  
}