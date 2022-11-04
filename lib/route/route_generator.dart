import 'package:flutter/material.dart';
import 'package:sql_netcore/screens/homescreen.dart';
import 'package:sql_netcore/screens/signin_db.dart';
import 'package:sql_netcore/screens/signup_db.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => signup_db());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('No Route'),
            centerTitle: true,
          ),
          body: const Center(
            child: Text(
              'Sorry no route was found',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),
        );
      },
    );
  }
}
