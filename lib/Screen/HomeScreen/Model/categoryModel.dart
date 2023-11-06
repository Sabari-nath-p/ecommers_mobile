class CategoryModel {
  int? categoryId;
  String? categoryName;
  List<CategoryImages>? categoryImages;
  bool? isPopular;
  bool? isActive;
  String? createdDate;
  String? updatedDate;
  String? categorySlug;
  String? otherField;

  CategoryModel(
      {this.categoryId,
      this.categoryName,
      this.categoryImages,
      this.isPopular,
      this.isActive,
      this.createdDate,
      this.updatedDate,
      this.categorySlug,
      this.otherField});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    if (json['category_images'] != null) {
      categoryImages = <CategoryImages>[];
      json['category_images'].forEach((v) {
        categoryImages!.add(new CategoryImages.fromJson(v));
      });
    }
    isPopular = json['is_popular'];
    isActive = json['is_active'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    categorySlug = json['category_slug'];
    otherField = json['other_field'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    if (this.categoryImages != null) {
      data['category_images'] =
          this.categoryImages!.map((v) => v.toJson()).toList();
    }
    data['is_popular'] = this.isPopular;
    data['is_active'] = this.isActive;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    data['category_slug'] = this.categorySlug;
    data['other_field'] = this.otherField;
    return data;
  }
}

class CategoryImages {
  int? id;
  String? images;

  CategoryImages({this.id, this.images});

  CategoryImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['images'] = this.images;
    return data;
  }
}
