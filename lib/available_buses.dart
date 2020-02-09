import 'package:flutter/material.dart';
import 'card.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

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
        // bottom nav
      bottomNavigationBar: BubbleBottomBar(
          opacity: .2,
          onTap: (int index) {
            // Navigator.pop(context);
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
      ),
    );
  }
}
