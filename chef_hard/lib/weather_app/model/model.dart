import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Model{
  Widget getWeatherIcon(int condition){ // weather-conditions의 id값
    if(condition<300){
      return SvgPicture.asset('svg/climacon-cloud_lightning.svg',color: Colors.black87);
    }
    else if(condition<500){
      return SvgPicture.asset('svg/climacon-cloud_rain.svg',color: Colors.black87);
    }
    else if(condition<600){
      return SvgPicture.asset('svg/climacon-cloud_rain.svg',color: Colors.black87);
    }
    else if(condition<700){
      return SvgPicture.asset('svg/climacon-cloud_snow.svg',color: Colors.black87);
    }
    else if(condition<800){
      return SvgPicture.asset('svg/climacon-cloud_lightning.svg',color: Colors.black87);
    }
    else {
      return SvgPicture.asset('svg/climacon-cloud_lightning.svg',color: Colors.black87);
    }
  }


  List getAQIFace(int condition){
    if(condition==1){return ["매우 좋음",'image/good.png',];}
    else if(condition == 2){return ["좋음",'image/fair.png',];}
    else if(condition == 3){return ["보통",'image/moderate',];}
    else if(condition == 4){return ["나쁨",'image/poor',];}
    else{return ["매우 나쁨",'image/bad',];}
  }
}