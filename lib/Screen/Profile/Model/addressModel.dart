class AddressModel {
  int? id;
  String? houseName;
  String? area;
  String? city;
  String? district;
  String? state;
  String? postoffice;
  String? pincode;

  AddressModel(
      {this.id,
      this.houseName,
      this.area,
      this.city,
      this.district,
      this.state,
      this.postoffice,
      this.pincode});

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    houseName = json['house_name'];
    area = json['area'];
    city = json['city'];
    district = json['district'];
    state = json['state'];
    postoffice = json['postoffice'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['house_name'] = this.houseName;
    data['area'] = this.area;
    data['city'] = this.city;
    data['district'] = this.district;
    data['state'] = this.state;
    data['postoffice'] = this.postoffice;
    data['pincode'] = this.pincode;
    return data;
  }
}
