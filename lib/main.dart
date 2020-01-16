import 'package:flutter/material.dart';
import 'package:bottom_nav/route_generator.dart';

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
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
