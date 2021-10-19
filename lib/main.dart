import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social/shared/network/local/cache_helper.dart';
import 'package:social/shared/network/remote/dio_helper.dart';
import 'package:social/shared/observer.dart';

import 'modules/social_app/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social',
      theme: ThemeData(
        fontFamily: 'Jannah',
        primarySwatch: Colors.blue,
      ),
      home: SocialLoginScreen(),
    );
  }
}
