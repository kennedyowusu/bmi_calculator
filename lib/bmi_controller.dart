import 'package:get/get.dart';

class BMIController extends GetxController {
  RxDouble weight = 0.0.obs;
  RxDouble height = 0.0.obs;
  RxDouble bmi = 0.0.obs;

  void calculateBMI() {
    if (height.value != 0) {
      double newBmi = weight.value / (height.value * height.value);
      bmi.value = newBmi;
    }
  }
}
