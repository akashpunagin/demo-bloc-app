import 'package:bloc_demo/presentation/screens/home_screen.dart';
import 'package:bloc_demo/presentation/screens/jokes_screen.dart';
import 'package:bloc_demo/presentation/screens/second_screen.dart';
import 'package:bloc_demo/presentation/screens/third_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const HomeScreen(
          title: 'Flutter Demo Home Page',
          color: Colors.blueAccent,
        ),);
      case "/second":
        return MaterialPageRoute(builder: (context) => const SecondScreen(
          title: 'Second Screen',
          color: Colors.blueAccent,
        ));
      case "/third":
        return MaterialPageRoute(builder: (context) => const ThirdScreen(
          title: 'Third Screen',
          color: Colors.black,
        ));
      case "/jokes":
        return MaterialPageRoute(builder: (context) => const JokesScreen());
      default:
        return null;
    }
  }
}