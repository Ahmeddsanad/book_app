// ignore_for_file: deprecated_member_use

part of '../home.dart';

class BooksListView extends StatefulWidget {
  const BooksListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<BooksListView> createState() => _BooksListViewState();
}

class _BooksListViewState extends State<BooksListView> {
  late ScrollController _scrollController;
  int nextPage = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _loadMore();
    }
  }

  void _loadMore() {
    double maxPosition = _scrollController.position.maxScrollExtent * 0.7;
    double currentPosition = _scrollController.position.pixels;
    if (currentPosition >= maxPosition) {
      if (!isLoading) {
        isLoading = true;
        setState(() {}); // So the loader appears
        context.read<HomeCubit>().fetchBooks(page: ++nextPage).then((_) {
          isLoading = false;
          setState(() {}); // To remove the loader
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        controller: _scrollController,
        padding: EdgeInsets.all(1.sp),
        itemBuilder: (context, index) {
          if (index == widget.books.length) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: CircularProgressIndicator(color: ColorsManager.primary),
              ),
            );
          }
          return Container(
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
            child: BookInfoTile(bookInfo: widget.books[index]),
          );
        },
        separatorBuilder: (context, index) => verticalSpacer(10),
        itemCount: isLoading ? widget.books.length + 1 : widget.books.length,
      ),
    );
  }
}
