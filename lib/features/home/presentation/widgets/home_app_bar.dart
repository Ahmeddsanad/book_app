// ignore_for_file: deprecated_member_use

part of '../home.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Nagwa Books',
          style: TextStyles.textStyle24DarkGraySemiBold.copyWith(fontFamily: 'BebasNeue'),
        ),
        verticalSpacer(10.h),
        TextFormField(
          controller: context.read<HomeCubit>().searchController,
          onFieldSubmitted: (value) => context.read<HomeCubit>().onSearchChanged(),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
            hintText: 'Search',
            prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass),
          ),
        ),
      ],
    );
  }
}
