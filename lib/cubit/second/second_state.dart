part of 'second_cubit.dart';

@immutable
abstract class SecondState {}

class InitialSecondState extends SecondState {}

class LoadingSecondState extends SecondState {}

class LoadedSecondState extends SecondState {
  final List<User> users;

  LoadedSecondState({this.users});
}

class ErrorSecondState extends SecondState {
  final String message;

  ErrorSecondState(this.message);
}
