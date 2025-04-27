part of '../home.dart';

class BooksListViewLoading extends StatelessWidget {
  const BooksListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder:
            (context, index) => SizedBox(
              width: double.infinity,
              height: 175.h,
              child: Shimmer.fromColors(
                baseColor: ColorsManager.lightGray,
                highlightColor: ColorsManager.white,
                child: Container(
                  width: double.infinity,
                  height: 200.h,
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
                ),
              ),
            ),
        separatorBuilder: (context, index) => verticalSpacer(10),
        itemCount: 8,
      ),
    );
  }
}
