part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {

  @override
  List<Object?> get props => [];

}

class HomeInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateLoaded extends HomeState {
  HomeStateLoaded({ required this.advice });
  final String advice;

  @override
  List<Object?> get props => [advice];
}

class HomeStateError extends HomeState {
  HomeStateError({ required this.message });
  final String message;

  @override
  List<Object?> get props => [message];
}