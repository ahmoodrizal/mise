import 'dart:convert';

class HistoryOrderResponseModel {
  final String? message;
  final List<HistoryOrder>? orders;

  HistoryOrderResponseModel({
    this.message,
    this.orders,
  });

  factory HistoryOrderResponseModel.fromJson(String str) => HistoryOrderResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HistoryOrderResponseModel.fromMap(Map<String, dynamic> json) => HistoryOrderResponseModel(
        message: json["message"],
        orders: json["orders"] == null ? [] : List<HistoryOrder>.from(json["orders"]!.map((x) => HistoryOrder.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "orders": orders == null ? [] : List<dynamic>.from(orders!.map((x) => x.toMap())),
      };
}

class HistoryOrder {
  final int? id;
  final int? userId;
  final int? addressId;
  final String? transactionNumber;
  final int? subtotal;
  final String? shippingService;
  final int? shippingCost;
  final dynamic shippingResi;
  final int? totalCost;
  final String? paymentMethod;
  final String? paymentVaName;
  final String? paymentVaNumber;
  final dynamic paymentUrl;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  HistoryOrder({
    this.id,
    this.userId,
    this.addressId,
    this.transactionNumber,
    this.subtotal,
    this.shippingService,
    this.shippingCost,
    this.shippingResi,
    this.totalCost,
    this.paymentMethod,
    this.paymentVaName,
    this.paymentVaNumber,
    this.paymentUrl,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory HistoryOrder.fromJson(String str) => HistoryOrder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HistoryOrder.fromMap(Map<String, dynamic> json) => HistoryOrder(
        id: json["id"],
        userId: json["user_id"],
        addressId: json["address_id"],
        transactionNumber: json["transaction_number"],
        subtotal: json["subtotal"],
        shippingService: json["shipping_service"],
        shippingCost: json["shipping_cost"],
        shippingResi: json["shipping_resi"],
        totalCost: json["total_cost"],
        paymentMethod: json["payment_method"],
        paymentVaName: json["payment_va_name"],
        paymentVaNumber: json["payment_va_number"],
        paymentUrl: json["payment_url"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "address_id": addressId,
        "transaction_number": transactionNumber,
        "subtotal": subtotal,
        "shipping_service": shippingService,
        "shipping_cost": shippingCost,
        "shipping_resi": shippingResi,
        "total_cost": totalCost,
        "payment_method": paymentMethod,
        "payment_va_name": paymentVaName,
        "payment_va_number": paymentVaNumber,
        "payment_url": paymentUrl,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
