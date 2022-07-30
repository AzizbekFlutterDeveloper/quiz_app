import 'package:app/core/constants/color_const/color_const.dart';
import 'package:app/core/constants/enum/locale_keys_enum.dart';
import 'package:app/core/data/1_bolim/bolim_1_list_data.dart';
import 'package:app/core/data/list_data/list_data.dart';
import 'package:app/core/init/cache/locale_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimerNotifier extends ChangeNotifier {
  List circleColor = List.generate(
    5,
    (index) => Icon(
      Icons.circle,
      color: ColorConst.instance.grey.withOpacity(0.25),
      size: 30.sp,
    ),
  );
  List textColor = List.generate(5, (index) => Colors.black);
  List containerColor = List.generate(5, (index) => ColorConst.instance.white);
  Color colorP = LocaleListData.colors[
      int.parse(LocaleManeger.instance.getStringValue(PreferenceKeys.COLOR))];
  int quizCount = 0;
  bool isActive = true;
  int togriCount = 0;
  int pageCount = 0;
  int timer = 15;
  bool isButton = false;

  void addPageConut(int i) {
    pageCount = i;
    quizCount = int.parse(LocaleManeger.instance
        .getStringValue(LocaleListData.localeQuizCount[i]));
    togriCount = int.parse(LocaleManeger.instance
        .getStringValue(LocaleListData.localeTogriCount[i]));
    notifyListeners();
  }

  void quizCheck(String name, int index) {
    isButton = true;
    if (Bolim1.quiz[1]['togri'] == name) {
      containerColor[index] = colorP;
      circleColor[index] = Icon(
        Icons.check_circle,
        color: ColorConst.instance.white,
        size: 28.sp,
      );
      togriCount += 1;
      LocaleManeger.instance.setStringValue(
          LocaleListData.localeTogriCount[pageCount], togriCount.toString());
      textColor[index] = ColorConst.instance.white;
      notifyListeners();
    } else {
      containerColor[index] = ColorConst.instance.red;
      textColor[index] = ColorConst.instance.white;
      circleColor[index] = Icon(
        Icons.cancel,
        color: ColorConst.instance.white,
        size: 28.sp,
      );
      notifyListeners();
    }
  }

  void removeActive() {
    timer = 15;
    notifyListeners();
  }

  void addQuiz() {
    textColor.clear();
    circleColor.clear();
    containerColor.clear();
    isButton = false;
    quizCount += 1;
    LocaleManeger.instance.setStringValue(
        LocaleListData.localeQuizCount[pageCount], quizCount.toString());
    textColor = List.generate(5, (index) => Colors.black);
    containerColor = List.generate(5, (index) => ColorConst.instance.white);
    circleColor = List.generate(
      5,
      (index) => Icon(
        Icons.circle,
        color: ColorConst.instance.grey.withOpacity(0.25),
        size: 30.sp,
      ),
    );
    notifyListeners();
  }
}
