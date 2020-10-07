import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retomada/comun_elements/menu_app_bar.dart';
import 'package:retomada/model/Activity.dart';
import 'package:retomada/usuarios/logged_user.dart';
import 'package:http/http.dart' as http;

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  List<Activity> _api = [];
  LoggedUser log = new LoggedUser();

  Future<String> getActivities() async {
    try {
      List<Activity> listActivities = List();
      final response = await http.get('http://192.168.1.32:3333/user/' +
          log.getId().toString() +
          '/activity-note');
      print('http://192.168.1.32:3333/user/' +log.getId().toString() + '/activity-note');
      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body);
        decodedJson
            .forEach((item) => listActivities.add(Activity.fromJson(item)));
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

    List<Widget> getWidgets() {
      List<Widget>  widgets = [
        Center(
          child: CircleAvatar(
            radius: 55,
            backgroundColor: Color.fromRGBO(32, 153, 160, 1),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Center(
            child: Text(
              log.getNome(),
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ];
      if (_api.length == 0) {
        widgets.add(
            Card(
              child: Container(
                padding: EdgeInsets.only(right: 20, left: 20, top: 40, bottom: 40),
                width: c_width,
                child: Column(
                  children: <Widget>[
                    Center(child: Image.asset('assets/sad.png', width: 60,)),
                    Padding(
                      padding: const EdgeInsets.only(top:15),
                      child: Center(child: Text('Não existem atividades relacionadas a você', style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600
                      ),),),
                    )
                  ],
                ),
              ),
            )
        );
        return widgets;
      } else {
        for(var item in _api) {
          widgets.add(
              Padding(
                padding: EdgeInsets.all(5),
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom:8.0),
                          child: Text(item.descricao, style: TextStyle(fontWeight: FontWeight.w600),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom:8.0),
                          child: Text('Data de início: '+DateTime.parse(item.dataInicio).day.toString()+' /'+
                              DateTime.parse(item.dataInicio).month.toString()+ ' /'+
                              DateTime.parse(item.dataInicio).year.toString()),
                        ),
                        Text('Data de finalização: '+DateTime.parse(item.dataEncerramento).day.toString()+' /'+
                            DateTime.parse(item.dataEncerramento).month.toString()+ ' /'+
                            DateTime.parse(item.dataEncerramento).year.toString())
                      ],
                    ),
                  ),
                ),
              )
          );
        }
        return widgets;
      }
    }
    return new Scaffold(
        appBar: RetomadaAppBar(),
        drawer: NavigationDrawer(),
        body: Padding(
            padding: EdgeInsets.all(20.0),
            child: CustomScrollView(slivers: <Widget>[
              SliverList(delegate: SliverChildListDelegate(
                  getWidgets()
              ))
            ])));
  }
}