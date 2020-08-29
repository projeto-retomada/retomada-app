import 'package:flutter/material.dart';
import 'package:retomada/comun_elements/menu_app_bar.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: RetomadaAppBar(),
        drawer: NavigationDrawer(),
        body: Center(child: Text("")));
  }
}


