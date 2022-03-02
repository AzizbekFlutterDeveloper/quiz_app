import 'package:app/screens/acount_page.dart';
import 'package:app/screens/asosiy_page.dart';
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
        return MaterialPageRoute(builder: (context) => const HomePage());
      case '/acount':
        return MaterialPageRoute(builder: (context) => const AcountPage());
      case '/asosiy':
        return MaterialPageRoute(builder: (context) => AsosiyPage());
    
    }
  }
}