import 'package:app/core/components/text_style/text_styles.dart';
import 'package:app/core/constants/color_const/color_const.dart';
import 'package:app/core/constants/navigation_const/navigation_const.dart';
import 'package:app/core/extension/string_extension_locale.dart';
import 'package:app/core/init/lang/lang_keys.g.dart';
import 'package:app/view/home_view/_widget/body_widget.dart';
import 'package:app/view/home_view/_widget/drawer_widget.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 64.h,
          elevation: 10,
          backgroundColor: ColorConst.instance.blue,
          leading: Padding(
            padding:  EdgeInsets.all(10.w),
            child: Builder(
              builder: (context) => GestureDetector(
                child: SvgPicture.asset(
                  "assets/icon/Group 179.svg",
                  height: 10.sp,
                ),
                onTap: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ),
          actions: [
            Row(
              children: [
                Text(
                  LocaleKeys.salom.t + ", Azizbek",
                  style: TextStyleComp.style400(),
                ),
                GestureDetector(
                  child: Container(
                    height: 35.h,
                    width: 35.w,
                    margin: EdgeInsets.only(
                        top: 15.h, bottom: 14.h, right: 20.w, left: 15.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: ColorConst.instance.white,
                    ),
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, NavigationConst.PROFILE_VIEW);
                  },
                ),
              ],
            ),
          ],
        ),
        drawer: DrawerWidget(),
        body: BodyWidget(),
      ),
    );
  }
}
