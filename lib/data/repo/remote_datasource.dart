import 'package:dio/dio.dart';
import 'package:flutter_setup_app/data/entity/user_entity.dart';

class RemoteDataSource {
  Dio dio;

  RemoteDataSource(this.dio);

  Future<List<UserEntity>> getUsers() async {
    try {
      var response = await dio.get("/users");
      print(response);
      List<UserEntity> users = List<UserEntity>.from(response.data);
      return users;
    } catch (error, stackTrace) {
      return error;
    }
  }
}
