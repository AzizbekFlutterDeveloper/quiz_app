import 'package:app/core/components/text_style/text_styles.dart';
import 'package:app/core/constants/color_const/color_const.dart';
import 'package:app/core/extension/string_extension_locale.dart';
import 'package:app/core/init/lang/lang_keys.g.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonContainer extends StatelessWidget {
  final Color? color;
  final void Function()? onTap;
  const ButtonContainer({Key? key, this.color, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 58.h,
        width: 327.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: color,
          border: Border.all(color: ColorConst.instance.white),
        ),
        child: Center(
          child: Text(
            LocaleKeys.keyingi.t,
            style: TextStyleComp.style600(
              color: color == ColorConst.instance.white
                  ? ColorConst.instance.blue
                  : null,
            ),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
