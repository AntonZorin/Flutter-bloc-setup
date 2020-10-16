part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class InitialHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

// ignore: must_be_immutable
class LoadingFinishedHomeState extends HomeState {
  final MaterialColor color;

  LoadingFinishedHomeState(this.color);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoadingFinishedHomeState &&
          runtimeType == other.runtimeType &&
          color == other.color;

  @override
  int get hashCode => color.hashCode;
}

class ErrorHomeState extends HomeState {}
