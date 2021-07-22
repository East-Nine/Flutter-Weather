import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/api/weather_entity.dart';
import 'package:weather/data/weather_vo.dart';
import 'package:weather/generated/json/base/json_convert_content.dart';
import 'package:weather/util/Util.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  static const routeName = '/home';

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  WeatherVo? weather;

  @override
  void initState() {
    super.initState();

    callWeather();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      elevation: 0.0,
      leading: IconButton(
        icon: Icon(Icons.near_me),
        onPressed: () {
          Util.geolocation().then((value) => goToNex())
              .onError((error, stackTrace) => print(error))
              .catchError((error) => print(error));
        }
      ),
      actions: [
        Icon(Icons.settings)
      ],
    ),
    body: Center(
      child: Column(
        children: [
          FadeInImage.assetNetwork(
            image: weather?.icon ?? "",
            placeholder: "assets/images/bad.png",
          )
        ],
      )
      ),
    );

  void callWeather() async {
    var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=London&appid=637f5d9e5f418aa11b95f7e7f18f8de3');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        WeatherEntity weatherEntity = WeatherEntity().fromJson(json.decode(response.body));
        weather = WeatherVo.entityToVo(weatherEntity);
      });
    }
  }
}

goToNex() {
}

class HomeArguments {
  final Position position;

  HomeArguments(this.position);
}