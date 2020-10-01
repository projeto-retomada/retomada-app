import 'package:flutter/material.dart';
import 'package:retomada/first/first_screen.dart';
import 'package:retomada/perfil/perfil.dart';

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Retomada",
        theme: ThemeData(primaryColor: Colors.white, splashColor: Colors.cyan, fontFamily: 'Montserrat'),
        home: PerfilPage()
    );
  }
}
