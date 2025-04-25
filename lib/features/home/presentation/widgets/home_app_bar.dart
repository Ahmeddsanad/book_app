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
          ),
          child: Icon(FontAwesomeIcons.magnifyingGlass),
        ),
      ],
    );
  }
}
