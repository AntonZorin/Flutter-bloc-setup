import 'package:flutter_setup_app/data/repo/aip_result.dart';
import 'package:flutter_setup_app/mapper/data_user_mapper.dart';
import 'package:flutter_setup_app/presentation/model/user.dart';

abstract class AppRepository {
  Future<ApiResult> getUser();
}