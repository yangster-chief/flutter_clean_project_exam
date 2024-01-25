import 'package:flutter/material.dart';
import 'package:flutter_project_exam/screen/my_app.dart';

///
/// flutter_project_exam
/// File Name: app_configure
/// Created by sujangmac
///
/// Description:
///

enum BuildType { develop, product }

class AppConfigure {
  static AppConfigure? _instance;

  static AppConfigure get instance => _instance!;

  final BuildType _buildType;

  static BuildType get buildType => _instance!._buildType;

  AppConfigure._internal(this._buildType);

  factory AppConfigure.newInstance(BuildType buildType) {
    _instance ??= AppConfigure._internal(buildType);
    return _instance!;
  }

  static String get apiUrl {
    switch (buildType) {
      case BuildType.develop:
        return 'https://dev-api.flutter.app';
      case BuildType.product:
        return 'https://api.flutter.app';
    }
  }

  static bool get isDevPhase => buildType == BuildType.develop;

  void run() {
    _init();
    runApp(const MyApp());
  }

  void _init() {}
}
