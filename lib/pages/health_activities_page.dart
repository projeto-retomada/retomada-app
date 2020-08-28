import 'package:flutter/material.dart';

class HealthActivitiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.info),
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
              ),
              Text('HealthActivities Page'),
            ],
          ),
        ],
      ),
    );
  }
}
