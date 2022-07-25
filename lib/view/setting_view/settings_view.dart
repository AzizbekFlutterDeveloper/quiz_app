import 'package:app/core/components/text_style/text_styles.dart';
import 'package:app/core/constants/color_const/color_const.dart';
import 'package:app/core/extension/string_extension_locale.dart';
import 'package:app/core/init/lang/lang_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 300.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20.r)),
                color: ColorConst.instance.blue,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20.h),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_outlined,
                            color: ColorConst.instance.white,
                            size: 30.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 60.r,
                    backgroundColor: ColorConst.instance.white,
                  ),
                  SizedBox(height: 10.h),
                  Text("Ism: Azizbek", style: TextStyleComp.style600(size: 25)),
                  SizedBox(height: 15.h),
                  Text("Ro'yhatdan o'tgan sanasi:",
                      style: TextStyleComp.style400()),
                  Text("2022-07-21", style: TextStyleComp.style400()),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dastur haqida:",
                    style: TextStyleComp.style700(color: Colors.black),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    """Klassik matn "baliq". Bu Mark Tullius Tsitseronning eramizdan avvalgi 45-yilda yozilgan "Yaxshilik va yomonlik chegarasi to'g'risida falsafiy risolasidan buzilgan parchadir. e. lotin tilida o'xshashlikning """,
                    style: TextStyleComp.style400(size: 14, color: Colors.black),
                  ),
                  SizedBox(height: 120.h),
                  for (var i = 0; i < 2; i++)
                    Container(
                      height: 64.h,
                      width: 335.w,
                      margin: EdgeInsets.symmetric(vertical: 15.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: ColorConst.instance.blue),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Icon(Icons.settings_outlined,
                              color: ColorConst.instance.blue, size: 30.sp),
                          title: Text(
                            LocaleKeys.sozlash.t,
                            style: TextStyleComp.style500(
                              size: 20,
                              color: ColorConst.instance.blue,
                            ),
                          ),
                          minLeadingWidth: 95.w,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
