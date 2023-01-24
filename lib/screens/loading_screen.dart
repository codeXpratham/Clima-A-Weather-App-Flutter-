//
// import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:clima/services/location.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';
class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationNdata();

  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }
  void getLocationNdata()  async
  {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));

  }




  // void exceptionExample(int n)
  // {
  //   if(n>10)
  //     throw 'number greater than 10';
  // }

  @override
  Widget build(BuildContext context) {
    // getData();
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.teal,
          size: 120,
        ),
      ),
    );
  }
}
