import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_ex/controller/getx_cont.dart';
import 'package:getx_ex/secondpage_screen.dart';

void main() async {
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //get kullanırken sayfanın değişmesi için lazım.
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  RxInt _counter = 0.obs;
  //başındaki rx dinlenebilecek değişken için yazılır
  RxBool deger = false.obs;

//SecondPage
  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx((() => Text(
                  //Controller la yapılan örnek
                  '${controller.sayac}', //.value rtxint'i int dönüştürüyor
                  style: Theme.of(context).textTheme.headline4,
                ))),
            ElevatedButton(
                //Sayfa değiştirme butonu
                onPressed: () {
                  Get.to(SecondPage(), transition: Transition.upToDown);
                },
                child: Text("Sayfa 2 ")),
            ElevatedButton(
                //Snackbar getiren buton
                onPressed: () {
                  Get.snackbar("title", "message");
                },
                child: Text("Snack bar ")),
            ElevatedButton(
                //Get Dialog
                onPressed: () {
                  Get.defaultDialog(title: "asda");
                },
                child: Text("Dialog ")),
            ElevatedButton(
                //Tema değiştirme
                onPressed: () {
                  controller.temadegistir();
                },
                child: Text("Tema değiştir ")),
            /*  Obx((() => Text(
                  '${_counter.value == 20 ? 2 : _counter}', //.value rtxint i int dönüştürüyor
                  style: Theme.of(context).textTheme.headline4,
                ))), */
            /* Obx((() => Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ))), */
          ],
        ),
      ),
      /* floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(_counter);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), */
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.sayacArttir(); //controller ile artırma
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
