class CartModel {
  List<Cart>? cart;
  String? totalAmount;

  CartModel({this.cart, this.totalAmount});

  CartModel.fromJson(Map<String, dynamic> json) {
    if (json['cart'] != null) {
      cart = <Cart>[];
      json['cart'].forEach((v) {
        cart!.add(new Cart.fromJson(v));
      });
    }
    totalAmount = json['total_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cart != null) {
      data['cart'] = this.cart!.map((v) => v.toJson()).toList();
    }
    data['total_amount'] = this.totalAmount;
    return data;
  }
}

class Cart {
  String? product;
  int? quantity;
  String? associatedShop;

  Cart({this.product, this.quantity, this.associatedShop});

  Cart.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    quantity = json['quantity'];
    associatedShop = json['associated_shop'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = this.product;
    data['quantity'] = this.quantity;
    data['associated_shop'] = this.associatedShop;
    return data;
  }
}
