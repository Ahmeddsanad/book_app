part of '../home.dart';

class BookInfoTile extends StatelessWidget {
  const BookInfoTile({super.key, required this.bookInfo});

  final BookEntity bookInfo;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Row(
          children: [
            BookCoverImage(imageUrl: bookInfo.image),
            horizontalSpacer(8),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(left: 3.w, top: 10.h, right: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and Rating
                    BookTitleAndRating(title: bookInfo.bookTitle),

                    verticalSpacer(4),

                    // Author
                    Text(bookInfo.author, style: TextStyles.textStyle12DarkGrayShade600),

                    verticalSpacer(6),

                    // Description
                    Text(
                      bookInfo.summary,
                      style: TextStyle(fontSize: 12.sp, color: Colors.black),
                      maxLines: cubit.expandedBooks[bookInfo.bookId] ?? false ? null : 3,
                      overflow:
                          cubit.expandedBooks[bookInfo.bookId] ?? false
                              ? TextOverflow.visible
                              : TextOverflow.ellipsis,
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
                        onPressed: () => cubit.toggleDescription(bookInfo.bookId),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              cubit.expandedBooks[bookInfo.bookId] ?? false
                                  ? 'Read Less'
                                  : 'Read More',
                            ),
                            horizontalSpacer(6),
                            Container(
                              height: 20.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                color: ColorsManager.white,
                              ),
                              child: Icon(
                                cubit.expandedBooks[bookInfo.bookId] ?? false
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
