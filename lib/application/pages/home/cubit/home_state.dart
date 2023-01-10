part of 'home_cubit.dart';

abstract class HomeCubitState extends Equatable {
  const HomeCubitState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeCubitState {}

class HomeStateLoading extends HomeCubitState {}

class HomeStateLoaded extends HomeCubitState {
  HomeStateLoaded({ required this.advice });
  final String advice;

  @override
  List<Object?> get props => [advice];
}

class HomeStateError extends HomeCubitState {
  HomeStateError({ required this.message });
  final String message;

  @override
  List<Object?> get props => [message];
}