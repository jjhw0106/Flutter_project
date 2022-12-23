import 'package:chef_hard/weather_app/data/my_location.dart';
import 'package:chef_hard/weather_app/data/network.dart';
import 'package:chef_hard/weather_app/screens/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
const String apiKey = "a2a07aef1c47da4c3dba9d12a303c8f6";

const spinkit = SpinKitRotatingCircle(
  color: Colors.white,
  size: 50.0,
);

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double? lat;
  double? lon;
  late String weatherUrl;
  late String aqiUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Get My Location'),
          onPressed: () async {
            await getMyWeatherInfo();
            // print(Text(getLocation().toString()));
          },
        )
      )
    );
  }

  Future<void> getMyWeatherInfo() async{
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();

    lat = myLocation.latitude;
    lon = myLocation.longitude;
    weatherUrl = "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric";
    aqiUrl = "http://api.openweathermap.org/data/2.5/air_pollution?lat=$lat&lon=$lon&appid=$apiKey";

    Network network = Network();

    var weatherData = await network.getJsonData(weatherUrl);
    var aqiData = await network.getJsonData(aqiUrl);


    print(weatherData);
    print(aqiData);

    Navigator.push(context, MaterialPageRoute(
        builder: ((context) {
      return WeatherScreen(parseWeatherData: weatherData, parseAqiData: aqiData,);
    })));
  }
}