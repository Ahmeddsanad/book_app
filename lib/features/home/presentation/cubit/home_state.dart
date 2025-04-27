import 'package:book_app/features/home/domain/entities/book_entity.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class BookDescriptionExpanded extends HomeState {}

final class BooksLoadingState extends HomeState {}

final class BooksLoadingPaginationState extends HomeState {}

final class BooksFailurePaginationState extends HomeState {
  final String errMessage;
  BooksFailurePaginationState(this.errMessage);
}

final class BooksFailureState extends HomeState {
  final String errMessage;
  BooksFailureState(this.errMessage);
}

final class BooksSuccessState extends HomeState {
  final List<BookEntity> books;
  BooksSuccessState(this.books);
}
