import 'package:dio/dio.dart';
import 'package:flutter_setup_app/common/constants.dart';
import 'package:flutter_setup_app/cubit/home/home_cubit.dart';
import 'package:flutter_setup_app/cubit/second/second_cubit.dart';
import 'package:flutter_setup_app/data/repo/app_repository.dart';
import 'package:flutter_setup_app/data/repo/local_datasource.dart';
import 'package:flutter_setup_app/data/repo/remote_datasource.dart';
import 'package:flutter_setup_app/mapper/data_user_mapper.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> init() async {
  //cubit
  di.registerFactory(
      () => HomeCubit(appRepository: di(), dataUserMapper: DataUserMapper()));

  di.registerFactory(
      () => SecondCubit(appRepository: di(), dataUserMapper: DataUserMapper()));

  //Dio
  di.registerLazySingleton(() {
    var options = BaseOptions();
    options.baseUrl = BASE_URL;
    return Dio(options);
  });

  //App Repository
  di.registerLazySingleton<AppRepository>(
      () => AppRepositoryImpl(remoteDataSource: di(), localDataSource: di()));

  //Remote data
  di.registerLazySingleton(() => RemoteDataSource(di()));

  //Local data
  di.registerLazySingleton(() => LocalDataSource());

  //Shared Prefs
  // final sp = await SharedPreferences.getInstance();
  // di.registerLazySingleton<SharedPreferences>(() => sp);
}
