import 'package:car_peache_searcher/consts/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AppDecoration
{
//
  static InputDecoration textfield3 = InputDecoration(

      filled: true,
      fillColor: AppColors.inputColor,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 0,
        ),
        borderRadius: BorderRadius.circular(3.sp),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 0,
        ),
        borderRadius: BorderRadius.circular(3.sp),
      )
  );

}