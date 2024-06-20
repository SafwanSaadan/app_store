import 'package:flutter/material.dart';

import '../helper/api.dart';
import '../../data/model/product_model.dart';

class AddProduct {
  Future<ProductModel> addProduct(
      {required String title,
      required String price,
      required String dscription,
      required String image,
      required String category,
      @required String? token}) async {
    Map<String, dynamic> data = await Api().post(
        url: 'https://fakestoreapi.com/products',
        body: {
          'title': title,
          'price': price,
          'dscription': dscription,
          'image': image,
          'category': category,
        },
        token: token);

    return ProductModel.fromJson(data);
  }
}
