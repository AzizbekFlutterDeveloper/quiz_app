import 'package:app/core/components/text_style/text_styles.dart';
import 'package:app/core/constants/color_const/color_const.dart';
import 'package:app/core/constants/enum/locale_keys_enum.dart';
import 'package:app/core/extension/string_extension_locale.dart';
import 'package:app/core/init/cache/locale_manger.dart';
import 'package:app/core/init/lang/lang_keys.g.dart';
import 'package:app/provider/color_change_notifier.dart';
import 'package:app/provider/image_change_notifier.dart';
import 'package:app/provider/name_change_notifier.dart';
import 'package:app/service/share_service.dart';
import 'package:app/view/setting_view/_widget/profile_etid_showmodelsheet.dart';
import 'package:app/view/setting_view/_widget/profile_image_bottomsheet.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              height: 300.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20.r)),
                color: context.watch<ColorChangeNotifier>().colorP,
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
                  Badge(
                    badgeColor: ColorConst.instance.white,
                    position: BadgePosition.bottomEnd(end: 10.w),
                    badgeContent: GestureDetector(
                      child: Text(
                        "+",
                        style: TextStyleComp.style400(
                          color: context.watch<ColorChangeNotifier>().colorP,
                          size: 22,
                        ),
                      ),
                      onTap: () {
                        ProfileBottomSheet.init(context);
                      },
                    ),
                    child: CircleAvatar(
                      radius: 60.r,
                      backgroundImage: AssetImage(context.watch<ImageChange>().profileImg),
                      backgroundColor: ColorConst.instance.white,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text("Ism: "+context.watch<NameChangeNotifier>().controller.text, style: TextStyleComp.style600(size: 25)),
                  SizedBox(height: 15.h),
                  Text("Ro'yhatdan o'tgan sanasi:",
                      style: TextStyleComp.style400()),
                  Text(LocaleManeger.instance.getStringValue(PreferenceKeys.DATE).split(" ")[0], style: TextStyleComp.style400()),
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
                    style:
                        TextStyleComp.style400(size: 14, color: Colors.black),
                  ),
                  SizedBox(height: 120.h),
                  for (var i = 0; i < 2; i++)
                    GestureDetector(
                      child: Container(
                        height: 64.h,
                        width: 335.w,
                        margin: EdgeInsets.symmetric(vertical: 15.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: context.watch<ColorChangeNotifier>().colorP),
                        ),
                        child: Center(
                          child: ListTile(
                            leading: Icon(i == 0 ?Icons.settings_outlined:Icons.share_outlined,
                                color: context.watch<ColorChangeNotifier>().colorP, size: 30.sp),
                            title: Text(
                              i == 1 ?  LocaleKeys.ulashish.t : LocaleKeys.sozlash.t,
                              style: TextStyleComp.style500(
                                size: 20,
                                color: context.watch<ColorChangeNotifier>().colorP,
                              ),
                            ),
                            minLeadingWidth: 95.w,
                          ),
                        ),
                      ),
                      onTap: (){
                        if(i == 0){
                          ProfileEditShowModelSheet.init(context);
                        }else{
                          Serviceshare.share();
                        }
                      },
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
