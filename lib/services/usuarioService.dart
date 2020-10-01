import 'dart:convert' as convert;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:retomada/home_page/home_screen.dart';
import 'package:retomada/perfil/perfil.dart';
import 'package:retomada/usuarios/logged_user.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void login(String email, String senha, context) async {
  var url = 'http://192.168.1.33:3333/login';

  // Await the http get response, then decode the json-formatted response.
  var response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: convert.jsonEncode(<String, String>{'email': email, 'senha': senha}),
  );
  if (response.statusCode == 200) {
    var resposta = convert.jsonDecode(response.body);
    LoggedUser log = new LoggedUser();
    print(resposta[0]);
    log.setUser(
        resposta[0]['id_usuario'],
        resposta[0]['nome'],
        resposta[0]['grupo_risco'],
        resposta[0]['imune'],
        resposta[0]['metadata'],
        resposta[0]['tipo_usuario'],
        resposta[0]['email'],
        resposta[0]['id_instituicao']);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomeScreen()));
  } else {
    var resposta = convert.jsonDecode(response.body);
    Alert(
      context: context,
      title: "Ooops!",
      desc: resposta['error'],
      buttons: [],
      image: Image.asset(
        "assets/sad.png",
        width: 50,
      ),
    ).show();
  }
}
