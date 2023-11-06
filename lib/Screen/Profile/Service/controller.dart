import 'dart:convert';

import 'package:ecommerce_mobile/Constants/Strings.dart';
import 'package:ecommerce_mobile/Screen/Profile/Model/addressModel.dart';
import 'package:ecommerce_mobile/main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../../Constants/Headers.dart';

class ProfileController extends GetxController {
  List<AddressModel> AddressList = [];
  GetAddressList() async {
    AddressList.clear();
    final Response = await get(
      Uri.parse(baseurl + "user-address-add-list/"),
      headers: AuthHeader,
    );
    if (Response.statusCode == 200) {
      for (var data in json.decode(Response.body))
        AddressList.add(AddressModel.fromJson(data));
      update();
    }
  }

//  body: {
//           "house_name": "Test address Name 2",
//           "area": "test locallity 2",
//           "city": "Haripad",
//           "district": "alappuzha",
//           "state": "kerala",
//           "postoffice": "karuvatta PO",
//           "pincode": "690517"
//         }
  GetProfile() async {
    print(token);
    final Response =
        await get(Uri.parse(baseurl + "profile-view/"), headers: AuthHeader);
    print(Response.body);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    GetAddressList();
  }
}
