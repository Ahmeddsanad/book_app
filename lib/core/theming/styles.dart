import 'package:book_app/core/theming/colors.dart';
import 'package:book_app/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle textStyle48WhiteExtraBold = TextStyle(
    fontSize: 48.sp,
    fontWeight: FontWeightHelper.extraBold,
    letterSpacing: 1.3,
    color: ColorsManager.white,
  );

  static TextStyle textStyle18DarkGraySemiBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semiBold,
    letterSpacing: 1.1,
    color: ColorsManager.darkGray,
  );

  static TextStyle textStyle14DarkGraySemiBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,

    color: ColorsManager.darkGray,
  );

  static TextStyle textStyle12DarkGrayMedium = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,

    color: ColorsManager.darkGray,
  );

  static TextStyle textStyle24DarkGraySemiBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.semiBold,
    letterSpacing: 1.1,
    color: ColorsManager.darkGray,
  );

  static TextStyle textStyle12DarkGrayShade600 = TextStyle(
    fontSize: 12.sp,
    color: Colors.grey.shade600,
  );
}
