import 'dart:convert';

import 'package:inmotion_practical/app/screens/dashboard/model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherRepository {
  Future<Weather> getWeather(String location) async {
    // fetch the weather data from the API
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=0f9b1ca130cf1b76f2d41cf75e1c025e"));
    if (response.statusCode == 200) {
      print('jsonDecode(response.body) :: ${jsonDecode(response.body)}');
      print('jsonDecode(response.body) :: ${response.body}');
      var res = weatherFromJson(response.body);
      return res;
      // parse the JSON data and return a Weather object
    } else {
      throw Exception("Failed to get weather");
    }
  }
}
