import 'package:bloc/bloc.dart';
import 'package:flutter_setup_app/data/repo/aip_result.dart';
import 'package:flutter_setup_app/data/repo/app_repository.dart';
import 'package:flutter_setup_app/mapper/data_user_mapper.dart';
import 'package:flutter_setup_app/presentation/model/user.dart';
import 'package:meta/meta.dart';

part 'second_state.dart';

class SecondCubit extends Cubit<SecondState> {
  AppRepository appRepository;
  DataUserMapper dataUserMapper;

  SecondCubit({this.appRepository, this.dataUserMapper})
      : super(InitialSecondState());

  Future<void> getUsers() async {
    emit(LoadingSecondState());
    var apiResult = await appRepository.getUser();
    if (apiResult.status == Status.COMPLETED) {
      var users = dataUserMapper.mapList(apiResult.data);
      emit(LoadedSecondState(users: users));
    }
    if (apiResult.status == Status.ERROR) {
      emit(ErrorSecondState(apiResult.message));
    }
  }
}
