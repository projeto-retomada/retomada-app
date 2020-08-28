import 'package:flutter/material.dart';
import 'package:retomada/comun_elements/menu_app_bar.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Retomada",
        theme: ThemeData(primaryColor: Colors.white, splashColor: Colors.cyan),
        home: myScreen());
  }

  myScreen() {
    return Scaffold(
      appBar: new RetomadaAppBar(
        title: new Text('Perfil'),
      ),
      body: Container(
        color: Colors.white,
      ),
      drawer: new RetomadaDrawer(),
    );
  }
}
