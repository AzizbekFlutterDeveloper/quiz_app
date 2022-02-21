import 'package:app/core/contanier_consts.dart';
import 'package:app/provider/checkbox_provider.dart';
import 'package:app/provider/page_second_provider.dart';
import 'package:app/service/service_animation.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:circle_checkbox/redev_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_timer/simple_timer.dart';

import '../core/data.dart';

class HomePage extends StatefulWidget {
  final int number;
  const HomePage({Key? key, required this.number}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TimerController? _timerController;

  @override
  void initState() {
    _timerController = TimerController(this);
    start();
    finish();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: size.height * 0.35,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(80),
                  ),
                  color: MyContanier.correct,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(4.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.05),
                      height: size.height * 0.2,
                      width: size.width * 0.9,
                      color: Colors.transparent,
                      child: Center(child: AutoSizeText(quiz[context.watch<PageParovider>().index]['savol'])),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: size.height * 0.29,
                left: size.width * 0.38,
                child: InkWell(
                  child: CircleAvatar(
                    radius: size.width * 0.12,
                    backgroundColor: Colors.white,
                    child: SimpleTimer(
                      controller: _timerController,
                      duration: Duration(seconds: 15),
                      progressIndicatorDirection:
                          TimerProgressIndicatorDirection.counter_clockwise,
                      progressIndicatorColor: Colors.white70,
                      backgroundColor: Colors.blue.shade800,
                    ),
                  ),
                  onTap: () {
                    _timerController!.start();
                  },
                  onLongPress: () {
                    _timerController!.reset();
                  },
                ),
              ),
            ],
            clipBehavior: Clip.none,
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          SizedBox(
            height: size.height * 0.55,
            width: size.width * 0.9,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return FadeAnimation(
                  0.5,
                  MyContanier.myButtom(
                    context,
                    color: context.watch<CheckBoxProvider>().color[index],
                    elevationcolor:
                        context.watch<CheckBoxProvider>().color[index],
                    child: ListTile(
                      leading: Text(
                        "A",
                        style: TextStyle(
                          color: context.watch<CheckBoxProvider>().color[index],
                        ),
                      ),
                      title: Text(
                        "Javoblar",
                        style: TextStyle(
                          color: context.watch<CheckBoxProvider>().color[index],
                        ),
                      ),
                      trailing: IconButton(
                        icon: context.watch<CheckBoxProvider>().icon[index],
                        onPressed:
                            context.watch<CheckBoxProvider>().check == true
                                ? null
                                : () {
                                    if (quiz[0]["togri"] == index) {
                                      context
                                          .read<CheckBoxProvider>()
                                          .correctFunction(index);
                                    } else {
                                      context
                                          .read<CheckBoxProvider>()
                                          .wrongFunction(0, index);
                                    }
                                  },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  start() async{
    Future.delayed(Duration(seconds: 1)).then((value) => _timerController!.start());
  }
  finish() async{
    // int son = context.watch<PageParovider>().index;
    // int index1 = context.watch<CheckBoxProvider>().index1;
    // int item = context.watch<CheckBoxProvider>().item1;
    Future.delayed(Duration(seconds: 16)).then((value){
      context.read<PageParovider>().page();
      context.read<CheckBoxProvider>().finishFunction(0,2 );
      Navigator.pushNamed(context, '/home',arguments: 1);
    });
  }
}
