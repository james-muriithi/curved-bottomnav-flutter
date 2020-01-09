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
    var label = 0;
    List<Widget> myButtons = List.generate(_map.length, (i) {
      var row = _map[i].split('');
      List<Widget> myList = [];
      var counter = 0;
      row.forEach((item) {
        var seat = new Seat((label + 1).toString(), false,
            MediaQuery.of(context).size.width / 7.5);
        if (item.toString().trim() == '_' && counter % 2 == 0) {
          // print(object)
          myList.add(Container(
            width: MediaQuery.of(context).size.width / 7.5,
            margin: EdgeInsets.only(left: 3.0, right: 3.0, bottom: 3.0),
          ));
        } else if (item.toString().trim() == '_' && i == 0 && counter == 5) {
          myList.add(Container(
            width: MediaQuery.of(context).size.width / 7.5,
            child: seat._driver(),
          ));
        } else if (item.toString().trim() == '_') {
          myList.add(Container(
            width: MediaQuery.of(context).size.width / 7.5,
            margin: EdgeInsets.only(left: 3.0, right: 3.0, bottom: 3.0),
          ));
        } else {
          label++;
          myList.add(seat);
        }
        counter++;
      });
      return new Row(children: myList);
    });
    return myButtons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25.0, right: 5.0),
        color: Colors.white30,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          padding: EdgeInsets.only(bottom: 30.0, top: 40.0),
          children: <Widget>[Column(children: _buttons())],
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

class Seat extends StatefulWidget {
  final String buttonText;
  bool changeButtonColor;
  final double width;
  Seat(this.buttonText, this.changeButtonColor, this.width);

  Widget _driver() {
    return Image.network(
        'https://james-muriithi.github.io/bus/images/driver.png');
  }

  @override
  MySeatState createState() => MySeatState();
}

class MySeatState extends State<Seat> {
  @override
  Widget build(BuildContext context) {
    Widget _seat() {
      Color _mycolor = Color.fromRGBO(150, 150, 150, 1);
      return Container(
        width: widget.width,
        margin: EdgeInsets.only(left: 3.0, right: 3.0, bottom: 3.0),
        child: MaterialButton(
          color: widget.changeButtonColor ? Color.fromRGBO(48, 119, 1, 1) : _mycolor,
          // highlightColor: changeButtonColor ? Color.fromRGBO(48, 119, 1, 1): Color.fromRGBO(48, 119, 1, 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
          child: new Text(
            widget.buttonText,
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          onPressed: () {
            setState(() {
              widget.changeButtonColor = !widget.changeButtonColor;
            });
          },
        ),
      );
    }

    return _seat();
  }
}
