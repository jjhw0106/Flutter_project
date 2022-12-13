import 'package:geolocator/geolocator.dart';

class MyLocation{
  double? longitude;
  double? latitude;

  Future<void> getMyCurrentLocation() async{
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high
      );
      latitude = position.latitude;
      longitude = position.longitude;
    } catch(e) {
      print("There was an error");
    }
  }
}