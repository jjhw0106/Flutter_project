import 'package:get/get.dart';
import 'package:getx_practice/model.dart';

class Controller extends GetxController{

  final person = Person().obs;

  void updateInfo(){
    // state의 현재 value값을 가져옴
    person.update((val) {
      val?.age++;
      val?.name="hw";
    });
  }
}