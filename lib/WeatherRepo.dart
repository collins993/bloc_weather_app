import 'package:bloc_weather_app/WeatherModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; //to convert json into model

class WeatherRepo{
  
  Future<WeatherModel> getWeather(String city) async {

    //make api call
    final result = await http.Client().get("https://api.openweathermap.org/data/2.5/weather?q=$city&appid=11495188c8f5eb7a2c23d79cef28adbc");

    //check status code of api...200 means ok else throw exception
    if(result.statusCode != 200) {
      throw Exception();
    }
    else{

      return parsedJson(result.body);
    }
  }

  WeatherModel parsedJson(final response){

    final jsonDecoded = json.decode(response);

    final jsonWeather = jsonDecoded["main"];

    return WeatherModel.fromJson(jsonWeather);
  }
}