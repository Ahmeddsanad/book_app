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
}
