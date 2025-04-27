// ignore_for_file: deprecated_member_use

import 'package:book_app/core/helpers/extensions.dart';
import 'package:book_app/core/routing/router.dart';
import 'package:book_app/core/theming/colors.dart';
import 'package:book_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
      body: SafeArea(
        child: Stack(
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 25.h,
                    bottom: 120.h,
                    left: 20.w,
                    right: 20.w,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 600.h,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 50.h, left: 25.w),
                      child: Text(
                        'Browse\nRead\nGrow\n●\n●\n●',
                        style: TextStyles.textStyle48WhiteExtraBold.copyWith(
                          fontFamily: 'BebasNeue',
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: -55.w,
                  bottom: 120.h,
                  child: Image.asset(
                    'assets/images/girl.webp',
                    fit: BoxFit.scaleDown,
                    width: 300.w,
                  ),
                ),
              ],
            ),
            Positioned(
              left: 20.w,
              right: 20.w,
              bottom: 0,
              child: SizedBox(
                height: 40.h,
                child: ElevatedButton(
                  onPressed: () => context.pushNamed(Routes.homeScreen),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyles.textStyle18DarkGraySemiBold.copyWith(
                      fontFamily: 'BebasNeue',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
