import 'package:dio/dio.dart';
import 'package:flutter_project_exam/config/app_configure.dart';
import 'package:flutter_project_exam/config/module/hive_service.dart';
import 'package:flutter_project_exam/datasource/remote/api_service.dart';
import 'package:injectable/injectable.dart';

///
/// flutter_project_exam
/// File Name: app_module
/// Created by sujangmac
///
/// Description:
///
@module
abstract class AppModule {
  @preResolve
  Future<HiveService> get hiveService => HiveService.init();

  @lazySingleton
  ApiService get apiService => ApiService(Dio(), baseUrl: AppConfigure.apiUrl);
}
