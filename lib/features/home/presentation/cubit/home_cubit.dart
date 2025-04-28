import 'dart:async';
import 'package:book_app/features/home/domain/repo/home_repo.dart';
import 'package:book_app/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial()) {
    searchController = TextEditingController();
    fetchBooks(); // Initial books fetch
  }

  final HomeRepo homeRepo;
  late TextEditingController searchController;

  Map<int, bool> expandedBooks = {}; // Key = book ID (or index)
  Timer? _debounce;

  // Search method with debounce
  void onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      fetchBooks(query: searchController.text.trim()); // Perform search
    });
  }

  // Toggles book description expanded state
  void toggleDescription(int bookId) {
    expandedBooks[bookId] = !(expandedBooks[bookId] ?? false);
    emit(BookDescriptionExpanded());
  }

  // Fetch books based on query or pagination
  Future<void> fetchBooks({int page = 1, String? query}) async {
    if (page == 1) {
      emit(BooksLoadingState());
    } else {
      emit(BooksLoadingPaginationState());
    }
    var result = await homeRepo.fetchBooks(page: page, query: query);
    result.fold(
      (l) {
        if (page == 1) {
          emit(BooksFailureState(l.message));
        } else {
          emit(BooksFailurePaginationState(l.message));
        }
      },
      (books) {
        if (query != null && query.isNotEmpty) {
          emit(BooksSearchState()); // Emit search state when search query is not null
        }
        emit(BooksSuccessState(books)); // Emit success state with fetched books
      },
    );
  }

  // Clean up resources on dispose
  @override
  Future<void> close() {
    _debounce?.cancel();
    searchController.dispose();
    return super.close();
  }
}
