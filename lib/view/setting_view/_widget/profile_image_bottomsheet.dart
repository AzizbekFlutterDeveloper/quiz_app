import 'package:app/core/constants/color_const/color_const.dart';
import 'package:app/core/data/list_data/list_data.dart';
import 'package:app/provider/image_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileBottomSheet {
  static init(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
          color: ColorConst.instance.white,
        ),
        child: Wrap(
          children: [
            for(var i =0; i<8;i++)
            GestureDetector(
              child: Container(
                height: 70.h,
                width: 70.w,
                margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: Colors.black),
                  image: DecorationImage(
                    image: AssetImage(LocaleListData.profileImage[i])
                  ),
                ),
              ),
              onTap: (){
                context.read<ImageChange>().imageChange(i);
              },
            ),
          ],
        ),
      ),
      
    );
  }
}
