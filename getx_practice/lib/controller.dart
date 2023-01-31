import 'package:get/get.dart';
import 'package:getx_practice/model.dart';

class Controller extends GetxController{

  final person = Person().obs;

  void updateInfo(){
    Rx<Person> p = Person().obs;
    Person per = p();

    Rx<String> str = 'Bill'.obs;
    String s = str();

    // state의 현재 value값을 가져옴
    person.update((val) {
      val?.age++;
      val?.name="hw";
    });
  }
}