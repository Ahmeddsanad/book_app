import 'package:book_app/core/networking/failure.dart';
import 'package:book_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:book_app/features/home/domain/entities/book_entity.dart';
import 'package:book_app/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepoImpl(this._homeRemoteDataSource);

  @override
  Future<Either<Failure, List<BookEntity>>> fetchBooks({int page = 1}) async {
    try {
      final List<BookEntity> books = await _homeRemoteDataSource.fetchBooks(page: page);
      return Right(books);
    } catch (e) {
      return Left(e as Failure); // The cast here might be problematic
    }
  }
}
