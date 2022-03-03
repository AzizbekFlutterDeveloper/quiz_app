import 'package:app/provider/checkbox_provider.dart';
import 'package:app/provider/login_provider.dart';
import 'package:app/provider/page_second_provider.dart';
import 'package:app/router/my_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{ 
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CheckBoxProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageParovider(),
        ),
        ChangeNotifierProvider(create: (context) => LoginProvider(),),
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
    context.read<LoginProvider>().nameCha();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: context.watch<LoginProvider>().name == null ? "/" : "/home",
      onGenerateRoute: _forRoute.router,
    );
  }
}
