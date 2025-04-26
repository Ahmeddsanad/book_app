part of '../home.dart';

class BookCoverImage extends StatelessWidget {
  const BookCoverImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          bottomLeft: Radius.circular(12.r),
        ),
        child: CachedNetworkImage(
          imageUrl: 'https://edit.org/images/cat/book-covers-big-2019101610.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
