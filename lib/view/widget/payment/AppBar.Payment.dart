import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controller/FloatingController.dart';
import '../../../core/constant/AppColor.dart';

class AppBarPayment extends StatelessWidget {
  AppBarPayment({super.key});

  final FloatingController controller =
      Get.put(FloatingController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "الرصيد المتاح",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        GetBuilder<FloatingController>(
          builder: (controller) => Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: controller.removeEye == false
                      ? const Icon(Icons.visibility_off, color: Colors.white)
                      : const Icon(Icons.remove_red_eye, color: Colors.white),
                  onPressed: () {
                    controller.eyeOn();
                  },
                ),
                const SizedBox(width: Checkbox.width),
                Container(
                  child: controller.removeEye == false
                      ? const Text("*******",
                          style: TextStyle(color: AppColor.white, fontSize: 26))
                      : const Text(
                          "\$ 1000.00",
                          style: TextStyle(color: AppColor.white, fontSize: 16),
                        ),
                ),
                const SizedBox(width: Checkbox.width),
                const Icon(
                  Icons.account_balance_wallet_outlined,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
