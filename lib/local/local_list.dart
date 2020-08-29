import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retomada/comun_elements/menu_app_bar.dart';

class LocalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width*0.64;
    return new Scaffold(
        appBar: RetomadaAppBar(),
        drawer: NavigationDrawer(),
        floatingActionButton: new FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Color.fromRGBO(31, 150, 159, 1),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: CustomScrollView(slivers: <Widget>[
            SliverList(
                delegate: SliverChildListDelegate([
              Text(
                "Locais",
                style: TextStyle(fontSize: 16),
              ),
              Column(
                children: <Widget>[
                  Card(
                    child: Container(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Icon(Icons.home, color: Color.fromRGBO(31, 150, 159, 1),),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10.0),
                                width: c_width,
                                child: Text("Quadra de esportes"),
                              ),
                              IconButton(
                                icon: Icon(Icons.edit),
                                color: Color.fromRGBO(31, 150, 159, 1),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 35.0),
                                child: Text("Lotação máxima 20 pessoas", style: TextStyle(
                                    color: Colors.black38
                                ),),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ]))
          ]),
        ));
  }
}
