import 'package:app/core/components/text_style/text_styles.dart';
import 'package:app/core/constants/color_const/color_const.dart';
import 'package:app/core/extension/string_extension_locale.dart';
import 'package:app/core/init/lang/lang_keys.g.dart';
import 'package:app/provider/color_change_notifier.dart';
import 'package:app/widget/button_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ShowDialogExitApp {
  static init(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        content: Container(
          height: 140.h,
          width: 300.w,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: ColorConst.instance.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Rostan ham dasturdan chiqishni xoxlaysizmi?",
                style: TextStyleComp.style400(color: Colors.black),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Container(
                      height: 40.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: context.watch<ColorChangeNotifier>().colorP,
                      ),
                      child: Center(
                        child: Text(
                          LocaleKeys.ha.t,
                          style: TextStyleComp.style600(size: 16),
                        ),
                      ),
                    ),
                    onTap: (){
                      SystemNavigator.pop();
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      height: 40.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: ColorConst.instance.red,
                      ),
                      child: Center(
                        child: Text(
                          LocaleKeys.yoq.t,
                          style: TextStyleComp.style600(size: 16),
                        ),
                      ),
                    ),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
