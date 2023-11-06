class ShopModel {
  int? id;
  int? shopId;
  String? shopName;
  List? shopImages;
  String? ownerName;
  String? locality;
  String? pinCode;
  String? city;
  String? district;
  String? state;
  String? phoneNumber;
  bool? isPopular;
  bool? isActive;
  String? createdDate;
  String? updatedDate;
  String? shopSlug;
  String? otherField;
  List<String>? products;
  int? productsCount;

  ShopModel(
      {this.id,
      this.shopId,
      this.shopName,
      this.shopImages,
      this.ownerName,
      this.locality,
      this.pinCode,
      this.city,
      this.district,
      this.state,
      this.phoneNumber,
      this.isPopular,
      this.isActive,
      this.createdDate,
      this.updatedDate,
      this.shopSlug,
      this.otherField,
      this.products,
      this.productsCount});

  ShopModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    if (json['shop_images'] != null) {
      shopImages = json['shop_images'];
    }
    ownerName = json['owner_name'];
    locality = json['locality'];
    pinCode = json['pin_code'];
    city = json['city'];
    district = json['district'];
    state = json['state'];
    phoneNumber = json['phone_number'];
    isPopular = json['is_popular'];
    isActive = json['is_active'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    shopSlug = json['shop_slug'];
    otherField = json['other_field'];
    products = json['products'].cast<String>();
    productsCount = json['products_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shop_id'] = this.shopId;
    data['shop_name'] = this.shopName;
    if (this.shopImages != null) {
      data['shop_images'] = this.shopImages!.map((v) => v.toJson()).toList();
    }
    data['owner_name'] = this.ownerName;
    data['locality'] = this.locality;
    data['pin_code'] = this.pinCode;
    data['city'] = this.city;
    data['district'] = this.district;
    data['state'] = this.state;
    data['phone_number'] = this.phoneNumber;
    data['is_popular'] = this.isPopular;
    data['is_active'] = this.isActive;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    data['shop_slug'] = this.shopSlug;
    data['other_field'] = this.otherField;
    data['products'] = this.products;
    data['products_count'] = this.productsCount;
    return data;
  }
}
