import 'package:app/core/constants/navigation_const/navigation_const.dart';
import 'package:app/view/home_view/home_view.dart';
import 'package:app/view/not_view/not_view.dart';
import 'package:app/view/quiz_view/quiz_view.dart';
import 'package:app/view/register_view/register_view.dart';
import 'package:app/view/setting_view/settings_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static final Routes _instance = Routes._init();
  static Routes get instance => _instance;


  Routes._init();
  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;


    switch (settings.name) {
      case NavigationConst.HOME_VIEW:
        return simpleRoute(const HomeView());
      case NavigationConst.REGISTER_VIEW:
        return simpleRoute(const RegisterView());
      case NavigationConst.PROFILE_VIEW:
        return simpleRoute(const SettingsView());
      case NavigationConst.QUIZ_VIEW:
        return simpleRoute(const QuizView());
      default:
        return simpleRoute(const NotView());
    }
  }

simpleRoute(Widget route) => MaterialPageRoute(builder: (context) => route);

}