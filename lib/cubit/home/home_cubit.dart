import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(InitialHomeState initialState) : super(initialState);

  Future<void> paintRed() async {
    emit(LoadingHomeState());
    Future.delayed(Duration(seconds: 2), () {
      emit(LoadingFinishedHomeState(Colors.red));
    });
  }

  Future paintGreen() async {
    emit(LoadingHomeState());
    Future.delayed(Duration(seconds: 2), () {
      emit(LoadingFinishedHomeState(Colors.green));
    });
  }
}
