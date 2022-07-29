import 'package:app/core/components/text_style/text_styles.dart';
import 'package:app/core/constants/color_const/color_const.dart';
import 'package:app/provider/color_change_notifier.dart';
import 'package:app/view/quiz_view/_widget/exit_show_dialog.dart';
import 'package:app/widget/button_container.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class QuizView extends StatelessWidget {
  const QuizView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_outlined,
                color: context.watch<ColorChangeNotifier>().colorP, size: 30.sp),
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
                "5/50",
                style: TextStyleComp.style500(
                    color: context.watch<ColorChangeNotifier>().colorP, size: 22),
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
                    "Let us know how we can help you",
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
                    "Let us know how we can help you",
                    style: TextStyleComp.style500(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 100.h,
                child: Image.asset("assets/image/1_bolim/1.png"),
              ),
              CircleAvatar(radius: 30.r),
              for(var i =0; i<5;i++)
              Container(
                margin: EdgeInsets.symmetric(vertical: 7.5.h),
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: ColorConst.instance.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0,12),
                      color: const Color.fromRGBO(158, 158, 158, 1).withOpacity(.22),
                      blurRadius: 10.r
                    ),
                  ]
                ),
              ),
              SizedBox(height: 70.h),
              ButtonContainer(
                color: context.watch<ColorChangeNotifier>().colorP,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
