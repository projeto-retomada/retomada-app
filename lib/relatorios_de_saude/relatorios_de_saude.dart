import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retomada/comun_elements/menu_app_bar.dart';
import 'package:retomada/model/HealthActivity.dart';
import 'package:retomada/relatorios_de_saude/relatorio_especifico.dart';
import 'package:retomada/usuarios/logged_user.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class RelatoriosDeSaudePage extends StatefulWidget {
  @override
  _RelatoriosDeSaudePageState createState() => _RelatoriosDeSaudePageState();
}

class _RelatoriosDeSaudePageState extends State<RelatoriosDeSaudePage> {

  List<HealthActivity> _api = [];
  LoggedUser log = new LoggedUser();

  Future<String> getHealthActivities() async {
    try {
      List<HealthActivity> listActivities = List();
      final response = await http
          .get('http://192.168.0.11:3333/user/'+ log.getId().toString() +'/health-activities');
      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body);
        decodedJson.forEach((item) => listActivities.add(HealthActivity.fromJson(item)));
        this.setState(() {
          print(listActivities.length);
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
    this.getHealthActivities();
  }

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.64;
    return new Scaffold(
        appBar: RetomadaAppBar(),
        drawer: NavigationDrawer(),
        floatingActionButton: new FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Color.fromRGBO(31, 150, 159, 1),
        ),
        body: Container(
          child:ListView.builder(
              itemCount: _api.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => RelatorioEspecificoPage(atividade: _api[index])))
                      },
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Icon(
                                      Icons.favorite,
                                      color: Color.fromRGBO(31, 150, 159, 1),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 10.0),
                                    width: c_width,
                                    child: Text("Registro de Estado de Saúde"),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 35.0),
                                    child: Text(
                                      DateFormat("yyyy/dd/MM hh:mm:ss").format(DateTime.parse(_api[index].data)),
                                      style: TextStyle(color: Colors.black38),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    )
                );
              }),
        ));
  }
}
