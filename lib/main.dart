import 'package:flutter/material.dart';

import 'login/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retomada',
      theme: ThemeData(fontFamily: 'Montserrat',backgroundColor: Colors.white),
      home: LoginPage(title: 'Login'),
    );
  }
}

