part of '../home.dart';

class BookTitleAndRating extends StatelessWidget {
  const BookTitleAndRating({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyles.textStyle14DarkGraySemiBold,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Text(
              '4.5',
              style: TextStyles.textStyle12DarkGrayMedium.copyWith(
                textBaseline: TextBaseline.alphabetic,
              ),
            ),
            horizontalSpacer(2),
            Icon(FontAwesomeIcons.solidStar, color: ColorsManager.yellow, size: 12.sp),
          ],
        ),
      ],
    );
  }
}
