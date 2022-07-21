import 'package:app/core/constants/color_const/color_const.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyleComp{
  static TextStyle style600({double size = 18, Color? color}){
    return TextStyle(
      color: color?? ColorConst.instance.white,
      fontSize: size.sp,
      fontWeight: FontWeight.w600
    );
  }

  static TextStyle style500({double size = 18, Color? color}){
    return TextStyle(
      color: color?? ColorConst.instance.white,
      fontSize: size.sp,
      fontWeight: FontWeight.w500
    );
  }

  static TextStyle style400({double size = 18, Color? color}){
    return TextStyle(
      color: color?? ColorConst.instance.white,
      fontSize: size.sp,
      fontWeight: FontWeight.w400
    );
  }

  static TextStyle style700({double size = 18, Color? color}){
    return TextStyle(
      color: color?? ColorConst.instance.white,
      fontSize: size.sp,
      fontWeight: FontWeight.w700
    );
  }
}