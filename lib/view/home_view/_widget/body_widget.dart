import 'package:app/core/components/text_style/text_styles.dart';
import 'package:app/core/constants/navigation_const/navigation_const.dart';
import 'package:app/core/data/1_bolim/bolim_1_list_data.dart';
import 'package:app/core/extension/string_extension_locale.dart';
import 'package:app/core/init/lang/lang_keys.g.dart';
import 'package:app/provider/color_change_notifier.dart';
import 'package:app/provider/quiz_notifier.dart';
import 'package:app/provider/timer_notifier.dart';
import 'package:app/service/test_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 240.h,
      ),
      itemBuilder: (context, index) {
        List data = Provider.of<QuizNotifier>(context,listen: false).quizs[index];
        return GestureDetector(
          child: Container(
            margin: EdgeInsets.all(10.h),
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: context.watch<ColorChangeNotifier>().colorP,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0,10),
                  blurRadius: 12.r,
                  color: Colors.grey
                ),
              ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    height: 88.h, child: Image.asset("assets/image/lock.png")),
                Text("${index + 1}-" + LocaleKeys.bolim.t,
                    style: TextStyleComp.style600()),
                Text(
                  "Bu yerda shu bolimga oid malumot boladi",
                  style: TextStyleComp.style400(size: 14),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                )
              ],
            ),
          ),
          onTap: (){
            context.read<TimerNotifier>().addPageConut(index);
            Navigator.pushNamed(context, NavigationConst.QUIZ_VIEW,arguments: QuizService().get(data));
          },
        );
      },
      itemCount: 5,
    );
  }
}
