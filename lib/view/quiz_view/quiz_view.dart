import 'package:app/core/components/text_style/text_styles.dart';
import 'package:app/core/constants/color_const/color_const.dart';
import 'package:app/core/data/1_bolim/bolim_1_list_data.dart';
import 'package:app/model/quiz_model.dart';
import 'package:app/provider/color_change_notifier.dart';
import 'package:app/provider/timer_notifier.dart';
import 'package:app/view/quiz_view/_widget/exit_show_dialog.dart';
import 'package:app/widget/button_container.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:simple_timer/simple_timer.dart';

class QuizView extends StatefulWidget {
  List data;
  QuizView({Key? key, required this.data}) : super(key: key);

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView>
    with SingleTickerProviderStateMixin {
  TimerController? timerController;
  @override
  void initState() {
    super.initState();
    timerController = TimerController(this);
    start();
  }

  @override
  Widget build(BuildContext context) {
    int quizCount = context.watch<TimerNotifier>().quizCount;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConst.instance.white,
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_outlined,
                color: context.watch<ColorChangeNotifier>().colorP,
                size: 30.sp),
            onTap: () {
              ExitShowDialog.init(context);
            },
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: EdgeInsets.all(15.w),
              child: Text(
                (quizCount + 1).toString() +
                    '/' +
                    widget.data.length.toString(),
                style: TextStyleComp.style500(
                  color: context.watch<ColorChangeNotifier>().colorP,
                  size: 22,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
                child: Center(
                  child: AutoSizeText(
                    Bolim1.bolimName[0].toString(),
                    style: TextStyleComp.style600(
                      color: context.watch<ColorChangeNotifier>().colorP,
                      size: 22,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
                child: Center(
                  child: AutoSizeText(
                    widget.data[quizCount].savollar![0],
                    style: TextStyleComp.style500(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 100.h,
                child: Image.asset(widget.data[quizCount].img!),
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 30.r,
                child: SimpleTimer(
                  controller: timerController,
                  progressIndicatorColor:
                      context.watch<ColorChangeNotifier>().colorP,
                  backgroundColor: ColorConst.instance.grey.withOpacity(0.2),
                  progressTextStyle: TextStyleComp.style600(
                      color: context.watch<ColorChangeNotifier>().colorP),
                  duration:
                      Duration(seconds: context.watch<TimerNotifier>().timer),
                  progressIndicatorDirection:
                      TimerProgressIndicatorDirection.counter_clockwise,
                ),
              ),
              for (var i = 0; i < 5; i++)
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 7.5.h),
                    height: 50.h,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: context.watch<TimerNotifier>().containerColor[i],
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(2, 12),
                          color: const Color.fromRGBO(158, 158, 158, 1)
                              .withOpacity(.22),
                          blurRadius: 10.r,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                            radius: 12.r, backgroundColor: Colors.transparent),
                        Text(
                          widget.data[quizCount].javob![i],
                          style: TextStyleComp.style700(
                            color: context.watch<TimerNotifier>().textColor[i],
                            size: 22,
                          ),
                        ),
                        context.watch<TimerNotifier>().circleColor[i],
                      ],
                    ),
                  ),
                  onTap: context.watch<TimerNotifier>().isButton
                      ? null
                      : () {
                          context
                              .read<TimerNotifier>()
                              .quizCheck(widget.data[quizCount].javob![i], i);
                        },
                ),
              SizedBox(height: 70.h),
              ButtonContainer(
                color: context.watch<TimerNotifier>().isButton
                    ? context.watch<ColorChangeNotifier>().colorP
                    : context
                        .watch<ColorChangeNotifier>()
                        .colorP
                        .withOpacity(0.4),
                onTap: context.watch<TimerNotifier>().isButton
                    ? () {
                        context.read<TimerNotifier>().removeActive();
                        addCounte();
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  start() {
    Future.delayed(Duration(seconds: Provider.of<TimerNotifier>(context, listen: false).timer)).then((value) {
      addCounte();
    });
  }

  addCounte() {
    if (widget.data.length - 1 >
        Provider.of<TimerNotifier>(context, listen: false).quizCount) {
      context.read<TimerNotifier>().addQuiz();
      timerController!.restart();
      start();
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Container(
            height: 400.h,
          ),
        ),
      );
    }
  }
}
