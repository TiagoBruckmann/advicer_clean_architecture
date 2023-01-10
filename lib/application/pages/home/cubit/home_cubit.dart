// imports nativos
import 'package:flutter/material.dart';

// import dos pacotes
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeInitial());

  void homeRequestEvent() async {
    emit(HomeStateLoading());

    // execute bussiness logic
    debugPrint("fake get advice triggered");
    await Future.delayed(const Duration(seconds: 3), (){});
    debugPrint("got advice");

    // emit(HomeStateLoaded(advice: "Fake advice to test BLOC!"));
    emit(HomeStateError(message: "Error message"));
  }
}