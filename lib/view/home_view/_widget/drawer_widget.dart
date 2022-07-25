import 'package:app/core/components/text_style/text_styles.dart';
import 'package:app/core/constants/color_const/color_const.dart';
import 'package:app/core/extension/string_extension_locale.dart';
import 'package:app/core/init/lang/lang_keys.g.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: BlurryContainer(
        borderRadius: BorderRadius.circular(0),
        color: Colors.black.withOpacity(0.4),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 63.h, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LocaleKeys.menu.t, style: TextStyleComp.style600(size: 22)),
              SizedBox(
                height: 15.h,
              ),
              for (var i = 0; i < 3; i++)
                ListTile(
                  minLeadingWidth: 0,
                  contentPadding: const EdgeInsets.only(left: 0),
                  leading: Icon(
                    Icons.settings,
                    color: ColorConst.instance.white,
                  ),
                  title: Text(
                    LocaleKeys.sozlash.t,
                    style: TextStyleComp.style500(),
                  ),
                ),
              const Spacer(),
              ListTile(
                minLeadingWidth: 0,
                contentPadding: const EdgeInsets.only(left: 0),
                leading: Icon(
                  Icons.help_outline,
                  color: ColorConst.instance.white,
                ),
                title: Text(
                  LocaleKeys.yordam.t,
                  style: TextStyleComp.style500(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
