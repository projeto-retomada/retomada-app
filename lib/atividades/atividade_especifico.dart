import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retomada/comun_elements/menu_app_bar.dart';
import 'package:retomada/comun_elements/alert.dart';
import 'package:retomada/model/Activity.dart';
import 'package:intl/intl.dart';

import 'atividades.dart';

class AtividadesEspecificoPage extends StatefulWidget {
  final Activity atividade;

  AtividadesEspecificoPage({this.atividade});

  @override
  _AtividadesEspecificoPageState createState() => _AtividadesEspecificoPageState(this.atividade);
}

class _AtividadesEspecificoPageState extends State<AtividadesEspecificoPage> {
  final atividade;

  _AtividadesEspecificoPageState(this.atividade);

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.64;
    RetomadaAlert alert = new RetomadaAlert();
    return new Scaffold(
        appBar: RetomadaAppBar(),
        drawer: NavigationDrawer(),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: CustomScrollView(slivers: <Widget>[
            SliverList(
                delegate: SliverChildListDelegate([
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                              widget.atividade.descricao,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600
                              )
                          ),
                          OutlineButton(
                            onPressed: () => {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => AtividadesPage()))
                            },
                            child: Text('Voltar'),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: <Widget>[
                          Icon(Icons.assignment, color: Colors.black54,),
                          Padding(
                            padding: const EdgeInsets.only(left:5.0),
                            child: Text(widget.atividade.descricao, style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.calendar_today, color: Colors.black54,),
                          Padding(
                            padding: const EdgeInsets.only(left:5.0),
                            child: Text(DateFormat("yyyy/dd/MM hh:mm:ss").format(DateTime.parse(widget.atividade.dataInicio)),
                              style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.calendar_today, color: Colors.black54,),
                          Padding(
                            padding: const EdgeInsets.only(left:5.0),
                            child: Text((DateFormat("yyyy/dd/MM hh:mm:ss").format(DateTime.parse(widget.atividade.dataEncerramento))), style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),),
                          ),
                        ],
                      ),
                    ],
                  )
                ]))
          ]),
        ));
  }
}
