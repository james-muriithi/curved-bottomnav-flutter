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
        primaryColor: Colors.white,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.deepOrange,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "This is a demo app",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.deepOrange,
        height: 50,
        index: 0,
        items: <Widget>[
          Icon(Icons.home, size: 25,color: Colors.pink,),
          Icon(Icons.favorite, size: 25,color: Colors.pink,),
          Icon(Icons.shopping_cart, size: 25,color: Colors.pink,),
          Icon(Icons.account_circle, size: 25,color: Colors.pink,),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    );
  }
}
