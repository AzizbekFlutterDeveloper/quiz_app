import 'package:app/core/contanier_consts.dart';
import 'package:flutter/material.dart';
import 'package:simple_timer/simple_timer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TimerController? _timerController;

  @override
  void initState() {
    _timerController = TimerController(this);
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
                    SizedBox(
                      height: size.height * 0.3,
                      width: double.infinity,
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
                      duration: Duration(seconds: 10),
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
              itemBuilder: (context,index){
                return MyContanier.myButtom(context);
              }
            ),
          ),
        ],

      ),
    );
  }
}
