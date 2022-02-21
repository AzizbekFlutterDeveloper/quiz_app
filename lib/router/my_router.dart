import 'package:app/screens/home_page.dart';
import 'package:app/screens/login_page.dart';
import 'package:flutter/material.dart';

class MyRouter{
  Route? router(RouteSettings settings){
    final arg = settings.arguments;
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case '/home':
        return MaterialPageRoute(builder: (context) => HomePage(number: (arg as int),));
    }
  }
}