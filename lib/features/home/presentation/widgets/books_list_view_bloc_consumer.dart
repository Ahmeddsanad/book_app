// ignore_for_file: deprecated_member_use

part of '../home.dart';

class BookListViewBlocConsumer extends StatelessWidget {
  BookListViewBlocConsumer({super.key});

  final List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is BooksSuccessState) {
          books.clear(); // Clear old books before adding new ones
          books.addAll(state.books); // Add the new books list
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
            state is BooksSearchState ||
            state is BooksFailurePaginationState ||
            state is BookDescriptionExpanded ||
            state is BooksLoadingPaginationState) {
          return BooksListView(books: books);
        } else if (state is BooksFailureState) {
          return Center(
            child: Text(state.errMessage, style: TextStyles.textStyle24DarkGraySemiBold),
          );
        } else {
          return const SizedBox.shrink(); // Return empty widget if no relevant state
        }
      },
    );
  }
}
