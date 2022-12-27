import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_getx/controllers/login_controller.dart';
import 'package:latihan_getx/pages/home.dart';
import 'package:get_storage/get_storage.dart';

class loginPage extends StatelessWidget {
  //ngelempar controller agar bisa digunakan
  final box = GetStorage();
  final LoginController loginC = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    //fungsi untuk remberme
    if (box.read("dataRememberme") != null) {
      loginC.remberme.value = true;
      loginC.emailC.text = box.read("dataRememberme")["email"];
      loginC.passC.text = box.read("dataRememberme")["pass"];
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            // contoh controller untuk email
            controller: loginC.emailC,
            autocorrect: false,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Obx(
            () => TextField(
              controller: loginC.passC,
              autocorrect: false,
              obscureText: loginC.isHidden.value,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  // --------------------------- method dari eye pada password -------------------
                  onPressed: () => loginC.isHidden.toggle(),
                  icon: const Icon(Icons.remove_red_eye),
                ),
                labelText: "pass",
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Obx(
            () => CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: loginC.remberme.value,
              onChanged: (value) {
                loginC.remberme.toggle();
              },
              title: Text("Remember me"),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () {
              loginC.login();
            },
            child: const Text("login"),
          )
        ],
      ),
    );
  }
}
