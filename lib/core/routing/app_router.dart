// ignore_for_file: unused_local_variable

import 'package:book_app/core/networking/api_service.dart';
import 'package:book_app/core/routing/router.dart';
import 'package:book_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:book_app/features/home/data/repo/home_repo_impl.dart';
import 'package:book_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:book_app/features/home/presentation/home.dart';
import 'package:book_app/features/onboarding/presentation/onboarding_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like login screen, onboarding screen
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        HomeCubit(HomeRepoImpl(HomeRemoteDataSourceImpl(ApiService(Dio())))),
                child: const HomeScreen(),
              ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(body: Center(child: Text('No route found'))),
        );
    }
  }
}
