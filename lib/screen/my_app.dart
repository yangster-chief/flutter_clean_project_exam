import 'package:flutter/material.dart';
import 'package:flutter_project_exam/config/app_configure.dart';
import 'package:flutter_project_exam/screen/home/my_home_page.dart';

///
/// flutter_project_exam
/// File Name: my_app
/// Created by sujangmac
///
/// Description:
///
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: '${AppConfigure.buildType}'),
    );
  }
}
