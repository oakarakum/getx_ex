// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Controller extends GetxController {
  RxInt sayac = 0.obs;
  RxInt deger = 0.obs;
  RxBool isDarkMode = false.obs;
  GetStorage getStorage = GetStorage();

  temakaydet(bool deger) {
    getStorage.write("isDark", deger);
  }

  temadegistir() {
    isDarkMode.value = !isDarkMode.value;
    isDarkMode.value
        ? Get.changeTheme(ThemeData.dark())
        : Get.changeTheme(ThemeData.light());
    temakaydet(isDarkMode.value);
  }

  /* temadegistir() {//Storage'siz hali
    isDarkMode.value = !isDarkMode.value;
    isDarkMode == true
        ? Get.changeTheme(ThemeData.dark())
        : Get.changeTheme(ThemeData.light());
  }
 */
  sayacArttir() {
    sayac.value = sayac.toInt() + 1;
  }

  sayacAzalt() {
    sayac.value = sayac.toInt() - 1;
  }

  sayac5Arttir() {
    deger.value = deger.toInt() + 5;
    Get.snackbar("sayac", deger.toString());
  }

  sayac5Azalt() {
    sayac.value = sayac.toInt() - 5;
  }

  @override // initstate im aynısı
  void onInit() {
    print("ilk açiliş");
    bool deger = getStorage.read("isDark") ?? false;
    deger
        ? Get.changeTheme(ThemeData.dark())
        : Get.changeTheme(ThemeData.light()); //null ise ?? sou işareti kullanma
    super.onInit();
  }

  @override //Sayfa kapandığında işlemin durmasını istediklerini buraya yazarsın
  //Memory Leak: Aşırı memory kullanımı. Önemli problem.400 mb üzeri risk uygulama için. vs code
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
