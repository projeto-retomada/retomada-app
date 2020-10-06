import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retomada/comun_elements/menu_app_bar.dart';
import 'package:retomada/model/Activity.dart';
import 'package:retomada/model/Location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'local_list.dart';

class LocaisEspecificoPage extends StatefulWidget {
  final local;

  LocaisEspecificoPage({this.local});

  @override
  _LocaisEspecificoPageState createState() =>
      _LocaisEspecificoPageState(this.local);
}

class _LocaisEspecificoPageState extends State<LocaisEspecificoPage> {
  List<Activity> _api = [];
  final local;

  _LocaisEspecificoPageState(this.local);

  Future<String> getActivities() async {
    try {
      List<Activity> listActivities = List();
      final response = await http.get('http://192.168.1.32:3333/' +
          this.local.id_local.toString() +
          '/activity');
      if (response.statusCode == 200) {
        var decodedJson = convert.jsonDecode(response.body);
        print(decodedJson);
        decodedJson
            .forEach((item) => listActivities.add(Activity.fromJson(item)));
        this.setState(() {
          _api = listActivities;
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
    this.getActivities();
  }

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.64;
    return new Scaffold(
        appBar: RetomadaAppBar(),
        drawer: NavigationDrawer(),
        body: Padding(
            padding: EdgeInsets.all(10.0),
            child: CustomScrollView(slivers: <Widget>[
              SliverList(delegate: SliverChildListDelegate([
                Container(
                  width: c_width,
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                          widget.local.descricao,
                          style: TextStyle(
                            fontWeight: FontWeight.w600
                          )
                      ),
                      OutlineButton(
                        onPressed: () => {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => LocaisPage()))
                        },
                        child: Text('Voltar'),
                      ),
                    ],
                  ),
                )
              ]))
            ])));
  }
}
