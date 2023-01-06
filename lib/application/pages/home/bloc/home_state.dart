part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateLoaded extends HomeState {
  HomeStateLoaded({ required this.advice });
  final String advice;
}

class HomeStateError extends HomeState {
  HomeStateError({ required this.message });
  final String message;
}