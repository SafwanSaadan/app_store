// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/FloatingController.dart';
import '../../../core/constant/AppColor.dart';
import '../../../data/datasource/bg_data.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColor.white),
                  borderRadius: BorderRadius.circular(12)),
              child: IconButton(
                icon: const Icon(Icons.menu, color: AppColor.white),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
            const SizedBox(width: 10),
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColor.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: IconButton(
                    icon: const Icon(Icons.notifications,
                        color: AppColor.white),
                    onPressed: () {},
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(0.5),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColor.white, width: 1),
                      borderRadius: BorderRadius.circular(100),
                      color: AppColor.red1),
                  child: const Text("34",
                      style: TextStyle(color: AppColor.white, fontSize: 13)),
                )
              ],
            ),
          ]),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: GetBuilder<FloatingController>(
              builder: (controller) => CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        AssetImage(bgList[controller.selectedIndex]),
                  )),
        ),
      ],
    );
  }
}
