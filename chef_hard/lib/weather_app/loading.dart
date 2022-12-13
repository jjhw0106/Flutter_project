import 'package:chef_hard/data/my_location.dart';
import 'package:chef_hard/data/network.dart';
import 'package:flutter/material.dart';
const String apiKey = "a2a07aef1c47da4c3dba9d12a303c8f6";

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double? lat;
  double? lon;
  late String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Get My Location'),
          onPressed: (){
            getMyWeatherInfo();
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
    url = "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey";

    Network network = Network(url);
    var weatherData = await network.getJsonData();
    print(weatherData);
  }
}