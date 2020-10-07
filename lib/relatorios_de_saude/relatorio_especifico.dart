import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retomada/comun_elements/menu_app_bar.dart';
import 'package:retomada/comun_elements/alert.dart';
import 'package:retomada/model/Activity.dart';
import 'package:intl/intl.dart';
import 'package:retomada/model/HealthActivity.dart';
import 'package:retomada/relatorios_de_saude/relatorios_de_saude.dart';


class RelatorioEspecificoPage extends StatefulWidget {
  final HealthActivity atividade;

  RelatorioEspecificoPage({this.atividade}){
    if(this.atividade.cansaco == "S") {
      this.atividade.cansaco = "Sim";
    } else {
      this.atividade.cansaco = "Não";
    }

    if(this.atividade.febre == "S") {
      this.atividade.febre = "Sim";
    } else {
      this.atividade.febre = "Não";
    }

    if(this.atividade.dificuldadeRespiracao == "S") {
      this.atividade.dificuldadeRespiracao = "Sim";
    } else {
      this.atividade.dificuldadeRespiracao = "Não";
    }

    if(this.atividade.coriza == "S") {
      this.atividade.coriza = "Sim";
    } else {
      this.atividade.coriza = "Não";
    }

    if(this.atividade.contatoComExposto == "S") {
      this.atividade.contatoComExposto = "Sim";
    } else {
      this.atividade.contatoComExposto = "Não";
    }
  }

  @override
  _RelatorioEspecificoPage createState() => _RelatorioEspecificoPage(this.atividade);
}

class _RelatorioEspecificoPage extends State<RelatorioEspecificoPage> {
  final atividade;

  _RelatorioEspecificoPage(this.atividade);

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
                              "Relatório de Atividade",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600
                              )
                          ),
                          OutlineButton(
                            onPressed: () => {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => RelatoriosDeSaudePage()))
                            },
                            child: Text('Voltar'),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: <Widget>[
                          Icon(Icons.calendar_today, color: Colors.black54,),
                          Padding(
                            padding: const EdgeInsets.only(left:5.0),
                            child: Text(DateFormat("yyyy/dd/MM hh:mm:ss").format(DateTime.parse(widget.atividade.data)),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.airline_seat_individual_suite, color: Colors.black54,),
                          Padding(
                            padding: const EdgeInsets.only(left:5.0),
                            child: Text("Cansaço: " + widget.atividade.cansaco, style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.person, color: Colors.black54,),
                          Padding(
                            padding: const EdgeInsets.only(left:5.0),
                            child: Text("Febre: " + widget.atividade.febre, style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.error_outline, color: Colors.black54,),
                          Padding(
                            padding: const EdgeInsets.only(left:5.0),
                            child: Text("Coriza: " + widget.atividade.coriza, style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.accessibility, color: Colors.black54,),
                          Padding(
                            padding: const EdgeInsets.only(left:5.0),
                            child: Text("Contato com Exposto: " + widget.atividade.contatoComExposto, style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.person, color: Colors.black54,),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text("Dificuldade de Respiração: " + widget.atividade.dificuldadeRespiracao, style: TextStyle(
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
