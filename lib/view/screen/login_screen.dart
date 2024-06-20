// ignore_for_file: unnecessary_import, avoid_print

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../controller/FloatingController.dart';
import '../../core/constant/AppRoutes.dart';
import '../../core/utils/text_utils.dart';
import '../../data/datasource/bg_data.dart';
import '../widget/floatingActionButtonLogin.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final FloatingController controller =
      Get.put(FloatingController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetBuilder<FloatingController>(
        builder: (controller) => Scaffold(
          floatingActionButton: FloatingActionButtonLogin(),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(bgList[controller.selectedIndex]),
                  fit: BoxFit.fill),
            ),
            alignment: Alignment.center,
            child: Container(
              height: 450,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(15),
                color: Colors.black.withOpacity(0.1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Center(
                              child: TextUtil(
                            text: "Login",
                            weight: true,
                            size: 30,
                          )),
                          const Spacer(),
                          TextUtil(
                            text: "اسم الدخول",
                          ),
                          Container(
                            height: 35,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.white))),
                            child: TextFormField(
                              controller: controller.usernameController,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                // label: Text("Email"),
                                hintText: "اسم الدخول",
                                prefixIcon: Icon(
                                  Icons.person_pin,
                                  color: Colors.white,
                                ),
                                suffixIcon: Icon(
                                  Icons.mail,
                                  color: Colors.white,
                                ),
                                fillColor: Colors.white,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const Spacer(),
                          TextUtil(
                            text: "كلمة المرور",
                          ),
                          Container(
                            height: 35,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.white))),
                            child: GetBuilder<FloatingController>(
                              builder: (controller) => TextFormField(
                                controller: controller.passwordController,
                                obscureText: controller.isPassword,
                                keyboardType: TextInputType.visiblePassword,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "كلمة المرور",
                                  suffixIcon: IconButton(
                                    icon: controller.isPassword == true
                                        ? const Icon(Icons.visibility_off,
                                            color: Colors.white)
                                        : const Icon(Icons.remove_red_eye,
                                            color: Colors.white),
                                    onPressed: () {
                                      controller.visibilityOff();
                                    },
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                  fillColor: Colors.white,
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              controller.checkedbox();
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  color: Colors.white,
                                  child: GetBuilder<FloatingController>(
                                    builder: (controller) => Checkbox(
                                        value: controller.chack,
                                        onChanged: (val) {
                                          controller.checkedbox();
                                        }),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: TextUtil(
                                  text: "تذكر كلمة المرور",
                                  size: 12,
                                  weight: true,
                                ))
                              ],
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              // sharedPref!.clear();
                              // controller.userValid();
                              Get.offAllNamed(AppRoutes.navBarView);
                            },
                            child: Container(
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              alignment: Alignment.center,
                              child: TextUtil(
                                text: "دخول",
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextUtil(
                                text: "إذا لم تكن تمتلك حساب إضغط هنا ",
                                size: 12,
                                weight: true,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.signup);
                                  },
                                  child: const Text(
                                    'إنشاء حساب',
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  )),
                            ],
                          )),
                          const Spacer(),
                        ],
                      ),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
