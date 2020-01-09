import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Botttom Navigation',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: MyHomePage(title: 'Botttom Navigation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _seat(String buttonText) {
    return Container(
      width: 50,
      margin: EdgeInsets.all(5.0),
      child: OutlineButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
        child: new Text(
          buttonText,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
        color: Colors.white30,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                _seat('1'),
                _seat('2'),
                Container(
                  width: 30,
                ),
                Container(
                  width: 50,
                ),
                Container(
                  width: 50,
                ),
                Container(
                  width: 50,
                  child: Image.network(
                      'https://james-muriithi.github.io/bus/images/driver.png'),
                )
              ],
            ),
            Row(
              children: <Widget>[
                _seat('1'),
                _seat('2'),
                Container(
                  width: 30,
                ),
                _seat('1'),
                _seat('2'),
                _seat('1'),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white24,
        height: 50,
        index: 0,
        items: <Widget>[
          Icon(
            Icons.airline_seat_legroom_extra,
            size: 25,
            color: Colors.pink,
          ),
          Icon(
            Icons.directions_bus,
            size: 25,
            color: Colors.pink,
          ),
          Icon(
            Icons.history,
            size: 25,
            color: Colors.pink,
          ),
          Icon(
            Icons.account_circle,
            size: 25,
            color: Colors.pink,
          ),
        ],
        onTap: (index) {},
      ),
    );
  }
}
