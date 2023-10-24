import 'package:bmi/bmi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BMIDetailsScreen extends StatelessWidget {
  final BMIController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('BMI: ${controller.bmi.value.toStringAsFixed(2)}')),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
