import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';


class WeatherModel {

  Future<dynamic> getLocationWeather() async
  {
    print('getLocation called');
    Location location = Location();
    await location.getCurrentLocation();

    print(location.longitude);
    print(location.latitude);

    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=e7a395d48c00141982919f93d1c284ed&units=metric');

    print('getData called');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName ) async
  {
    // var CityName = ci
    String cityURL = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=e7a395d48c00141982919f93d1c284ed&units=metric';

    NetworkHelper networkHelper = NetworkHelper(cityURL);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
