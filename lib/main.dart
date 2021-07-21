import 'package:flutter/material.dart';

import 'screens/splash.dart';
import 'screens/home.dart';
import 'screens/search.dart';

void main() => runApp(MyWeather());

class MyWeather extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyWeather();
}

class _MyWeather extends State<MyWeather> {
  @override
  Widget build(BuildContext context) => MaterialApp(
      theme: ThemeData(
          primaryColor: Color.fromARGB(255, 244, 155, 51),
        scaffoldBackgroundColor: Color.fromARGB(255, 244, 155, 51)
      ),
      initialRoute: '/',
      routes: {
        Splash.routeName: (context) => Splash(),
        Home.routeName: (context) => Home(),
        Search.routeName: (context) => Search()
      }
  );
}