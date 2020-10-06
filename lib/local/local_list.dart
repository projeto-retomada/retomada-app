import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retomada/comun_elements/menu_app_bar.dart';
import 'package:retomada/model/Location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:retomada/usuarios/logged_user.dart';

import 'local.dart';

class LocaisPage extends StatefulWidget {
  @override
  _LocaisPageState createState() => _LocaisPageState();
}

class _LocaisPageState extends State<LocaisPage> {
  List<Location> _api = [];

  Future<String> getLocations() async {
    try {
      List<Location> listLocations = List();
      LoggedUser log = new LoggedUser();
      final response = await http.get(
          'http://192.168.1.32:3333/list-locations/?filters={"id_instituicao":' +
              log.getInstituicao().toString() +
              '}');
      if (response.statusCode == 200) {
        var decodedJson = convert.jsonDecode(response.body);
        print(decodedJson);
        decodedJson
            .forEach((item) => listLocations.add(Location.fromJson(item)));
        this.setState(() {
          _api = listLocations;
        });
      } else {
        print(response);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    this.getLocations();
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
                        MaterialPageRoute(builder: (context) => LocaisEspecificoPage(local: _api[index])))
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
                                      Icons.home,
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
                                      "Lotação máxima " +
                                          _api[index]
                                              .lotacao_maxima
                                              .toString() +
                                          " pessoas",
                                      style: TextStyle(color: Colors.black38),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
              }),
        ));
  }
}
