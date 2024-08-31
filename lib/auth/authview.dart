import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medconnectapp/auth/authrequest.dart';

class AuthController extends GetxController {
  var usercntl = TextEditingController();
  var passcntl = TextEditingController();

  var isUserValid = true.obs;
  var isPassValid = true.obs;

  void validateUser() {
    isUserValid.value = usercntl.text.isNotEmpty;
  }

  void validatePass() {
    isPassValid.value = passcntl.text.isNotEmpty;
  }

  bool validateForm() {
    validateUser();
    validatePass();
    return isUserValid.value && isPassValid.value;
  }

  @override
  void onClose() {
    usercntl.dispose();
    passcntl.dispose();
    super.onClose();
  }
}

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final _screenheight = MediaQuery.of(context).size.height;
    final _screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _screenheight,
          width: _screenwidth,
          child: Padding(
            padding: EdgeInsets.only(
              top: _screenheight * 0.13814,
              left: _screenwidth * 0.04843318,
              right: _screenwidth * 0.04843318,
            ),
            child: Column(
              children: [
                const Text(
                  'Sign in to Account',
                  style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: _screenheight * 0.07031547,
                  child: Obx(() => TextField(
                        controller: _authController.usercntl,
                        decoration: InputDecoration(
                          filled: true,
                          prefixIcon: Icon(Icons.person_2),
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(width: 0.1)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(width: 0.5)),
                          hintText: "Username",
                          errorText: _authController.isUserValid.value
                              ? null
                              : "Username cannot be empty",
                        ),
                        onChanged: (value) => _authController.validateUser(),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: _screenheight * 0.07031547,
                  child: Obx(() => TextField(
                        controller: _authController.passcntl,
                        decoration: InputDecoration(
                          filled: true,
                          prefixIcon: Icon(Icons.key),
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(width: 0.1)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(width: 0.5)),
                          hintText: "Password",
                          errorText: _authController.isPassValid.value
                              ? null
                              : "Password cannot be empty",
                        ),
                        obscureText: true,
                        onChanged: (value) => _authController.validatePass(),
                      )),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                    height: 50,
                    width: _screenwidth * 0.7,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_authController.validateForm()) {
                          getToken(
                              _authController.usercntl.text,
                              _authController.passcntl.text);
                        }
                      },
                      child: Text('Sign in'),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
