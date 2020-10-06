import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retomada/comun_elements/menu_app_bar.dart';
import 'package:retomada/model/Activity.dart';

import 'atividade_especifico.dart';

import 'package:http/http.dart' as http;

class AtividadesPage extends StatefulWidget {
  @override
  _AtividadesPageState createState() => _AtividadesPageState();
}

class _AtividadesPageState extends State<AtividadesPage> {
  List<Activity> _api = [];

  Future<String> getActivities() async {
    try {
      List<Activity> listActivities = List();
      final response = await http
          .get('http://192.168.0.11:3333/1/activity');
      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body);
        decodedJson.forEach((item) => listActivities.add(Activity.fromJson(item)));
        this.setState(() {
          _api = listActivities;
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    this.getActivities();
  }

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.64;
    return new Scaffold(
        appBar: RetomadaAppBar(),
        drawer: NavigationDrawer(),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView.builder(
              itemCount: _api.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 80, color: Colors.white, child: Text(_api[index].descricao, style: TextStyle(color: Colors.red),)),
                );
              }),
        ));
  }
}
