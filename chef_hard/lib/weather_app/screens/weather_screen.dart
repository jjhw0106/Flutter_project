import 'package:chef_hard/weather_app/model/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class WeatherScreen extends StatefulWidget {

  WeatherScreen({this.parseWeatherData});


  final dynamic parseWeatherData;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Model model = Model();

  var cityName;
  var date = DateTime.now();
  var description;
  var iconId;
  var weatherData;
  var temp;

  Widget? icon;

  @override
  void initState() {
    // TODO: implement initState
    weatherData = widget.parseWeatherData;
    super.initState();
    updateData(weatherData);
  }

  void updateData(dynamic weatherData){
    temp = weatherData['main']['temp'].round().toString();
    cityName = weatherData['name'];
    iconId = weatherData['weather'][0]['id'];
    description = weatherData['weather'][0]['description'];
    print("iconId $iconId");
  }

  String getSystemTime(){
    var formattedDate = DateFormat('h:mm a - EEEE ,d MMM, yyy').format(date);
    return formattedDate;
  }

  Text googleTextStyle(String contents, double? fontSize, Color? color){
    return Text(contents, style: GoogleFonts.lato(fontSize: fontSize, color: color));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.near_me),
        actions: [
          IconButton(
            icon: Icon(
              Icons.location_searching,
            ),
            onPressed: (){},
            iconSize: 30.0,
          )
        ],
      ),
      body: Container(
        child:Stack(
          children: [
            Image.asset('image/background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 130,
                  ),
                  googleTextStyle(cityName, 35, Colors.white),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      TimerBuilder.periodic(
                        (Duration(minutes: 1)),
                        builder: (context){
                          var today = getSystemTime();
                          return googleTextStyle("$today", 16, Colors.white);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 70),
                  Row(
                    children: [
                      googleTextStyle('$temp\u2103', 50, Colors.white),

                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      model.getWeatherIcon(iconId!),
                      // Icon(Icons.sunny,size: 50,),
                      SizedBox(width: 20),
                      googleTextStyle("$description", 20, Colors.white),
                    ],
                  ),
                  SizedBox(height: 40),
                  Divider(
                    height: 20,
                    thickness: 2,
                    color: Colors.white,
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget> [
                      Column(children:[
                        googleTextStyle("AQI(대기질 지수)", 15, Colors.white),
                        Image.asset('image/bad.png',width: 37, height: 35,),
                        googleTextStyle("매우나쁨", 15, Colors.white),
                      ],),
                      Column(children: [
                        googleTextStyle("미세먼지", 15, Colors.white),
                        googleTextStyle("147.75", 20, Colors.white),
                        googleTextStyle("ug/m3", 15, Colors.white),
                      ],),
                      Column(children: [
                        googleTextStyle("초미세먼지", 15, Colors.white),
                        googleTextStyle("84.03", 20, Colors.white),
                        googleTextStyle("ug/m3", 15, Colors.white),
                      ],),
                    ],
                  ),
                ],
              )
            ),
          ],
        )
      ),
    );
  }
}
