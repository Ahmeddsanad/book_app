import 'package:book_app/core/networking/failure.dart';
import 'package:book_app/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchBooks({int page = 1, String? query});
}
