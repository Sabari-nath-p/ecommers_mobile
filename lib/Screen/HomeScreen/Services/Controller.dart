import 'dart:convert';

import 'package:ecommerce_mobile/Constants/Headers.dart';
import 'package:ecommerce_mobile/Constants/Strings.dart';
import 'package:ecommerce_mobile/Screen/HomeScreen/Model/CartModel.dart';
import 'package:ecommerce_mobile/Screen/HomeScreen/Model/PopularProductModel.dart';
import 'package:ecommerce_mobile/Screen/HomeScreen/Model/ProductModel.dart';
import 'package:ecommerce_mobile/Screen/HomeScreen/Model/ShopModel.dart';
import 'package:ecommerce_mobile/Screen/HomeScreen/Model/categoryModel.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart';

class HomeController extends GetxController {
  int bottamOption = 0;
  List<CategoryModel> CategoryModelList = [];
  List<ProductModel> ProductList = [];
  List<ShopModel> ShopList = [];
  List<PopularProductModel> popularProductList = [];
  String SearchString = "";
  int searchMethod = 0;
  String selectedCategory = "";
  String selectedShop = "";
  CartModel? cart;

  loadCategoryes() async {
    CategoryModelList.clear();
    final response = await get(Uri.parse(baseurl + "category-add-list/"),
        headers: AuthHeader);
    print(response.body);
    if (response.statusCode == 200) {
      for (var data in json.decode(response.body))
        CategoryModelList.add(CategoryModel.fromJson(data));
      update();
    }
  }

  loadProducts() async {
    ProductList.clear();
    String slug = (searchMethod == 0)
        ? "product-list?product_name=$SearchString&limit=30"
        : (searchMethod == 1)
            ? "product-list?product_name=$SearchString&limit=30&category=$selectedCategory"
            : "product-list?product_name=$SearchString&limit=30&shop=$selectedShop";
    final response = await get(Uri.parse(baseurl + slug), headers: AuthHeader);
    print(response.body);
    if (response.statusCode == 200) {
      for (var data in json.decode(response.body))
        ProductList.add(ProductModel.fromJson(data));
      update();
    }
  }

  loadShopes() async {
    ShopList.clear();
    final response =
        await get(Uri.parse(baseurl + "shops-add-list/"), headers: AuthHeader);
    print(response.body);
    if (response.statusCode == 200) {
      for (var data in json.decode(response.body))
        ShopList.add(ShopModel.fromJson(data));
      update();
    }
  }

  loadPopularProductModel() async {
    final response = await get(Uri.parse(baseurl + "popular-product-list/"),
        headers: AuthHeader);
    print(response.body);
    if (response.statusCode == 200) {
      for (var data in json.decode(response.body))
        popularProductList.add(PopularProductModel.fromJson(data));
      update();
    }
  }

  SearchText(String text) {
    searchMethod = 0;
    SearchString = text;
    update();
    loadProducts();
  }

  searchCategory(String category, {String text = ""}) {
    searchMethod = 1;
    selectedCategory = category;
    SearchString = text;
    update();
    loadProducts();
  }

  searchShop(String shop, {String text = ""}) {
    searchMethod = 2;
    selectedShop = shop;
    SearchString = text;
    update();
    loadProducts();
  }

  addToCart(int productID) async {
    final Response = await post(Uri.parse(baseurl + "add-to-cart/"),
        body: {"product_id": productID.toString()}, headers: AuthHeader);

    print(Response.body);
    print(Response.statusCode);

    if (Response.statusCode == 200) {
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

      update();
    }
  }

  int getProductQuantity(int productID) {
    int qty = 0;
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
    loadCategoryes();
    // loadProducts();
    loadPopularProductModel();
    loadShopes();
    GetProfile();
    print("working");
  }
}
