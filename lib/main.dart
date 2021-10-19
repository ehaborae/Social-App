import 'package:flutter/material.dart';

import 'modules/social_app/social_login_screen/social_login_screen.dart';

void main() {
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
        primarySwatch: Colors.blue,
      ),
      home: SocialLoginScreen(),
    );
  }
}
