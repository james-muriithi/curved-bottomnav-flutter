import 'package:flutter/material.dart';
import 'package:bottom_nav/seat_arrangement.dart';
import 'available_buses.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        // return MaterialPageRoute(builder: (_) => MyHomePage(title: 'Seat Arrangement'));
        return MaterialPageRoute(builder: (_) => Results());
      case '/second':
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        print('object');
        return MaterialPageRoute(builder: (_) => MyHomePage(title: 'Seat Arrangement'));
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}