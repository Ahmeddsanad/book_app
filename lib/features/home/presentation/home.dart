// ignore_for_file: deprecated_member_use

import 'package:book_app/core/theming/colors.dart';
import 'package:book_app/core/theming/spacing.dart';
import 'package:book_app/core/theming/styles.dart';
import 'package:book_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:book_app/features/home/presentation/cubit/home_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

part 'widgets/home_app_bar.dart';
part 'widgets/book_cover_image.dart';
part 'widgets/book_title_and_rating.dart';
part 'widgets/book_info_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 18.h, left: 18.w, right: 18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              HomeAppBar(),
              verticalSpacer(10),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.all(1.sp),
                  itemBuilder:
                      (context, index) => Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorsManager.lightGray,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 0),
                              blurRadius: 2,
                              color: Colors.black.withOpacity(0.3),
                              blurStyle: BlurStyle.outer,
                            ),
                          ],
                        ),
                        child: BookInfoTile(),
                      ),
                  separatorBuilder: (context, index) => verticalSpacer(10),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
