import 'package:alphatwelve_task/core/app.dart';
import 'package:alphatwelve_task/core/di/injectable.dart';
import 'package:alphatwelve_task/routes/route.gr.dart';
import 'package:flutter/material.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();
  si.registerLazySingleton(()=> AppRouter());

  runApp(App());

}

