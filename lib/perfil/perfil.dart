import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retomada/comun_elements/menu_app_bar.dart';
import 'package:retomada/usuarios/logged_user.dart';

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.64;
    LoggedUser log = new LoggedUser();
    return new Scaffold(
        appBar: RetomadaAppBar(),
        drawer: NavigationDrawer(),
        body: Padding(
            padding: EdgeInsets.all(20.0),
            child: CustomScrollView(slivers: <Widget>[
              SliverList(
                  delegate: SliverChildListDelegate([
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
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    width: c_width,
                                    child: Text(
                                        'Questionário de Saúde Semanal',
                                        style: TextStyle(
                                          color: Color.fromRGBO(32, 153, 160, 1)
                                        ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.description, size: 20, color: Colors.black54,),
                                  Container(
                                    padding: EdgeInsets.only(left: 10),
                                    width: c_width,
                                    child: Text(
                                        'Você já respondeu ao questionário semanal', style: TextStyle(color: Colors.black54),),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(Icons.assignment, size: 20, color: Color.fromRGBO(32, 153, 160, 1)),
                                  Container(
                                    padding: EdgeInsets.only(left: 15),
                                    width: c_width,
                                    child: Text(
                                      'Atividades em Andamento', style: TextStyle(color: Color.fromRGBO(32, 153, 160, 1)),
                                    )
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      print('oi');
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(top:8, bottom: 8),
                                      width: c_width,
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('Nome da Atividade', style: TextStyle(color: Colors.black54)),
                                            Text('Local da Atividade', style: TextStyle(color: Colors.black54)),
                                            Text('As xx h e xx min', style: TextStyle(color: Colors.black54)),
                                          ],
                                        ),
                                      )
                                    ),
                                  ),
                                  Divider(),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.assignment, size: 20, color: Color.fromRGBO(104, 178, 220, 1)),
                                  Container(
                                      padding: EdgeInsets.only(left: 15),
                                      width: c_width,
                                      child: Text(
                                        'Próximas Atividades', style: TextStyle(color: Color.fromRGBO(104, 178, 220, 1)),
                                      )
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                        padding: EdgeInsets.only(top:8, bottom:8),
                                        width: c_width,
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text('Nome da Atividade', style: TextStyle(color: Colors.black54)),
                                              Text('Local da Atividade', style: TextStyle(color: Colors.black54)),
                                              Text('As xx h e xx min', style: TextStyle(color: Colors.black54)),
                                            ],
                                          ),
                                        )
                                    ),
                                  ),
                                  Divider(),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.assignment, size: 20, color: Colors.black54),
                                      Container(
                                          padding: EdgeInsets.only(left: 15),
                                          width: c_width,
                                          child: Text(
                                            'Atividades Encerradas', style: TextStyle(color: Colors.black54),
                                          )
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          print('oi');
                                        },
                                        child: Container(
                                            padding: EdgeInsets.only(top:8, bottom: 8),
                                            width: c_width,
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text('Nome da Atividade', style: TextStyle(color: Colors.black54)),
                                                  Text('Local da Atividade', style: TextStyle(color: Colors.black54)),
                                                  Text('As xx h e xx min', style: TextStyle(color: Colors.black54)),
                                                ],
                                              ),
                                            )
                                        ),
                                      ),
                                      Divider(),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ]))
            ])));
  }
}
