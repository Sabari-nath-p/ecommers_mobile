import 'package:ecommerce_mobile/Screen/HomeScreen/Model/ProductModel.dart';
import 'package:ecommerce_mobile/Screen/ProductDetails/Service/Controller.dart';
import 'package:ecommerce_mobile/Screen/ProductDetails/Views/ProductDetailsView.dart';
import 'package:ecommerce_mobile/Screen/ProductDetails/Views/productLoadingShimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

import '../Profile/ProfileScreenMain.dart';

class ProductScreenMain extends StatelessWidget {
  int ProductID;
  ProductScreenMain({super.key, required this.ProductID});
  ProductController prdCtrl = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    prdCtrl.addProduct(ProductID);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              prdCtrl.removeProduct();
              if (prdCtrl.productID.length == 0) Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.arrow_back_ios_new_sharp,
                size: 20,
              ),
            ),
          ),
          leadingWidth: 20,
          title: Text(
            "Zeagion",
            style:
                GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          actions: [
            Icon(
              FontAwesome.cart_shopping,
              size: 21,
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: GetBuilder<ProductController>(
            builder: (_) => (prdCtrl.productID.length != 0 && !prdCtrl.loading)
                ? ProductDetailView()
                : ShimmerProductDetail()));
  }
}
