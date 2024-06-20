// ignore_for_file: must_be_immutable, avoid_print

import 'package:app_store/core/constant/AppColor.dart';
import 'package:app_store/core/constant/constants.dart';
import 'package:app_store/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../controller/FloatingController.dart';
import '../../core/services/update_product.dart';
import '../../data/datasource/bg_data.dart';
import '../widget/custom_button.dart';
import '../widget/custom_textFormField.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  final FloatingController controller =
      Get.put(FloatingController(), permanent: true);

  String? productName;

  String? desc;

  String? price;

  String? image;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // ProductModel product =
    //     ModalRoute.of(context)!.settings.arguments as ProductModel;
    ProductModel product = Get.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(FontAwesomeIcons.cartPlus))
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Update Products',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        body: Container(
          height: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bgList[controller.selectedIndex]),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                CustomFormField(
                  label: "Porduct Name",
                  type: TextInputType.name,
                  fieldRadius: 15,
                  onChange: (data) {
                    productName = data;
                  },
                ),
                const SizedBox(height: 10),
                CustomFormField(
                  label: "description",
                  type: TextInputType.text,
                  fieldRadius: 15,
                  onChange: (data) {
                    desc = data;
                  },
                ),
                const SizedBox(height: 10),
                CustomFormField(
                  label: "price",
                  type: TextInputType.number,
                  fieldRadius: 15,
                  onChange: (data) {
                    // price = double.parse(data);
                    price = data;
                  },
                ),
                const SizedBox(height: 10),
                CustomFormField(
                  label: "image",
                  type: TextInputType.url,
                  fieldRadius: 15,
                  onChange: (data) {
                    image = data;
                  },
                ),
                const SizedBox(height: 70),
                CustomButton(
                  text: "update",
                  isUpperCase: true,
                  buttonColor: AppColor.blue,
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);
                      print('updated sacsess ==============================');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!.toString(),
        dscription: desc == null ? product.dscription : desc!,
        image: image == null ? product.image : image!,
        category: product.category,
        productId: product.id,
        token: Constants.TOKEN);
  }
}
