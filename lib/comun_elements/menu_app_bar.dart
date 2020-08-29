import 'package:flutter/material.dart';
import 'package:retomada/atividades/atividades.dart';
import 'package:retomada/criterios_sanitarios/criterios_sanitarios.dart';
import 'package:retomada/local/local_list.dart';
import 'package:retomada/perfil/perfil.dart';
import 'package:retomada/usuarios/usuarios_list.dart';

class RetomadaAppBar extends AppBar {
  RetomadaAppBar({Key key, Widget title})
      : super(
          key: key,
          title: Image.asset(
            'assets/retomada-logo-preto.png',
            width: 120.0,
          ),
          titleSpacing: 0.0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: new Icon(
                Icons.menu,
                size: 24,
                color: Color.fromRGBO(32, 153, 160, 1),
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        );
}

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text("imisspadme@universe.com"),
            accountName: Text(
              "Darth Vader",
              style: TextStyle(fontSize: 18),
            ),
            currentAccountPicture: new CircleAvatar(
              backgroundColor: Color.fromRGBO(31, 150, 159, 1),
              child: Text("D"),
            ),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.person,
                  size: 32,
                  color: Color.fromRGBO(32, 153, 160, 1),
                ),
                SizedBox(
                  width: 15,
                  height: 70,
                ),
                Text("Perfil",
                    style: TextStyle(fontSize: 17, fontFamily: 'Montserrat')) //
              ],
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PerfilPage()));
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.home,
                  size: 32,
                  color: Color.fromRGBO(32, 153, 160, 1),
                ),
                SizedBox(
                  width: 15,
                  height: 70,
                ),
                Text("Locais",
                    style: TextStyle(fontSize: 17, fontFamily: 'Montserrat')) //
              ],
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LocalList()));
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.check_box,
                  size: 32,
                  color: Color.fromRGBO(32, 153, 160, 1),
                ),
                SizedBox(
                  width: 15,
                  height: 70,
                ),
                Text("Atividades",
                    style: TextStyle(fontSize: 17, fontFamily: 'Montserrat')) //
              ],
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AtividadesPage()));
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.people,
                  size: 32,
                  color: Color.fromRGBO(32, 153, 160, 1),
                ),
                SizedBox(
                  width: 15,
                  height: 70,
                ),
                Text("Usuários",
                    style: TextStyle(fontSize: 17, fontFamily: 'Montserrat')) //
              ],
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UsuariosPage()));
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.content_paste,
                  size: 32,
                  color: Color.fromRGBO(32, 153, 160, 1),
                ),
                SizedBox(
                  width: 15,
                  height: 70,
                ),
                Text("Critérios Sanitários",
                    style: TextStyle(fontSize: 17, fontFamily: 'Montserrat')) //
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CriteriosSanitariosPage()));
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.healing,
                  size: 32,
                  color: Color.fromRGBO(32, 153, 160, 1),
                ),
                SizedBox(
                  width: 15,
                  height: 65,
                ),
                Text("Relatórios de Saúde",
                    style: TextStyle(fontSize: 17, fontFamily: 'Montserrat')) //
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.exit_to_app,
                  size: 32,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 15,
                  height: 65,
                ),
                Text("Sair",
                    style: TextStyle(fontSize: 17, fontFamily: 'Montserrat')) //
              ],
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
