import 'package:app/core/components/text_style/text_styles.dart';
import 'package:app/core/constants/color_const/color_const.dart';
import 'package:app/core/constants/enum/locale_keys_enum.dart';
import 'package:app/core/init/cache/locale_manger.dart';
import 'package:app/core/init/lang/lang_manager.dart';
import 'package:app/provider/color_change_notifier.dart';
import 'package:app/provider/lang_change_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LangChangeContainer extends StatelessWidget {
  final Color? color;
  final double top;
  const LangChangeContainer({Key? key, this.color, this.top = 30}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List langList = context.watch<LangChangeNotifier>().langList;

    return Container(
      height: 58.h,
      width: 327.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      margin: EdgeInsets.symmetric(vertical: top.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color:color?? ColorConst.instance.white),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(LocaleManeger.instance.getStringValue(PreferenceKeys.LANG),
              style: TextStyleComp.style400(color: color)),
          PopupMenuButton(
            splashRadius: 20.r,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            position: PopupMenuPosition.under,
            icon: Icon(Icons.keyboard_arrow_down_rounded,
                color:color?? ColorConst.instance.white),
            itemBuilder: (context) {
              return [
                for (var i = 0; i < 3; i++)
                  PopupMenuItem(
                    child: Text(
                      langList[i],
                      style: TextStyleComp.style500(
                        color: color ?? context.watch<ColorChangeNotifier>().colorP,
                      ),
                    ),
                    onTap: () {
                      context.read<LangChangeNotifier>().changeLang(i, context);
                      context.setLocale(
                          LanguageManager.instance.suppprtedLocales[i]);
                    },
                  ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
