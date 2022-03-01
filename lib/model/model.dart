import 'package:hive/hive.dart';
part 'model.g.dart';
@HiveType(typeId: 0)
class Model{
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? img;
  @HiveField(2)
  int? id;

  Model({this.id,this.img,this.name});
}