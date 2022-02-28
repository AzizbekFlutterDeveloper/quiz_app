import 'package:app/provider/checkbox_provider.dart';
import 'package:app/provider/login_provider.dart';
import 'package:app/provider/page_second_provider.dart';
import 'package:app/provider/photo_provider.dart';
import 'package:app/provider/til_provider.dart';
import 'package:app/router/my_router.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async{ 
  await Hive.initFlutter();
  await Hive.openBox("data");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CheckBoxProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageParovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TilProvider(),
        ),
        ChangeNotifierProvider(create: (context) => LoginProvider(),),
        ChangeNotifierProvider(create: (context) => PhotoProvider(),),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _forRoute = MyRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      onGenerateRoute: _forRoute.router,
    );
  }
}
