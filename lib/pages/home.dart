import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_getx/pages/login.dart';

import '../controllers/login_controller.dart';

class home extends StatelessWidget {
  final LoginController loginC = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      floatingActionButton: IconButton(
        onPressed: () => loginC.logout(),
        icon: Icon(Icons.logout),
      ),
    );
  }
}
