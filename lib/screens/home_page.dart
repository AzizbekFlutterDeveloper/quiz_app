import 'package:app/core/contanier_consts.dart';
import 'package:app/provider/checkbox_provider.dart';
import 'package:app/provider/page_second_provider.dart';
import 'package:app/service/service_animation.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_timer/simple_timer.dart';

import '../core/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

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

  int son = 0;
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
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              myShow(size);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.2,
                      width: size.width * 0.9,
                      child: Center(child: AutoSizeText(quiz[1]['savol'])),
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
                                    setState(() {
                                      son = index;
                                    });
                                    if (quiz[0]["togri"] == index) {
                                      context
                                          .read<CheckBoxProvider>()
                                          .correctFunction(index);
                                    } else {
                                      context
                                          .read<CheckBoxProvider>()
                                          .wrongFunction(index);
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

  start() async {
    Future.delayed(Duration(seconds: 1))
        .then((value) => _timerController!.start());
  }

  finish() async {
    Future.delayed(Duration(seconds: 16)).then((value) {
      context.read<PageParovider>().page();
      context.read<CheckBoxProvider>().finishFunction(son);
      Navigator.pushNamed(context, '/bolim');
    });
  }

  myShow(Size size) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            height: size.height * 0.2,
            width: size.width * 0.6,
            decoration: BoxDecoration(
              borderRadius: MyContanier.myBorder,
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.12,
                  width: size.width * 0.6,
                  child: Center(
                      child: Text(
                    "Bosh Menuga qaytishni xoxlaysizmi?",
                    textAlign: TextAlign.center,
                  )),
                ),
                SizedBox(
                  height: size.height * 0.07,
                  width: size.width * 0.6,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          child: Text("Yo'q",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: Text("Ha",
                           style: TextStyle(
                             color: Colors.green,
                           ),
                          ),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(context, '/asosiy', (route) => false);
                         },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
