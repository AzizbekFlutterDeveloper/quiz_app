import 'package:app/core/data/1_bolim/bolim_1_list_data.dart';
import 'package:app/core/data/2_bolim/bolim_2_list_data.dart';
import 'package:app/core/data/3_bolim/bolim_3_list_data.dart';
import 'package:app/core/data/4_bolim/bolim_4_list_data.dart';
import 'package:app/core/data/5_bolim/bolim_5_list_data.dart';
import 'package:flutter/widgets.dart';

class QuizNotifier extends ChangeNotifier{
  List quizs = [
    Bolim1.quiz,
    Bolim2.quiz,
    Bolim3.quiz,
    Bolim4.quiz,
    Bolim5.quiz
  ];
  
  
  
}