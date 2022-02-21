import 'package:app/provider/checkbox_provider.dart';
import 'package:app/provider/page_second_provider.dart';
import 'package:app/router/my_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CheckBoxProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageParovider(),
        ),
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
