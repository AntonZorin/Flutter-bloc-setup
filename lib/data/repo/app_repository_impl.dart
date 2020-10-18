import 'package:flutter/cupertino.dart';
import 'package:flutter_setup_app/data/repo/aip_result.dart';
import 'package:flutter_setup_app/data/repo/local_datasource.dart';
import 'package:flutter_setup_app/data/repo/remote_datasource.dart';
import 'package:flutter_setup_app/mapper/data_user_mapper.dart';
import 'package:flutter_setup_app/presentation/model/user.dart';

import 'app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  RemoteDataSource remoteDataSource;
  LocalDataSource localDataSource;

  AppRepositoryImpl(
      {@required this.remoteDataSource, @required this.localDataSource});

  @override
  Future<ApiResult> getUser() async {
    return  await remoteDataSource.getUsers();
  }
}
