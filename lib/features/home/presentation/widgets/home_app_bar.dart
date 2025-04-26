// ignore_for_file: deprecated_member_use

part of '../home.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Nagwa Books',
          style: TextStyles.textStyle24DarkGraySemiBold.copyWith(fontFamily: 'BebasNeue'),
        ),
        Container(
          width: 40.w,
          height: 40.h,
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
          child: Icon(FontAwesomeIcons.magnifyingGlass),
        ),
      ],
    );
  }
}
