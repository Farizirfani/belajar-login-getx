import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:latihan_getx/pages/home.dart';

import 'pages/login.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: loginPage(),
      getPages: [
        GetPage(
          name: "/login",
          page: () => loginPage(),
        ),
        GetPage(
          name: "/home",
          page: () => home(),
        ),
      ],
    );
  }
}
