import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_setup_app/data/repo/app_repository.dart';
import 'package:flutter_setup_app/mapper/data_user_mapper.dart';
import 'package:flutter_setup_app/presentation/model/user.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  AppRepository appRepository;
  DataUserMapper dataUserMapper;

  HomeCubit({@required this.appRepository, this.dataUserMapper})
      : super(InitialHomeState());

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

  Future<void> getUsers() async {
    List<User> users = await appRepository.getUser(dataUserMapper);
    print(users);
  }
}
