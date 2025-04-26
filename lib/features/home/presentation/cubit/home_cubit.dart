import 'package:book_app/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  bool isExpanded = false;

  void toggleDescription() {
    isExpanded = !isExpanded;
    emit(BookDescriptionExpanded());
  }
}
