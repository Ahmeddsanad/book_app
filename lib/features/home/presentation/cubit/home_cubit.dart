import 'dart:developer';

import 'package:book_app/features/home/domain/repo/home_repo.dart';
import 'package:book_app/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial()) {
    fetchBooks();
  }

  final HomeRepo homeRepo;

  Map<int, bool> expandedBooks = {}; // Key = book ID (or index), Value = isExpanded

  void toggleDescription(int bookId) {
    expandedBooks[bookId] = !(expandedBooks[bookId] ?? false);
    emit(BookDescriptionExpanded());
  }

  Future<void> fetchBooks({int page = 1}) async {
    if (page == 1) {
      emit(BooksLoadingState());
    } else {
      emit(BooksLoadingPaginationState());
    }
    var result = await homeRepo.fetchBooks(page: page);
    log(result.toString());
    result.fold(
      (l) {
        if (page == 1) {
          emit(BooksFailureState(l.message));
        } else {
          emit(BooksFailurePaginationState(l.message));
        }
      },
      (books) {
        emit(BooksSuccessState(books));
      },
    );
  }
}
