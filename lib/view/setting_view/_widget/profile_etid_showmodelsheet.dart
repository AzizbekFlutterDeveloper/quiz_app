import 'package:app/core/components/text_style/text_styles.dart';
import 'package:app/core/constants/color_const/color_const.dart';
import 'package:app/core/extension/string_extension_locale.dart';
import 'package:app/core/init/lang/lang_keys.g.dart';
import 'package:app/provider/color_change_notifier.dart';
import 'package:app/provider/name_change_notifier.dart';
import 'package:app/view/register_view/_widget/text_form_fild_register.dart';
import 'package:app/view/setting_view/_widget/light_widget.dart';
import 'package:app/widget/lang_change_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileEditShowModelSheet {
  static init(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isDismissible: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: 700.h,
        width: double.infinity,
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
          color: ColorConst.instance.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LocaleKeys.ism_familiya.t,
                style: TextStyleComp.style500(color: Colors.black)),
            SizedBox(height: 10.h),
            TextFormField(
              controller: context.watch<NameChangeNotifier>().controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(color: context.watch<ColorChangeNotifier>().colorP),
                ),
              ),
              onEditingComplete: () {
                context.read<NameChangeNotifier>().changeNameCached();
              },
            ),
            SizedBox(height: 20.h),
            Text("Til", style: TextStyleComp.style500(color: Colors.black)),
            const LangChangeContainer(
              color: Colors.black,
              top: 10,
            ),
            SizedBox(height: 10.h),
            Text("Rangi", style: TextStyleComp.style500(color: Colors.black)),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                for (var i = 0; i < 5; i++)
                  GestureDetector(
                    child: Container(
                      height: 40.h,
                      width: 49.w,
                      margin: EdgeInsets.all(7.5.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: context.watch<ColorChangeNotifier>().colors[i],
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0,8),
                            blurRadius: 14.r,
                            color: Colors.grey,
                          ),
                        ]
                      ),
                    ),
                    onTap: (){
                      context.read<ColorChangeNotifier>().changeColor(i);
                    },
                  ),
              ],
            ),
            SizedBox(height: 20.h),
            Text("Yorug'ligi", style: TextStyleComp.style500(color: Colors.black)),
            const ScreenBrightnesWidget(),
          ],
        ),
      ),
    );
  }
}
