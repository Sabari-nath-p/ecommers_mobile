import 'dart:convert';

import 'package:ecommerce_mobile/Screen/HomeScreen/Model/ProductModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../../Constants/Headers.dart';
import '../../../Constants/Strings.dart';
import '../../HomeScreen/Model/CartModel.dart';

class ProductController extends GetxController {
  List productID = [];
  List<ProductModel> product = [];
  List<ProductModel> productsList = [];
  bool loading = true;
  CartModel? cart;
  bool CartLoading = false;

  addProduct(int id) async {
    productID.add(id);
    loading = true;
    update();
    await Future.delayed(Duration(seconds: 1));
    loadProductData(id);
  }

  removeProduct() async {
    productID.removeLast();
    loading = true;
    update();
    await Future.delayed(Duration(seconds: 1));
    product.removeLast();
    print(productID.length);
    if (productID.isNotEmpty)
      loadProductData(productID.last);
    else
      Get.back();
  }

  loadProductData(int id) async {
    final response = await get(Uri.parse(baseurl + "/product-list/$id"),
        headers: AuthHeader);
    print(response.body);

    if (response.statusCode == 200) {
      product.add(ProductModel.fromJson(json.decode(response.body)));
      if (product.isNotEmpty) loadotherProducts(product[0]!.shop!);
      loading = false;
      update();
    }
  }

  loadotherProducts(String shop) async {
    final response = await get(
        Uri.parse(baseurl + "product-list?limit=30&shop=$shop"),
        headers: AuthHeader);
    print(response.body);
    if (response.statusCode == 200) {
      for (var data in json.decode(response.body))
        productsList.add(ProductModel.fromJson(data));
      update();
    }
  }

  addToCart(int productID) async {
    CartLoading = true;
    update();
    final Response = await post(Uri.parse(baseurl + "add-to-cart/"),
        body: {"product_id": productID.toString()}, headers: AuthHeader);

    print(Response.body);
    print(Response.statusCode);

    if (Response.statusCode == 200) {
      var js = json.decode(Response.body);
      if (js["message"] != "Product added to the cart successfully")
        Fluttertoast.showToast(msg: js['message']);
      GetProfile();
    }
  }

  removefromCart(int productID) async {
    CartLoading = true;

    update();
    final Response = await post(Uri.parse(baseurl + "remove-from-cart/"),
        body: {"product_id": productID.toString()}, headers: AuthHeader);

    print(Response.body);
    print(Response.statusCode);

    if (Response.statusCode == 200) {
      var js = json.decode(Response.body);
      if (js["message"] != "Product removed from the cart successfully")
        Fluttertoast.showToast(msg: js['message']);
      GetProfile();
    }
  }

  GetProfile() async {
    final Response =
        await get(Uri.parse(baseurl + "profile-view/"), headers: AuthHeader);
    print(Response.body);
    if (Response.statusCode == 200) {
      var js = json.decode(Response.body);
      cart = CartModel.fromJson(js[0]["cart"]);
      CartLoading = false;

      update();
    }
  }

  int getProductQuantity(int productID) {
    int qty = 0;
    if (cart != null)
      for (var data in cart!.cart!) {
        if (data.product!.split("--")[0] == productID.toString()) {
          qty = data.quantity!;
          break;
        }
      }
    return qty;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    GetProfile();
  }
}
