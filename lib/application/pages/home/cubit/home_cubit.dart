// imports dos domain
import 'package:advicer/domain/usecases/home_usecases.dart';

// import dos pacotes
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeInitial());

  final HomeUseCases _homeUseCases = HomeUseCases();

  void homeRequestEvent() async {
    emit(HomeStateLoading());

    // execute bussiness logic
    final advice = await _homeUseCases.getAdvice();

    emit(HomeStateLoaded(advice: advice.advice));
    // emit(const HomeStateError(message: "Error message"));
  }
}