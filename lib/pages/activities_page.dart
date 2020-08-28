import 'package:flutter/material.dart';

class ActivitiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.info,
                size: 40,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
              ),
              Text('Activities Page'),
            ],
          ),
        ],
      ),
    );
  }
}
