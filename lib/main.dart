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
  List<String> _map = [
    'ee____',
    'ee_eee',
    'ee_eee',
    '___eee',
    'ee_eee',
    'ee_eee',
    'ee_eee',
    'ee_eee',
    'ee_eee',
    'ee_eee',
    'eeeeee',
  ];

  List<Widget> _buttons() {
     List<Widget> myButtons = List.generate(_map.length, (i) {
      var row = _map[i].split('');
      row.forEach((item) {
        if(item.toString().trim() == '_'){
          return Container(
                  width: 50,
                );
        }
        return _seat('buttonText');
      });
    });
    return myButtons;
  }

  Widget _seat(String buttonText) {
    Color _mycolor = Color.fromRGBO(150, 150, 150, 1);
    return Container(
      width: 50,
      margin: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 3.0),
      child: MaterialButton(
        color: _mycolor,
        highlightColor: Color.fromRGBO(48, 119, 1, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
        child: new Text(
          buttonText,
          style: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        onPressed: () {
          setState(() {
            // _mycolor = Color.fromRGBO(48, 119, 1, 1);
          });
        },
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
                _seat('3'),
                _seat('4'),
                Container(
                  width: 30,
                ),
                _seat('5'),
                _seat('6'),
                _seat('7'),
              ],
            ),
            Row(
              children: <Widget>[
                _seat('8'),
                _seat('9'),
                Container(
                  width: 30,
                ),
                _seat('10'),
                _seat('11'),
                _seat('12'),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 60,
                ),
                Container(
                  width: 60,
                ),
                Container(
                  width: 30,
                ),
                _seat('13'),
                _seat('14'),
                _seat('15'),
              ],
            ),
            Row(
              children: <Widget>[
                _seat('16'),
                _seat('17'),
                Container(
                  width: 30,
                ),
                _seat('18'),
                _seat('19'),
                _seat('20'),
              ],
            ),
            Row(
              children: <Widget>[
                _seat('21'),
                _seat('22'),
                Container(
                  width: 30,
                ),
                _seat('23'),
                _seat('24'),
                _seat('25'),
              ],
            ),
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

class Seat{
   final String buttonText;
  bool changeButtonColor;
  Seat({this.buttonText,this.changeButtonColor});
}
