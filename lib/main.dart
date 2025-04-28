import 'package:book_app/book_app.dart';
import 'package:book_app/core/di/service_locator.dart';
import 'package:book_app/core/routing/app_router.dart';
import 'package:book_app/core/utils/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();
  runApp(BooksApp(appRouter: AppRouter()));
}
