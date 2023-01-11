// imports dos domain
import 'package:advicer/domain/failures/failure.dart';
import 'package:advicer/domain/usecases/home_usecases.dart';

// import dos pacotes
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

const generalFailureMessage = "Ups, something gone wrong. Please try again!";
const serverFailureMessage = "Ups, API error. Please try again!";
const cacheFailureMessage = "Ups, cache failed. Please try again";

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit({ required this.homeUseCases }) : super(HomeInitial());
  final HomeUseCases homeUseCases;

  void homeRequestEvent() async {
    emit(HomeStateLoading());

    // execute bussiness logic
    final failureOrAdvice = await homeUseCases.getAdvice();

    failureOrAdvice.fold(
      (failure) => emit(HomeStateError(message: _mapFailureToMessage(failure))),
      (advice) => emit(HomeStateLoaded(advice: advice.advice)),
    );
  }

  String _mapFailureToMessage( Failure failure ) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}