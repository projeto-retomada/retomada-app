import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retomada/comun_elements/menu_app_bar.dart';
import 'package:retomada/comun_elements/alert.dart';
import 'package:retomada/model/Location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:retomada/usuarios/logged_user.dart';


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
      final response = await http.get('http://192.168.1.35:3333/list-locations/{"id_instituicao":'+log.getInstituicao().toString()+'}');
      if (response.statusCode == 200) {
        var decodedJson = convert.jsonDecode(response.body);
        decodedJson.forEach((item) => listLocations.add(Location.fromJson(item)));
        this.setState(() {
          _api = listLocations;
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
                  child: Container(height: 80, color: Colors.white, child: Text(_api[index].descricao, style: TextStyle(color: Colors.red),)),
                );
              }),
        ));
  }
}



//class LocalList extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    double c_width = MediaQuery.of(context).size.width * 0.64;
//    RetomadaAlert alert = new RetomadaAlert();
//    return new Scaffold(
//        appBar: RetomadaAppBar(),
//        drawer: NavigationDrawer(),
//        floatingActionButton: new FloatingActionButton(
//          child: Icon(Icons.add),
//          backgroundColor: Color.fromRGBO(31, 150, 159, 1),
//        ),
//        body: Padding(
//          padding: EdgeInsets.all(20.0),
//          child: CustomScrollView(slivers: <Widget>[
//            SliverList(
//                delegate: SliverChildListDelegate([
//              Text(
//                "Locais",
//                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//              ),
//              Column(
//                children: <Widget>[
//                  Card(
//                    child: Container(
//                      padding: EdgeInsets.only(
//                          left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
//                      child: Column(
//                        children: <Widget>[
//                          Row(
//                            children: <Widget>[
//                              Align(
//                                alignment: Alignment.topLeft,
//                                child: Icon(
//                                  Icons.home,
//                                  color: Color.fromRGBO(31, 150, 159, 1),
//                                ),
//                              ),
//                              Container(
//                                padding: EdgeInsets.only(left: 10.0),
//                                width: c_width,
//                                child: Text("Quadra de esportes"),
//                              ),
//                            ],
//                          ),
//                          Row(
//                            children: <Widget>[
//                              Padding(
//                                padding: EdgeInsets.only(left: 35.0),
//                                child: Text(
//                                  "Lotação máxima 20 pessoas",
//                                  style: TextStyle(color: Colors.black38),
//                                ),
//                              ),
//                            ],
//                          ),
//                        ],
//                      ),
//                    ),
//                  )
//                ],
//              ),
//            ]))
//          ]),
//        ));
//  }
//}
