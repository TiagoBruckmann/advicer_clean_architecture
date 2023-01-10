// imports nativos
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// import dos pacotes
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      emit(HomeStateLoading());

      // execute bussiness logic
      debugPrint("fake get advice triggered");
      await Future.delayed(const Duration(seconds: 3), (){});
      debugPrint("got advice");

      // emit(HomeStateLoaded(advice: "Fake advice to test BLOC!"));
      emit(HomeStateError(message: "Error message"));
    });
  }
}