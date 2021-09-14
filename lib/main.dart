import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tea_news/src/controller/binding/controller_binding.dart';
import 'package:tea_news/src/view/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
          binding: ControllerBindings(),
        ),
      ],
      theme: ThemeData.dark(),
    );
  }
}
