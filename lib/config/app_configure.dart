import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_project_exam/injector.dart';
import 'package:flutter_project_exam/screen/my_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        return Platform.isAndroid
            ? 'http://10.0.2.2:3000'
            : 'http://localhost:3000';
      case BuildType.product:
        return Platform.isAndroid
            ? 'http://10.0.2.2:3000'
            : 'http://localhost:3000';
    }
  }

  static bool get isDevPhase => buildType == BuildType.develop;

  void run() async {
    await configureDependencies();
    runApp(const ProviderScope(
      child: MyApp(),
    ));
  }
}
