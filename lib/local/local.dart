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
        DateTime now = DateTime.now();
        DateTime dateBegin;
        DateTime dateEnd;
        print(decodedJson);
        for(var item in decodedJson) {
          dateBegin = DateTime.parse(Activity.fromJson(item).dataInicio);
          dateEnd = DateTime.parse(Activity.fromJson(item).dataEncerramento);
          if (dateBegin.isBefore(now) && dateEnd.isAfter(now)) {
            listActivities.add(Activity.fromJson(item));
          }
        }
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
    List<Widget> activitiesWidgets() {
      List<Widget>  widgets = [Container(
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
      ),
        Card(
          child: Container(
            padding: EdgeInsets.all(15),
            width: c_width,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.home, color: Color.fromRGBO(32, 153, 160, 1),),
                      Text('   Tipo de ambiente: ', style: TextStyle(fontWeight: FontWeight.w600),),
                      Text(' ' + widget.local.aberto_fechado)
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.people, color: Color.fromRGBO(32, 153, 160, 1),),
                    Text('   Lotação Máxima: ', style: TextStyle(fontWeight: FontWeight.w600),),
                    Text(' ' + widget.local.lotacao_maxima.toString()+' pessoas')
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          width: c_width,
          child: Text('Atividades em andamento no local', style: TextStyle(fontWeight: FontWeight.w600),),
        )];
      if (_api.length == 0) {
        widgets.add(
          Container(
            padding: EdgeInsets.all(20),
            width: c_width,
            child: Column(
              children: <Widget>[
                Center(child: Image.asset('assets/sad.png', width: 60,)),
                Padding(
                  padding: const EdgeInsets.only(top:15),
                  child: Center(child: Text('Não existem atividades em andamento nesse local', style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600
                  ),),),
                )
              ],
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
            padding: EdgeInsets.all(10.0),
            child: CustomScrollView(slivers: <Widget>[
              SliverList(delegate: SliverChildListDelegate(
                  activitiesWidgets()
              ))
            ])));
  }
}
