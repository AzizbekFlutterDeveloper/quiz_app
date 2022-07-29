import 'package:app/core/components/text_style/text_styles.dart';
import 'package:app/core/constants/color_const/color_const.dart';
import 'package:app/core/constants/enum/locale_keys_enum.dart';
import 'package:app/core/constants/navigation_const/navigation_const.dart';
import 'package:app/core/extension/string_extension_locale.dart';
import 'package:app/core/init/cache/locale_manger.dart';
import 'package:app/core/init/lang/lang_keys.g.dart';
import 'package:app/core/init/lang/lang_manager.dart';
import 'package:app/provider/color_change_notifier.dart';
import 'package:app/provider/lang_change_notifier.dart';
import 'package:app/provider/name_change_notifier.dart';
import 'package:app/view/register_view/_widget/text_form_fild_register.dart';
import 'package:app/widget/button_container.dart';
import 'package:app/widget/lang_change_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ColorChangeNotifier>().colorP,
      resizeToAvoidBottomInset: false,
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
              controller: context.watch<NameChangeNotifier>().controller,
              hintText: LocaleKeys.ism_familiya.t,
              onChanged: (v){
                context.read<NameChangeNotifier>().enableAdd();
              },
            ),
            const LangChangeContainer(),
            SizedBox(height: 110.h),
            ButtonContainer(
              color: context.watch<NameChangeNotifier>().isBool? ColorConst.instance.white:context.watch<ColorChangeNotifier>().colorP,
              onTap: context.watch<NameChangeNotifier>().isBool?(){
                context.read<NameChangeNotifier>().nameAddCached();
                Navigator.pushNamed(context, NavigationConst.HOME_VIEW);
                
              }:null,
            ),
          ],
        ),
      ),
    );
  }
}
