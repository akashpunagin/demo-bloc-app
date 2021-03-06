import 'package:bloc_demo/logic/cubit/counter/counter_cubit.dart';
import 'package:bloc_demo/presentation/screens/home_screen.dart';
import 'package:bloc_demo/presentation/screens/second_screen.dart';
import 'package:bloc_demo/presentation/screens/third_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      default:
        return null;
    }
  }
}