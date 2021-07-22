import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/api/weather_entity.dart';
import 'package:weather/data/weather_vo.dart';
import 'package:weather/util/Util.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  static const routeName = '/home';

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  WeatherVo? weather;
  String? icon;

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
          CachedNetworkImage(
            imageUrl: weather?.icon ?? "",
            placeholder: (context, url) => Image.asset("assets/images/bad.png"),
            errorWidget: (context, url, error) => Image.asset("assets/images/bad.png"),
            fadeInDuration: Duration(milliseconds: 100),
            fadeOutDuration: Duration(milliseconds: 100),
            fit: BoxFit.contain,
            width: 120.0,
            height: 120.0,
          ),
          Text(weather?.temp.toStringAsFixed(2) ?? ""),
          Text(weather?.week ?? ""),
          Text(weather?.date ?? ""),
          Text(weather?.time ?? ""),
        ],
      )
      ),
    );

  void callWeather() async {
    var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=637f5d9e5f418aa11b95f7e7f18f8de3');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        WeatherEntity weatherEntity = WeatherEntity().fromJson(json.decode(response.body));
        weather = WeatherVo.entityToVo(weatherEntity);

        icon = weather?.icon;
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