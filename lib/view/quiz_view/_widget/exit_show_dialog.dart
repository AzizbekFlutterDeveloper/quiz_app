import 'package:app/core/components/text_style/text_styles.dart';
import 'package:app/core/constants/color_const/color_const.dart';
import 'package:app/core/extension/string_extension_locale.dart';
import 'package:app/core/init/lang/lang_keys.g.dart';
import 'package:app/provider/color_change_notifier.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ExitShowDialog {
  static init(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: BlurryContainer(
          height: 120.h,
          width: 240.w,
          padding: EdgeInsets.all(20.w),
          borderRadius: BorderRadius.circular(13.r),
          color: ColorConst.instance.white.withOpacity(0.95),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                LocaleKeys.chiqishni_hohlaysizmi.t,
                style: TextStyleComp.style500(color: Colors.black),
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
                      Navigator.pop(context);
                      Navigator.pop(context);
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