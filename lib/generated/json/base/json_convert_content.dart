// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:weather/api/weather_entity.dart';
import 'package:weather/generated/json/weather_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
		switch (type) {
			case WeatherEntity:
				return weatherEntityFromJson(data as WeatherEntity, json) as T;
			case WeatherCoord:
				return weatherCoordFromJson(data as WeatherCoord, json) as T;
			case WeatherWeather:
				return weatherWeatherFromJson(data as WeatherWeather, json) as T;
			case WeatherMain:
				return weatherMainFromJson(data as WeatherMain, json) as T;
			case WeatherWind:
				return weatherWindFromJson(data as WeatherWind, json) as T;
			case WeatherClouds:
				return weatherCloudsFromJson(data as WeatherClouds, json) as T;
			case WeatherSys:
				return weatherSysFromJson(data as WeatherSys, json) as T;    }
		return data as T;
	}

  static _getToJson<T>(Type type, data) {
		switch (type) {
			case WeatherEntity:
				return weatherEntityToJson(data as WeatherEntity);
			case WeatherCoord:
				return weatherCoordToJson(data as WeatherCoord);
			case WeatherWeather:
				return weatherWeatherToJson(data as WeatherWeather);
			case WeatherMain:
				return weatherMainToJson(data as WeatherMain);
			case WeatherWind:
				return weatherWindToJson(data as WeatherWind);
			case WeatherClouds:
				return weatherCloudsToJson(data as WeatherClouds);
			case WeatherSys:
				return weatherSysToJson(data as WeatherSys);
			}
			return data as T;
		}
  //Go back to a single instance by type
	static _fromJsonSingle<M>( json) {
		String type = M.toString();
		if(type == (WeatherEntity).toString()){
			return WeatherEntity().fromJson(json);
		}
		if(type == (WeatherCoord).toString()){
			return WeatherCoord().fromJson(json);
		}
		if(type == (WeatherWeather).toString()){
			return WeatherWeather().fromJson(json);
		}
		if(type == (WeatherMain).toString()){
			return WeatherMain().fromJson(json);
		}
		if(type == (WeatherWind).toString()){
			return WeatherWind().fromJson(json);
		}
		if(type == (WeatherClouds).toString()){
			return WeatherClouds().fromJson(json);
		}
		if(type == (WeatherSys).toString()){
			return WeatherSys().fromJson(json);
		}

		return null;
	}

  //list is returned by type
	static M _getListChildType<M>(List data) {
		if(<WeatherEntity>[] is M){
			return data.map<WeatherEntity>((e) => WeatherEntity().fromJson(e)).toList() as M;
		}
		if(<WeatherCoord>[] is M){
			return data.map<WeatherCoord>((e) => WeatherCoord().fromJson(e)).toList() as M;
		}
		if(<WeatherWeather>[] is M){
			return data.map<WeatherWeather>((e) => WeatherWeather().fromJson(e)).toList() as M;
		}
		if(<WeatherMain>[] is M){
			return data.map<WeatherMain>((e) => WeatherMain().fromJson(e)).toList() as M;
		}
		if(<WeatherWind>[] is M){
			return data.map<WeatherWind>((e) => WeatherWind().fromJson(e)).toList() as M;
		}
		if(<WeatherClouds>[] is M){
			return data.map<WeatherClouds>((e) => WeatherClouds().fromJson(e)).toList() as M;
		}
		if(<WeatherSys>[] is M){
			return data.map<WeatherSys>((e) => WeatherSys().fromJson(e)).toList() as M;
		}

		throw Exception("not found");
	}

  static M fromJsonAsT<M>(json) {
		if (json is List) {
			return _getListChildType<M>(json);
		} else {
			return _fromJsonSingle<M>(json) as M;
		}
	}
}