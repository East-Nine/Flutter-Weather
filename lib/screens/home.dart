import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/api/weather_entity.dart';
import 'package:weather/data/weather_vo.dart';
import 'package:weather/screens/search.dart';
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
    Future.delayed(Duration.zero, () {
      Object? args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is HomeArguments) {
        Position position = args.position;
        Uri uri = setUriFromPosition(position.latitude, position.longitude);
        callWeather(uri);
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      elevation: 0.0,
      leading: IconButton(
          icon: Icon(Icons.near_me),
          onPressed: () {
            Util.geolocation().then((value) => searchToMe())
                .onError((error, stackTrace) => print(error))
                .catchError((error) => print(error));
          }
      ),
      actions: [
        IconButton(
            onPressed: () => goToSearch(),
            icon: Icon(Icons.location_searching)
        )
      ],
    ),
    body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
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
                Text(
                  (weather?.temp.toStringAsFixed(2) ?? '') + '°',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 48
                  ),
                )
              ],
            ),
            Column(
              children: [

                Text(
                  weather?.week ?? "",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                  ),
                ),
                Text(
                  weather?.date ?? "",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Text(
                    weather?.time ?? "",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                    ),
                  ),
                )
              ],
            ),
          ],
        )
    ),
  );

  Uri setUriFromPosition(double lat, double lon) => Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=637f5d9e5f418aa11b95f7e7f18f8de3');
  Uri setUriFromCity(String city) => Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=637f5d9e5f418aa11b95f7e7f18f8de3');

  void searchToMe() {
    Util.geolocation()
        .then(
            (position) {
              Uri uri = setUriFromPosition(position.latitude, position.longitude);
              return callWeather(uri);
          }
        )
        .onError((error, stackTrace) => print(error))
        .catchError((error) => print(error));
  }

  void goToSearch() {
    Navigator.pushNamed(context, Search.routeName);
  }

  void callWeather(Uri url) async {
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

class HomeArguments {
  final Position position;

  HomeArguments(this.position);
}