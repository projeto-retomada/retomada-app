import 'package:flutter/material.dart';

class RetomadaAppBar extends AppBar {
  RetomadaAppBar({Key key, Widget title})
      : super(
          key: key,
          title: title,
          leading: Builder(
            builder: (context) => IconButton(
              icon: new Icon(
                Icons.menu,
                size: 24,
                color: Colors.white,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        );
}
