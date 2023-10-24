import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'bmi_controller.dart';

class BMIScreen extends StatelessWidget {
  final BMIController controller = Get.put(BMIController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Read only the weight and height values from the storage
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.teal,
              child: Text(
                'BMI: ${GetStorage().read('bmi').toStringAsFixed(2) ?? 0}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 50),
            Obx(() => Text('Weight: ${controller.weight.value} kg')),
            Obx(
              () => Slider(
                value: controller.weight.value,
                onChanged: (value) => controller.weight.value = value,
                min: 0,
                max: 150,
              ),
            ),
            Obx(() => Text('Height: ${controller.height.value} m')),
            Obx(
              () => Slider(
                value: controller.height.value,
                onChanged: (value) => controller.height.value = value,
                min: 0,
                max: 2.5,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: Size(200, 50),
              ),
              onPressed: () {
                controller.calculateBMI();
                GetStorage().write('bmi', controller.bmi.value);
                // Get.to(() => BMIDetailsScreen());
              },
              child: Text(
                'Calculate BMI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
      bottomSheet: Container(
        margin: EdgeInsets.only(top: 20),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.teal,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, -1),
              blurRadius: 6,
            ),
          ],
        ),
        child: Obx(
          () => controller.bmi.value != 0
              ? Center(
                  child: Text(
                    'BMI: ${controller.bmi.value.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : SizedBox(),
        ),
      ),
    );
  }
}
