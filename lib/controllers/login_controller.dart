import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:latihan_getx/pages/home.dart';

// class untuk menampung segala method di controller
class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  // variable bertipe data Rx Boolean untuk menjalankan fungsi methodnya

  RxBool isHidden = true.obs;
  RxBool remberme = false.obs;

  // method yang digunakan untuk authentication, Email dan password harus sama dengan yang ditulis di method
  // (belum nemu cara untuk mengambil valuenya dari database) karena ini masih local storage

  void login() async {
    final box = GetStorage();
    if (emailC.text == "admin" && passC.text == "admin") {
      if (box.read("dataRememberme") != null) {
        box.remove("dataRemberme");
      }
      if (remberme.isTrue) {
        //fungsi remberme
        box.write("dataRememberme", {
          "email": emailC.text,
          "pass": passC.text,
        });
      }
      Get.offAllNamed("/home");
    } else {
      SnackBar(
        content: Title(
          color: Colors.white,
          child: Text("Password atau email anda salah"),
        ),
      );
    }
  }

  void logout() async {
    Get.offAllNamed("/login");
  }
}
