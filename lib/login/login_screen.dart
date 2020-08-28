import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retomada/first/first_screen.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          title: Text(widget.title,
              style: TextStyle(color: Color.fromRGBO(31, 150, 159, 1))),
          leading: Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: Image.asset('assets/logo2.png'),
          ),
          backgroundColor: Colors.white,
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.all(30),
                child: Image.asset('assets/login.png', height: 300),
              ),
              Container(
                child: Form(
                    child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 20, right: 30, left: 30),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Digite seu usuário",
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(32, 153, 160, 1),
                              fontSize: 12),
                          contentPadding: EdgeInsets.all(15),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(32, 153, 160, 1),
                                width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(32, 153, 160, 1),
                                width: 1.0),
                          ),
                          filled: true,
                          fillColor: Color.fromRGBO(247, 247, 247, 1),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 5, bottom: 20, right: 30, left: 30),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Digite sua senha",
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(32, 153, 160, 1),
                              fontSize: 12),
                          contentPadding: EdgeInsets.all(15),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(32, 153, 160, 1),
                                width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(32, 153, 160, 1),
                                width: 1.0),
                          ),
                          filled: true,
                          fillColor: Color.fromRGBO(247, 247, 247, 1),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: 5, bottom: 20, right: 30, left: 30),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: FlatButton(
                            color: Color.fromRGBO(32, 153, 160, 1),
                            textColor: Colors.white,
                            disabledColor: Colors.grey,
                            disabledTextColor: Colors.black12,
                            padding: EdgeInsets.all(8.0),
                            splashColor: Color.fromRGBO(32, 153, 160, 1),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FirstScreen()));
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        )),
                  ],
                )),
              ),
              Container(
                  child: Padding(
                padding: EdgeInsets.only(bottom: 20, right: 30, left: 30),
                child: FlatButton(
                  color: Colors.transparent,
                  textColor: Color.fromRGBO(32, 153, 160, 1),
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black12,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.transparent,
                  onPressed: () {
                    /*...*/
                  },
                  child: Text(
                    "Esqueci minha senha",
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ))
            ]),
          )
        ],
      ),
    );
  }
}
