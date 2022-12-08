import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ex/controller/getx_cont.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key});

  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 20, top: 40),
        child: Column(
          children: [
            Obx(() => Text("${controller.sayac}")),
            ElevatedButton(
                onPressed: () {
                  controller.sayacAzalt();
                  Obx(
                    () => Text("${controller.sayac}"),
                  );
                },
                child: Text("Azalt"))
          ],
        ),
      ),
    );
  }
}
