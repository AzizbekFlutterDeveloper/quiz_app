import 'package:app/core/data/1_bolim/bolim_1_list_data.dart';
import 'package:app/model/quiz_model.dart';

class QuizService{
  Future get()async{
    var data = Bolim1.quiz.map((e) => QuizModel.fromJson(e)).toList();
    print(data);
    return data;
  }
}