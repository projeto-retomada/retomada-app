import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retomada/comun_elements/menu_app_bar.dart';
import 'package:retomada/model/Activity.dart';
import 'package:retomada/usuarios/logged_user.dart';

import 'atividade_especifico.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class AtividadesPage extends StatefulWidget {
  @override
  _AtividadesPageState createState() => _AtividadesPageState();
}

class _AtividadesPageState extends State<AtividadesPage> {

  List<Activity> _api = [];
  LoggedUser log = new LoggedUser();

  Future<String> getActivities() async {
    try {
      List<Activity> listActivities = List();
      final response = await http
          .get('http://192.168.0.11:3333/user/'+ log.getId().toString() +'/activity-note');
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
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AtividadesEspecificoPage(atividade: _api[index])))
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
                                    Icons.check_box,
                                    color: Color.fromRGBO(31, 150, 159, 1),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10.0),
                                  width: c_width,
                                  child: Text(_api[index].descricao),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 35.0),
                                  child: Text(
                                    DateFormat("yyyy/dd/MM hh:mm:ss").format(DateTime.parse(_api[index].dataInicio)),
                                    style: TextStyle(color: Colors.black38),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 35.0),
                                  child: Text(
                                    DateFormat("yyyy/dd/MM hh:mm:ss").format(DateTime.parse(_api[index].dataEncerramento)),
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
