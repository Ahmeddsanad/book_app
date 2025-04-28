part of '../home.dart';

class BookCoverImage extends StatelessWidget {
  const BookCoverImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          bottomLeft: Radius.circular(12.r),
        ),
        child: CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.fill),
      ),
    );
  }
}
