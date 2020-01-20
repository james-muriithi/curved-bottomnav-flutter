import 'package:flutter/material.dart';
import 'card.dart';

class Results extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Available Buses',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Available Buses'),
          backgroundColor: Colors.deepPurple,
        ),
        body: ListView(children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 15.0, right: 10.0, left: 10.0),
            child: ResultCard(
                'busName', 'numberPlate', 'from', '', 'availability', 'fare'),
          )
        ]),
      ),
    );
  }
}
