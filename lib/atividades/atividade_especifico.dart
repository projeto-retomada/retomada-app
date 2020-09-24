import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retomada/comun_elements/menu_app_bar.dart';
import 'package:retomada/comun_elements/alert.dart';

class AtividadesEspecificoPage extends StatelessWidget {
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
                      alert.getAlert(context,
                          'info',
                          'Você ainda não participou dessa atividade',
                          buttonText: 'Participar da Atividade',
                          buttonFunction: ()=>{
                            print('oi')
                          }),
                      Divider(),
                      Row(
                        children: <Widget>[
                          Icon(Icons.assignment, color: Colors.black54,),
                          Padding(
                            padding: const EdgeInsets.only(left:5.0),
                            child: Text('Nome da Atividade', style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:15.0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.home, color: Colors.black26,),
                            Padding(
                              padding: const EdgeInsets.only(left:5.0),
                              child: Text('Local da atividade', style: TextStyle(color: Colors.black26),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ]))
          ]),
        ));
  }
}
