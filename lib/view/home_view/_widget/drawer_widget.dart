import 'package:app/core/components/text_style/text_styles.dart';
import 'package:app/core/constants/color_const/color_const.dart';
import 'package:app/core/constants/navigation_const/navigation_const.dart';
import 'package:app/core/data/list_data/list_data.dart';
import 'package:app/core/extension/string_extension_locale.dart';
import 'package:app/core/init/lang/lang_keys.g.dart';
import 'package:app/service/share_service.dart';
import 'package:app/view/home_view/_widget/show_dialog.dart';
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
              for (var i = 0; i < 4; i++)
                ListTile(
                  minLeadingWidth: 0,
                  contentPadding: const EdgeInsets.only(left: 0),
                  leading: Icon(
                    LocaleListData.drawersData[i]['icon'],
                    color: ColorConst.instance.white,
                  ),
                  title: Text(
                    LocaleListData.drawersData[i]['name'],
                    style: TextStyleComp.style500(),
                  ),
                  onTap: () {
                    if (i == 0) {
                      Navigator.pushNamed(
                          context, NavigationConst.PROFILE_VIEW);
                    } else if (i == 1) {
                      Navigator.pop(context);
                      Serviceshare.share();
                    } else if (i == 2) {
                    } else {
                      Navigator.pop(context);
                      ShowDialogExitApp.init(context);
                    }
                  },
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
