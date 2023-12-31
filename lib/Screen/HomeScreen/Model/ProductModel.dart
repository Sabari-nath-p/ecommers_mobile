class ProductModel {
  int? productId;
  List<int>? category;
  String? shop;
  Null? brand;
  String? productName;
  List<ProductImages>? productImages;
  String? actualPrice;
  String? salesPrice;
  String? description;
  double? rating;
  int? quantity;
  String? unitName;
  bool? companyAssured;
  bool? isPopular;
  bool? isActive;
  String? createdDate;
  String? updatedDate;
  bool? outOfStock;
  String? productSlug;
  Null? otherField;

  ProductModel(
      {this.productId,
      this.category,
      this.shop,
      this.brand,
      this.productName,
      this.productImages,
      this.actualPrice,
      this.salesPrice,
      this.description,
      this.rating,
      this.quantity,
      this.unitName,
      this.companyAssured,
      this.isPopular,
      this.isActive,
      this.createdDate,
      this.updatedDate,
      this.outOfStock,
      this.productSlug,
      this.otherField});

  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    category = json['category'].cast<int>();
    shop = json['shop'];
    brand = json['brand'];
    productName = json['product_name'];
    if (json['product_images'] != null) {
      productImages = <ProductImages>[];
      json['product_images'].forEach((v) {
        productImages!.add(new ProductImages.fromJson(v));
      });
    }
    actualPrice = json['actual_price'];
    salesPrice = json['sales_price'];
    description = json['description'];
    rating = json['rating'];
    quantity = json['quantity'];
    unitName = json['unit_name'];
    companyAssured = json['company_assured'];
    isPopular = json['is_popular'];
    isActive = json['is_active'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    outOfStock = json['out_of_stock'];
    productSlug = json['product_slug'];
    otherField = json['other_field'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['category'] = this.category;
    data['shop'] = this.shop;
    data['brand'] = this.brand;
    data['product_name'] = this.productName;
    if (this.productImages != null) {
      data['product_images'] =
          this.productImages!.map((v) => v.toJson()).toList();
    }
    data['actual_price'] = this.actualPrice;
    data['sales_price'] = this.salesPrice;
    data['description'] = this.description;
    data['rating'] = this.rating;
    data['quantity'] = this.quantity;
    data['unit_name'] = this.unitName;
    data['company_assured'] = this.companyAssured;
    data['is_popular'] = this.isPopular;
    data['is_active'] = this.isActive;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    data['out_of_stock'] = this.outOfStock;
    data['product_slug'] = this.productSlug;
    data['other_field'] = this.otherField;
    return data;
  }
}

class ProductImages {
  int? id;
  String? image;

  ProductImages({this.id, this.image});

  ProductImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}
