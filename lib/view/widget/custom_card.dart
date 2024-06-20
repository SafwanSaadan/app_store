// ignore_for_file: must_be_immutable

import 'package:app_store/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/AppColor.dart';
import '../../core/constant/AppRoutes.dart';
import '../../core/constant/constants.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.product, super.key});

  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, AppRoutes.updateProductPage,
        //     arguments: product);
        Get.toNamed(AppRoutes.updateProductPage, arguments: product);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1,
                    color: AppColor.grey.withOpacity(0.2),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Card(
                elevation: 0,
                color: AppColor.white,
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 5, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        product.title.substring(0, 12),
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColor.grey,
                        ),
                        maxLines: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$ ${product.price}',
                            style: const TextStyle(
                              fontSize: 15,
                              color: AppColor.green,
                            ),
                          ),
                          const Icon(
                            Icons.favorite,
                            color: AppColor.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 15,
              right: 15,
              top: -30,
              child: Container(
                height: 100,
                margin:
                    const EdgeInsets.symmetric(horizontal: Constants.margin),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: AppColor.white,
                  image: DecorationImage(
                      image: NetworkImage(product.image),
                      fit: BoxFit.scaleDown),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
