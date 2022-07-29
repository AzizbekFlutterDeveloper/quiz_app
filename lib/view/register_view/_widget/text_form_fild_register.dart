import 'package:app/core/components/text_style/text_styles.dart';
import 'package:app/core/constants/color_const/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final void Function(String)? onChanged;
  const RegisterTextFormField({Key? key, this.controller, this.hintText, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorConst.instance.white,
      style: TextStyleComp.style400(),
      maxLength: 20,
      onChanged: onChanged,
      
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        counterStyle: TextStyleComp.style400(size: 13),
        hintStyle: TextStyleComp.style400(color: ColorConst.instance.white.withOpacity(0.7)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: ColorConst.instance.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: ColorConst.instance.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: ColorConst.instance.white),
        ),
      ),
    );
  }
}
