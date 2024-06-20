// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onBoardingController.dart';
import '../../core/constant/AppColor.dart';
import '../../core/constant/constants.dart';
import '../../data/datasource/static/static.dart';

class CustomDotOnBoarding extends StatelessWidget {
  const CustomDotOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            onBoardingList.length,
            (index) => AnimatedContainer(
              margin: const EdgeInsets.all(Constants.margin),
              duration: const Duration(microseconds: 900),
              width: controller.currentPage == index ? 20 : 5,
              height: 6,
              decoration: const BoxDecoration(
                color: AppColor.orange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
