// ignore_for_file: deprecated_member_use

part of '../home.dart';

class BookListViewBlocConsumer extends StatelessWidget {
  const BookListViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    final List<BookEntity> books = [];
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is BooksSuccessState) {
          books.addAll(state.books);
        }
        if (state is BooksFailurePaginationState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        if (state is HomeInitial || state is BooksLoadingState) {
          return BooksListViewLoading();
        }
        if (state is BooksSuccessState ||
            state is BooksFailurePaginationState ||
            state is BookDescriptionExpanded ||
            state is BooksLoadingPaginationState) {
          return BooksListView(books: books);
        } else if (state is BooksFailureState) {
          return Center(
            child: Text(state.errMessage, style: TextStyles.textStyle24DarkGraySemiBold),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
