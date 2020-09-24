import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retomada/comun_elements/menu_app_bar.dart';

import 'atividade_especifico.dart';

class AtividadesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.64;
    return new Scaffold(
        appBar: RetomadaAppBar(),
        drawer: NavigationDrawer(),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: CustomScrollView(slivers: <Widget>[
            SliverList(
                delegate: SliverChildListDelegate([
                  Text(
                    "Atividades",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AtividadesEspecificoPage()));
                      },
                      child: Card(
                          child: Container(
                              width: c_width,
                              decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        color: Color.fromRGBO(31, 150, 159, 1),
                                        width: 10)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Nome da Atividade',
                                      style: TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                        'Local da Atividade',
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                        'Irá finalizar em xx/xx/xxxx',
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    ),
                                  ],
                                ),
                              ) // your card content
                              )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: GestureDetector(
                      onTap: () {
                        print('oi');
                      },
                      child: Card(
                          child: Container(
                              width: c_width,
                              decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        color: Color.fromRGBO(104, 178, 220, 1),
                                        width: 10)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Nome da Atividade',
                                      style: TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                        'Local da Atividade',
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                        'Iniciará em xx/xx/xxxx',
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    ),
                                  ],
                                ),
                              ) // your card content
                              )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: GestureDetector(
                      onTap: () {
                        print('oi');
                      },
                      child: Card(
                          child: Container(
                              width: c_width,
                              decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        color: Colors.black54,
                                        width: 10)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Nome da Atividade',
                                      style: TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                        'Local da Atividade',
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                        'Finalizada em xx/xx/xxxx',
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    ),
                                  ],
                                ),
                              ) // your card content
                          )
                      ),
                    ),
                  )
            ]))
          ]),
        ));
  }
}
