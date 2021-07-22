import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/screens/home.dart';
import 'package:weather/util/Util.dart';

class Splash extends StatefulWidget {
  static const routeName = '/';

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Timer? _timer;

  @override
  void initState() {
    Util.geolocation().then((position) => goToNex(position))
        .onError((error, stackTrace) => print(error))
    .catchError((error) => print(error));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Image.asset(
        'assets/images/splash.png',
        width: 200,
        fit: BoxFit.contain,
      ),
    ),
  );

  void goToNex(Position position) {
    int time = 0;
    _timer = Timer.periodic(
        Duration(seconds: 1),
            (timer) {
              if (time == 3) {
                timer.cancel();
                _timer = null;

                Navigator.pushReplacementNamed(
                    context,
                    Home.routeName,
                    arguments: HomeArguments(position)
                );
              } else {
                time++;
              }
            }
    );
  }
}