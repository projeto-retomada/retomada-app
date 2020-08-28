import 'package:flutter/material.dart';
import 'package:retomada/comun_elements/menu_app_bar.dart';
import 'package:retomada/pages/activities_page.dart';
import 'package:retomada/pages/health_activities_page.dart';
import 'package:retomada/pages/health_criteria_page.dart';
import 'package:retomada/pages/places_page.dart';
import 'package:retomada/pages/profile_page.dart';
import 'package:retomada/pages/users_page.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Retomada",
        theme: ThemeData(
            primaryColor: Color.fromRGBO(32, 153, 160, 1),
            splashColor: Colors.cyan),
        home: myScreen());
  }

  myScreen() {
    return MasterPagePage();
  }
}

class MasterPagePage extends StatefulWidget {
  @override
  _MasterPagePageState createState() => _MasterPagePageState();
}

class _MasterPagePageState extends State<MasterPagePage> {
  int pageNo;
  @override
  void initState() {
    super.initState();
    pageNo = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new RetomadaAppBar(
          title: new Text('Perfil'),
        ),
        body: getPage(),
        drawer: Container(
          width: 370,
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName:
                      new Text("Darth Vader", style: TextStyle(fontSize: 20)),
                  accountEmail: new Text("imisspadmes2@spacemail.com"),
                  currentAccountPicture: new CircleAvatar(
                    backgroundColor: Colors.black,
                    child: new Text("D"),
                  ),
                  otherAccountsPictures: [
                    new CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.close),
                    )
                  ],
                ),
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(
                        Icons.person,
                        size: 38,
                        color: Color.fromRGBO(32, 153, 160, 1),
                      ),
                      SizedBox(
                        width: 15,
                        height: 70,
                      ),
                      Text("Perfil", style: TextStyle(fontSize: 20)) //
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      pageNo = 1;
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        size: 38,
                        color: Color.fromRGBO(32, 153, 160, 1),
                      ),
                      SizedBox(
                        width: 15,
                        height: 70,
                      ),
                      Text("Locais", style: TextStyle(fontSize: 20)) //
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      pageNo = 2;
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(
                        Icons.check_box,
                        size: 38,
                        color: Color.fromRGBO(32, 153, 160, 1),
                      ),
                      SizedBox(
                        width: 15,
                        height: 70,
                      ),
                      Text("Atividades", style: TextStyle(fontSize: 20)) //
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      pageNo = 3;
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(
                        Icons.people,
                        size: 38,
                        color: Color.fromRGBO(32, 153, 160, 1),
                      ),
                      SizedBox(
                        width: 15,
                        height: 70,
                      ),
                      Text("Usuários", style: TextStyle(fontSize: 20)) //
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      pageNo = 4;
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(
                        Icons.content_paste,
                        size: 38,
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
                  onTap: () {
                    setState(() {
                      pageNo = 5;
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(
                        Icons.healing,
                        size: 38,
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
                  onTap: () {
                    setState(() {
                      pageNo = 6;
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(
                        Icons.exit_to_app,
                        size: 38,
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
        ));
  }

  getPage() {
    switch (pageNo) {
      case 1:
        return ProfilePage();
        break;
      case 2:
        return PlacesPage();
        break;
      case 3:
        return ActivitiesPage();
        break;
      case 4:
        return UsersPage();
        break;
      case 5:
        return HealthCriteriaPage();
        break;
      case 6:
        return HealthActivitiesPage();
        break;
      default:
    }
  }
}
