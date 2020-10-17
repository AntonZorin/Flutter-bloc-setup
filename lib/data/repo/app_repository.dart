import 'package:flutter/cupertino.dart';
import 'package:flutter_setup_app/data/repo/local_datasource.dart';
import 'package:flutter_setup_app/data/repo/remote_datasource.dart';
import 'package:flutter_setup_app/mapper/data_user_mapper.dart';
import 'package:flutter_setup_app/presentation/model/user.dart';

class AppRepositoryImpl extends AppRepository {
  RemoteDataSource remoteDataSource;
  LocalDataSource localDataSource;

  AppRepositoryImpl(
      {@required this.remoteDataSource, @required this.localDataSource});

  @override
  Future<List<User>> getUser(DataUserMapper mapper) async {
    var tmp = await remoteDataSource.getUsers();
    return mapper.mapList(tmp);
  }
}

abstract class AppRepository {
  Future<List<User>> getUser(DataUserMapper mapper);
}
