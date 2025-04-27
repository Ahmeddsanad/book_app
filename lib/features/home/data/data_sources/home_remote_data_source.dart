import 'dart:developer';

import 'package:book_app/core/networking/api_constants.dart';
import 'package:book_app/core/networking/api_service.dart';
import 'package:book_app/core/networking/failure.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/domain/entities/book_entity.dart';
import 'package:dio/dio.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchBooks({int page = 1});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<BookEntity>> fetchBooks({int page = 1}) async {
    try {
      final response = await _apiService.get(endPoint: '${ApiConstants.books}?page=$page');
      return getBooksList(response);
    } on DioException catch (e) {
      log('DioError during fetchBooks: $e');
      throw ServerFailure.fromDioError(e);
    } catch (e) {
      // Log other errors, but don't necessarily treat them as ServerFailures
      log('Error during fetchBooks (non-DioError): $e');
      rethrow; // Re-throw the error so the repository can handle it
    }
  }
}

List<BookEntity> getBooksList(Map<String, dynamic> data) {
  final results = data['results'] as List<dynamic>? ?? [];

  return results
      .map((item) {
        if (item is Map<String, dynamic>) {
          try {
            return BookModel.fromJson(item);
          } catch (e) {
            print("Error during BookModel.fromJson: $e, item: $item");
            return null;
          }
        } else {
          print("Warning: Item in 'results' is not a Map: $item");
          return null;
        }
      })
      .whereType<BookEntity>()
      .toList();
}
