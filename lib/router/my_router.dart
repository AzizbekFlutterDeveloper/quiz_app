import 'package:app/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyRouter{
  Route? router(RouteSettings settings){
    final arg = settings.arguments;
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (context) => LoginPage());
    }
  }
}