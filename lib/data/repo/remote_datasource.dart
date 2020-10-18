import 'package:dio/dio.dart';
import 'package:flutter_setup_app/data/entity/user_entity.dart';
import 'package:flutter_setup_app/data/repo/aip_result.dart';

class RemoteDataSource {
  Dio dio;

  RemoteDataSource(this.dio);

  Future<ApiResult<List<UserEntity>>> getUsers() async {
    try {
      var response = await dio.get<List<dynamic>>("/users");
      var users = response.data.map((e) => UserEntity.fromMap(e)).toList();
      return ApiResult.completed(users);
    } catch (error, stackTrace) {
      return ApiResult.error(error.toString());
    }
  }
}
