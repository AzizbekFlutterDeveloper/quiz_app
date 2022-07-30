import 'package:app/core/data/1_bolim/bolim_1_list_data.dart';
import 'package:app/model/quiz_model.dart';

class QuizService{
  List<QuizModel> get(List list){
    var data = list.map((e) => QuizModel.fromJson(e)).toList();
    return data;
  }
}