import 'package:weather/generated/json/base/json_convert_content.dart';
import 'package:weather/generated/json/base/json_field.dart';

class WeatherEntity with JsonConvert<WeatherEntity> {
	final WeatherCoord coord;
	final List<WeatherWeather> weather;
	final String base;
	final WeatherMain main;
	final int visibility;
	final WeatherWind wind;
	final WeatherClouds clouds;
	final int dt;
	final WeatherSys sys;
	final int id;
	final String name;
	final int cod;

	WeatherEntity({
		required this.coord,
		required this.weather,
		required this.base,
		required this.main,
		required this.visibility,
		required this.wind,
		required this.clouds,
		required this.dt,
		required this.sys,
		required this.id,
		required this.name,
		required this.cod,
	});

	factory WeatherEntity.fromJson(Map<String, dynamic> json) =>
			WeatherEntity(
					coord: WeatherCoord.fromJson(json['coord']),
					weather: json['weather'],
					base: json['base'],
					main: json['main'],
					visibility: json['visibility'],
					wind: json['wind'],
					clouds: json['clouds'],
					dt: json['dt'],
					sys: json['sys'],
					id: json['id'],
					name: json['name'],
					cod: json['cod']
			);
}

class WeatherCoord with JsonConvert<WeatherCoord> {
	final double lon;
	final double lat;

	WeatherCoord({required this.lon, required this.lat});

	factory WeatherCoord.fromJson(Map<String, dynamic> json) => WeatherCoord(
			lon: json['lon'],
			lat: json['lat']
	);
}

class WeatherWeather with JsonConvert<WeatherWeather> {
	late int id;
	late String main;
	late String description;
	late String icon;
}

class WeatherMain with JsonConvert<WeatherMain> {
	late double temp;
	late int pressure;
	late int humidity;
	@JSONField(name: "temp_min")
	late double tempMin;
	@JSONField(name: "temp_max")
	late double tempMax;
}

class WeatherWind with JsonConvert<WeatherWind> {
	late double speed;
	late int deg;
}

class WeatherClouds with JsonConvert<WeatherClouds> {
	late int all;
}

class WeatherSys with JsonConvert<WeatherSys> {
	late int type;
	late int id;
	late double message;
	late String country;
	late int sunrise;
	late int sunset;
}
