import 'dart:convert';

import 'package:ecommerce_mobile/Constants/Headers.dart';
import 'package:ecommerce_mobile/Constants/Strings.dart';
import 'package:ecommerce_mobile/Screen/HomeScreen/Model/ProductModel.dart';
import 'package:ecommerce_mobile/Screen/HomeScreen/Model/ShopModel.dart';
import 'package:ecommerce_mobile/Screen/HomeScreen/Model/categoryModel.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart';

class HomeController extends GetxController {
  int bottamOption = 0;
  List<CategoryModel> CategoryModelList = [];
  List<ProductModel> ProductList = [];
  List<ShopModel> ShopList = [];

  loadCategoryes() async {
    final response = await get(Uri.parse(baseurl + "category-add-list/"),
        headers: AuthHeader);
    // print(response.body);
    if (response.statusCode == 200) {
      for (var data in json.decode(response.body))
        CategoryModelList.add(CategoryModel.fromJson(data));
      update();
    }
  }

  loadProducts() async {
    final response = await get(Uri.parse(baseurl + "product-add-list/"),
        headers: AuthHeader);
    print(response.body);
    if (response.statusCode == 200) {
      for (var data in json.decode(response.body))
        ProductList.add(ProductModel.fromJson(data));
      update();
    }
  }

  loadShopes() async {
    final response =
        await get(Uri.parse(baseurl + "shops-add-list/"), headers: AuthHeader);
    print(response.body);
    if (response.statusCode == 200) {
      for (var data in json.decode(response.body))
        ShopList.add(ShopModel.fromJson(data));
      update();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadCategoryes();
    loadProducts();
    loadShopes();
    print("working");
  }
}
