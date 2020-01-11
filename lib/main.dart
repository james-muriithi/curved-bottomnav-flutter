import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seat Arrangement',
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.blueAccent,
      ),
      home: MyHomePage(title: 'Seat Arrangement'),
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
  Future<List<Widget>> _myButons;
  var _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _myButons = _buttons();
  }

  /// the seat map array
  /// the letters represents seats
  /// underscores rep spaces*/
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

  String url =
      'https://examinationcomplaint.theschemaqhigh.co.ke/HCI/api/book/?bus_id=1&booked_seats';
  Future _fetchBooked() async {
    var response = await get(url);
    var jsonData = jsonDecode(response.body);
    return jsonData;
  }

  /// a function that returns the seats as buttons
  /// in Rows*/
  Future<List<Widget>> _buttons() {
    // the button label which starts at seat 1
    var label = 1;
    // iterate through the seat map array

    var myFuture = _fetchBooked().then((_bookedSeats) {
      List<Widget> myButtons = List.generate(_map.length, (i) {
        // convert the string of every element to an array to get individual seats
        var row = _map[i].split('');
        // list to append the buttons and empty spaces
        List<Widget> myList = [];
        // counter per row
        var counter = 0;
        // iterate through a row
        row.forEach((item) {
          // initialize the Seat class
          var seat = new Seat((label).toString(), false,
              MediaQuery.of(context).size.width / 7.5);
          // the last seat in row 1 add the driver icon
          if (item.toString().trim() == '_' && i == 0 && counter == 5) {
            myList.add(Container(
              width: MediaQuery.of(context).size.width / 7.5,
              child: seat._driver(),
            ));
          }
          // if the item is an underscore add an empty container to the list
          else if (item.toString().trim() == '_') {
            myList.add(Container(
              width: MediaQuery.of(context).size.width / 7.5,
              margin: EdgeInsets.only(left: 3.0, right: 3.0, bottom: 3.0),
            ));
          } else {
            //else add a seat button
            // increment the label counter
            if (_bookedSeats.contains(label.toString())) {
              seat.disabledColor = Colors.red;
            }
            myList.add(seat);
            label++;
          }
          // increment the per row counter
          counter++;
        });
        // return a row with the seat buttons as children
        return new Row(children: myList);
      });
      return myButtons;
    });
    return myFuture;
  }

  Future<List<Widget>> _refresh() async {
    setState(() {
      _myButons = _buttons();
    });
    return _myButons;
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
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: FutureBuilder(
              future: _myButons,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return ListView(
                  padding: EdgeInsets.only(bottom: 30.0, top: 40.0),
                  children: <Widget>[Column(children: snapshot.data)],
                );
              }),
        ),
      ),
      // bottom nav
      bottomNavigationBar: BubbleBottomBar(
          opacity: .2,
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
            // _tabController.animateTo(index,
            //     duration: Duration(milliseconds: 300), curve: Curves.ease);
          },
          elevation: 8,
          hasNotch: false, //new
          hasInk: true, //new, gives a cute ink effect
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Theme.of(context).accentColor,
                ),
                title: Text("Home")),

                BubbleBottomBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(
                  Icons.directions_bus,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.directions_bus,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text("Buses")),

                BubbleBottomBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(
                  Icons.history,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.history,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text("History")),

                BubbleBottomBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.account_circle,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text("Account")),
          ]),
    );
  }
}

/// a seat class that takes in 3 arguments
/// button text, bool changebutton color and the width of the  button
class Seat extends StatefulWidget {
  final String buttonText;
  bool changeButtonColor;
  final double width;
  Color disabledColor;
  Seat(this.buttonText, this.changeButtonColor, this.width,
      {this.disabledColor});

  Widget _driver() {
    return Image.network(
        'https://james-muriithi.github.io/bus/images/driver.png');
  }

  @override
  MySeatState createState() => MySeatState();
}

class MySeatState extends State<Seat> {
  // function that returns seat button widget
  Widget _seat() {
    Color _mycolor = Color.fromRGBO(150, 150, 150, 1);
    return Container(
      width: widget.width,
      margin: EdgeInsets.only(left: 3.0, right: 3.0, bottom: 3.0),
      child: MaterialButton(
        color: widget.disabledColor != null
            ? widget.disabledColor
            : widget.changeButtonColor
                ? Color.fromRGBO(48, 119, 1, 1)
                : _mycolor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
        child: new Text(
          widget.buttonText,
          style: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        onPressed: () {
          if (widget.disabledColor != null) {
            Fluttertoast.showToast(
                msg: 'Seat is already booked!',
                toastLength: Toast.LENGTH_SHORT,
                backgroundColor: Colors.red,
                gravity: ToastGravity.BOTTOM);
          } else {
            setState(() {
              widget.changeButtonColor = !widget.changeButtonColor;
            });
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _seat();
  }
}
