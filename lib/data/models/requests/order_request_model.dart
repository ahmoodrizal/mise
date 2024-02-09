import 'dart:convert';

class OrderRequestModel {
  final String? addressId;
  final String? paymentMethod;
  final String? paymentVaName;
  final String? shippingService;
  final int? shippingCost;
  final int? totalCost;
  final int? subtotal;
  final List<Item>? products;

  OrderRequestModel({
    this.addressId,
    this.paymentMethod,
    this.paymentVaName,
    this.shippingService,
    this.shippingCost,
    this.totalCost,
    this.subtotal,
    this.products,
  });

  factory OrderRequestModel.fromJson(String str) => OrderRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderRequestModel.fromMap(Map<String, dynamic> json) => OrderRequestModel(
        addressId: json["address_id"],
        paymentMethod: json["payment_method"],
        paymentVaName: json["payment_va_name"],
        shippingService: json["shipping_service"],
        shippingCost: json["shipping_cost"],
        totalCost: json["total_cost"],
        subtotal: json["subtotal"],
        products: json["products"] == null ? [] : List<Item>.from(json["products"]!.map((x) => Item.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "address_id": addressId,
        "payment_method": paymentMethod,
        "payment_va_name": paymentVaName,
        "shipping_service": shippingService,
        "shipping_cost": shippingCost,
        "total_cost": totalCost,
        "subtotal": subtotal,
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toMap())),
      };
}

class Item {
  final int? productId;
  final int? quantity;

  Item({
    this.productId,
    this.quantity,
  });

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        productId: json["product_id"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toMap() => {
        "product_id": productId,
        "quantity": quantity,
      };
}
