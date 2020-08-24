import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Retomada",
        theme: ThemeData(primaryColor: Colors.white, splashColor: Colors.cyan),
        home: myScreen());
  }

  myScreen() {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          title: Row(
            children: <Widget>[
              Image.asset('assets/logo2.png'),
              SizedBox(
                width: 15,
                height: 70,
              ),
              Text("Retomada", style: TextStyle(fontSize: 40)) //
            ],
          ),
          backgroundColor: Colors.white,
        ),
      ),
      body: Container(
        color: Colors.white,
      ),
      drawer: Container(
        width: 370,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text("Retomada",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(32, 153, 160, 1),
                    image:
                        DecorationImage(image: AssetImage("assets/logo2.png"))),
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.android,
                      size: 40,
                      color: Color.fromRGBO(32, 153, 160, 1),
                    ),
                    SizedBox(
                      width: 15,
                      height: 70,
                    ),
                    Text("Title", style: TextStyle(fontSize: 20)) //
                  ],
                ),
                onTap: () {},
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.home,
                      size: 40,
                      color: Color.fromRGBO(32, 153, 160, 1),
                    ),
                    SizedBox(
                      width: 15,
                      height: 70,
                    ),
                    Text("Locais", style: TextStyle(fontSize: 20)) //
                  ],
                ),
                onTap: () {},
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.check_box,
                      size: 40,
                      color: Color.fromRGBO(32, 153, 160, 1),
                    ),
                    SizedBox(
                      width: 15,
                      height: 70,
                    ),
                    Text("Atividades", style: TextStyle(fontSize: 20)) //
                  ],
                ),
                onTap: () {},
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.people,
                      size: 40,
                      color: Color.fromRGBO(32, 153, 160, 1),
                    ),
                    SizedBox(
                      width: 15,
                      height: 70,
                    ),
                    Text("Usuários", style: TextStyle(fontSize: 20)) //
                  ],
                ),
                onTap: () {},
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.list,
                      size: 40,
                      color: Color.fromRGBO(32, 153, 160, 1),
                    ),
                    SizedBox(
                      width: 15,
                      height: 70,
                    ),
                    Text("Critérios Sanitários",
                        style: TextStyle(fontSize: 20)) //
                  ],
                ),
                onTap: () {},
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.healing,
                      size: 40,
                      color: Color.fromRGBO(32, 153, 160, 1),
                    ),
                    SizedBox(
                      width: 15,
                      height: 65,
                    ),
                    Text("Relatórios de Saúde",
                        style: TextStyle(fontSize: 20)) //
                  ],
                ),
                onTap: () {},
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.exit_to_app,
                      size: 40,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 15,
                      height: 65,
                    ),
                    Text("Sair", style: TextStyle(fontSize: 20)) //
                  ],
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
