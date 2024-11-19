import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_ruga/home_page.dart';
import 'package:pas_ruga/login/logView.dart';

import 'package:pas_ruga/register/Register.dart' as register;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: '/', page: () => register.RegisterView()),
        GetPage(name: '/login', page: () => LogView()),
        GetPage(name: '/homepage', page: () => HomePage()),
      ],
      initialRoute: '/',
      home: register.RegisterView(),
    );
  }
}
