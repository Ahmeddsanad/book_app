part of '../home.dart';

class BookInfoTile extends StatelessWidget {
  const BookInfoTile({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Row(
          children: [
            BookCoverImage(),
            horizontalSpacer(8),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(left: 3.w, top: 10.h, right: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and Rating
                    BookTitleAndRating(title: 'The Secret of a Happy'),

                    verticalSpacer(4),

                    // Author
                    Text('William Shakespeare', style: TextStyles.textStyle12DarkGrayShade600),

                    verticalSpacer(6),

                    // Description
                    Text(
                      'William Shakespeare[a] (c. 23 April 1564[b] – 23 April 1616)[c] was an English playwright, poet and actor. He is widely regarded as the greatest writer in the English language and the world\'s pre-eminent dramatist. He is often called England\'s national poet William Shakespeare[a] (c. 23 April 1564[b] – 23 April 1616)[c] was an English playwright, poet and actor. He is widely regarded as the greatest writer in the English language and the world\'s pre-eminent dramatist. He is often called England\'s national poet',
                      style: TextStyle(fontSize: 12.sp, color: Colors.black),
                      maxLines: cubit.isExpanded ? null : 3,
                      overflow: cubit.isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                    ),

                    verticalSpacer(6),

                    // Read More / Read Less button
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(ColorsManager.lightBlue),
                          foregroundColor: WidgetStatePropertyAll(ColorsManager.white),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                          ),
                          padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                          ),
                        ),
                        onPressed: () => cubit.toggleDescription(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(cubit.isExpanded ? 'Read Less' : 'Read More'),
                            horizontalSpacer(6),
                            Container(
                              height: 20.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                color: ColorsManager.white,
                              ),
                              child: Icon(
                                cubit.isExpanded
                                    ? FontAwesomeIcons.arrowUp
                                    : FontAwesomeIcons.arrowDown,
                                size: 12.sp,
                                color: ColorsManager.lightBlue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
