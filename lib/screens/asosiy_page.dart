import 'package:app/core/sizeconfige/colors.dart';
import 'package:app/core/sizeconfige/size_config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:simple_timer/simple_timer.dart';

class AsosiyPage extends StatefulWidget {
  const AsosiyPage({Key? key}) : super(key: key);

  @override
  State<AsosiyPage> createState() => _AsosiyPageState();
}

class _AsosiyPageState extends State<AsosiyPage>
    with SingleTickerProviderStateMixin {
  TimerController? _timerController;

  @override
  void initState() {
    super.initState();
    _timerController = TimerController(this);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: MyColors.myBlue,
              size: getHeight(27),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(getHeight(16)),
              child: Text(
                "2/10",
                style: TextStyle(
                  color: MyColors.myBlue,
                  fontSize: getHeight(20),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ]),
      body: Column(
        children: [
          SizedBox(
            width: getWidth(375),
            height: getHeight(15),
          ),
          SizedBox(
            height: getHeight(155),
            width: getWidth(292),
            child: AutoSizeText(
              "Savollar shu yerda yoziladi, Qancha soz sizgishi aniqmas, kdmfw a ianfcec we kwme wnfiwr fwr ksig, efnwienf inenfiwemf ,eifniwnefn, nfiwnf",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: MyColors.myBlue,
                fontSize: getHeight(25),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          InkWell(
            child: CircleAvatar(
              radius: getHeight(40),
              backgroundColor: Colors.transparent,
              child: SimpleTimer(
                duration: const Duration(seconds: 5),
                controller: _timerController,
                backgroundColor: MyColors.myBlue,
                progressIndicatorColor: Colors.white,
                progressIndicatorDirection:
                    TimerProgressIndicatorDirection.counter_clockwise,
                progressTextStyle: TextStyle(color: MyColors.myBlue),
                strokeWidth: getHeight(3),
              ),
            ),
            onTap: () {
              _timerController!.start();
            },
            onDoubleTap: () {
              _timerController!.reset();
            },
          ),
          SizedBox(
            height: getHeight(352),
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  height: getHeight(80),
                  width: getWidth(335),
                  margin: EdgeInsets.symmetric(
                      horizontal: getWidth(20), vertical: getHeight(7.5)),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: MyColors.myWhite,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(4, 8), // Shadow position
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
                  child: Row(
                    children: [
                      SizedBox(
                        height: getHeight(70),
                        width: getWidth(220),
                        child: Center(
                          child: AutoSizeText("I work as a tour guide for a local tour company.",
                            style: TextStyle(
                              fontSize: getHeight(18),
                              color: MyColors.myBlue,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Icon(Icons.circle,color: Color(0xffDFDFE2), size: getHeight(28),)
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            height: getHeight(64),
            width: getWidth(335),
            margin: EdgeInsets.symmetric(horizontal: getWidth(20)),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              color: MyColors.myBlue,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 4,
                  offset: const Offset(4, 8), // Shadow position
                ),
              ],
            ),
            child: Center(
              child: Text("Next",
                style: TextStyle(
                  fontSize: getHeight(18),
                  fontWeight: FontWeight.w500,
                  color: MyColors.myWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
