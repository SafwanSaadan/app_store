import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/FloatingController.dart';
import '../../core/constant/AppRoutes.dart';
import '../../core/constant/constants.dart';
import '../../core/utils/text_utils.dart';
import '../../data/datasource/bg_data.dart';
import '../widget/floatingActionButtonLogin.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

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
            alignment: Alignment.topCenter,
            child: Container(
              height: 550,
              alignment: Alignment.topCenter,
              width: double.infinity,
              margin: const EdgeInsets.only(left: 30, right: 30, top: 30),
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
                    padding: const EdgeInsets.all(Constants.padding),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Center(
                              child: TextUtil(
                            text: "Sign Up",
                            weight: true,
                            size: 30,
                          )),
                          const Spacer(),
                          Container(
                            height: 35,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.white))),
                            child: TextFormField(
                              controller: controller.fullNameController,
                              keyboardType: TextInputType.name,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                label: Text(
                                  "الاسم الرباعي مع اللقب",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                // hintText: "الاسم الرباعي مع اللقب",
                                prefixIcon: const Icon(
                                  Icons.person_pin,
                                  color: Colors.white,
                                ),

                                fillColor: Colors.white,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 35,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.white))),
                            child: TextFormField(
                              controller: controller.activityController,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                label: Text(
                                  "النشاط التجاري",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                // hintText: "النشاط التجاري",
                                prefixIcon: const Icon(
                                  Icons.business,
                                  color: Colors.white,
                                ),

                                fillColor: Colors.white,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 35,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.white))),
                            child: TextFormField(
                              controller: controller.phoneController,
                              keyboardType: TextInputType.phone,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                label: Text(
                                  "رقم الهاتف",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                // hintText: "رقم الهاتف",
                                prefixIcon: const Icon(
                                  Icons.phone_android,
                                  color: Colors.white,
                                ),

                                fillColor: Colors.white,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 35,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.white))),
                            child: TextFormField(
                              controller: controller.addressController,
                              keyboardType: TextInputType.streetAddress,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                label: Text(
                                  "العنوان",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                // hintText: "العنوان",
                                prefixIcon: const Icon(
                                  Icons.location_pin,
                                  color: Colors.white,
                                ),

                                fillColor: Colors.white,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const Spacer(),
                          // const SizedBox(height: Constants.sizeSpaceHeight),
                          const Spacer(),
                          Container(
                            height: 35,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.white))),
                            child: TextFormField(
                              controller: controller.usernameController,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                label: TextUtil(
                                    text: " اسم الدخول او البريد الالكتروني"),
                                // hintText: "اسم الدخول",
                                prefixIcon: const Icon(
                                  Icons.person_pin,
                                  color: Colors.white,
                                ),
                                suffixIcon: const Icon(
                                  Icons.mail,
                                  color: Colors.white,
                                ),
                                fillColor: Colors.white,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const Spacer(),
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
                                  label: TextUtil(text: "كلمة المرور"),
                                  // hintText: "كلمة المرور",
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
                          Container(
                            height: 35,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.white))),
                            child: GetBuilder<FloatingController>(
                              builder: (controller) => TextFormField(
                                controller:
                                    controller.confirmPasswordController,
                                obscureText: controller.isPassword,
                                keyboardType: TextInputType.visiblePassword,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  label: TextUtil(text: "تأكيد كلمة المرور"),
                                  // hintText:  "تأكيد كلمة المرور",
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
                              // sharedPref!.setString('username',
                              //     controller.usernameController.text);
                              // sharedPref!.setString('password',
                              //     controller.passwordController.text);

                              Get.offAllNamed(AppRoutes.login);
                            },
                            child: Container(
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              alignment: Alignment.center,
                              child: TextUtil(
                                text: "تسجيل",
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
