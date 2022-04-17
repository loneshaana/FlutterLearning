// ignore_for_file: avoid_print

import 'package:basics/data/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
  // https://openweathermap.org/data/2.5/find?q=London&type=like&sort=population&cnt=1&appid=439d4b804bc8187953eb36d2a8c26a02
  final String authority = 'openweathermap.org';
  final String path = 'data/2.5/find';
  final String apiKey = '439d4b804bc8187953eb36d2a8c26a02';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {
      'q': location,
      'appid': apiKey,
      'type': 'like'
    };
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data['list'][0]);
    return weather;
  }
}
