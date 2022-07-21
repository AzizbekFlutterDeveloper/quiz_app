import 'package:app/core/components/text_style/text_styles.dart';
import 'package:app/core/constants/color_const/color_const.dart';
import 'package:app/core/constants/navigation_const/navigation_const.dart';
import 'package:app/core/extension/string_extension_locale.dart';
import 'package:app/core/init/lang/lang_keys.g.dart';
import 'package:app/provider/lang_change_notifier.dart';
import 'package:app/router/route/router.dart';
import 'package:app/view/register_view/_widget/text_form_fild_register.dart';
import 'package:app/widget/button_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List langList = context.watch<LangChangeNotifier>().langList;
    return Scaffold(
      backgroundColor: ColorConst.instance.blue,
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          children: [
            SizedBox(height: 90.h),
            SizedBox(
              height: 100.h,
              child: Text(
                LocaleKeys.sport_boyicha.t,
                style: TextStyleComp.style600(size: 36),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 80.h),
            RegisterTextFormField(
              hintText: LocaleKeys.ism_familiya.t,
            ),
            Container(
              height: 58.h,
              width: 327.w,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              margin: EdgeInsets.symmetric(vertical: 30.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: ColorConst.instance.white),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.watch<LangChangeNotifier>().langName, style: TextStyleComp.style400()),
                  PopupMenuButton(
                    splashRadius: 20.r,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    position: PopupMenuPosition.under,
                    icon: Icon(Icons.keyboard_arrow_down_rounded,
                        color: ColorConst.instance.white),
                    itemBuilder: (context) {
                      return [
                        for(var i =0 ; i<3;i++)
                        PopupMenuItem(
                          child: Text(
                            langList[i],
                            style: TextStyleComp.style500(
                              color: ColorConst.instance.blue,
                            ),
                          ),
                          onTap: (){
                            context.read<LangChangeNotifier>().changeLang(i,context);
                          },
                        ),
                        
                      ];
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 110.h),
            ButtonContainer(
              color: ColorConst.instance.white,
              onTap: (){
                Navigator.pushNamed(context, NavigationConst.HOME_VIEW);
              },
            ),
          ],
        ),
      ),
    );
  }
}
