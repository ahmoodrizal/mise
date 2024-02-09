import 'dart:convert';

class OrderDetailResponseModel {
  final String? message;
  final OrderDetail? order;

  OrderDetailResponseModel({
    this.message,
    this.order,
  });

  factory OrderDetailResponseModel.fromJson(String str) => OrderDetailResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderDetailResponseModel.fromMap(Map<String, dynamic> json) => OrderDetailResponseModel(
        message: json["message"],
        order: json["order"] == null ? null : OrderDetail.fromMap(json["order"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "order": order?.toMap(),
      };
}

class OrderDetail {
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
  final List<OrderItem>? orderItems;
  final User? user;
  final Address? address;

  OrderDetail({
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
    this.orderItems,
    this.user,
    this.address,
  });

  factory OrderDetail.fromJson(String str) => OrderDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderDetail.fromMap(Map<String, dynamic> json) => OrderDetail(
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
        orderItems: json["order_items"] == null ? [] : List<OrderItem>.from(json["order_items"]!.map((x) => OrderItem.fromMap(x))),
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        address: json["address"] == null ? null : Address.fromMap(json["address"]),
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
        "order_items": orderItems == null ? [] : List<dynamic>.from(orderItems!.map((x) => x.toMap())),
        "user": user?.toMap(),
        "address": address?.toMap(),
      };
}

class Address {
  final int? id;
  final int? userId;
  final String? name;
  final String? fullAddress;
  final String? phone;
  final String? provId;
  final String? cityId;
  final String? districtId;
  final String? postalCode;
  final int? isDefault;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Address({
    this.id,
    this.userId,
    this.name,
    this.fullAddress,
    this.phone,
    this.provId,
    this.cityId,
    this.districtId,
    this.postalCode,
    this.isDefault,
    this.createdAt,
    this.updatedAt,
  });

  factory Address.fromJson(String str) => Address.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        fullAddress: json["full_address"],
        phone: json["phone"],
        provId: json["prov_id"],
        cityId: json["city_id"],
        districtId: json["district_id"],
        postalCode: json["postal_code"],
        isDefault: json["is_default"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "full_address": fullAddress,
        "phone": phone,
        "prov_id": provId,
        "city_id": cityId,
        "district_id": districtId,
        "postal_code": postalCode,
        "is_default": isDefault,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class OrderItem {
  final int? id;
  final int? orderId;
  final int? productId;
  final int? quantity;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Product? product;

  OrderItem({
    this.id,
    this.orderId,
    this.productId,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  factory OrderItem.fromJson(String str) => OrderItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderItem.fromMap(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        quantity: json["quantity"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        product: json["product"] == null ? null : Product.fromMap(json["product"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "quantity": quantity,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "product": product?.toMap(),
      };
}

class Product {
  final int? id;
  final int? categoryId;
  final String? name;
  final String? slug;
  final String? description;
  final int? price;
  final int? stock;
  final String? image;
  final int? isAvailable;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Product({
    this.id,
    this.categoryId,
    this.name,
    this.slug,
    this.description,
    this.price,
    this.stock,
    this.image,
    this.isAvailable,
    this.createdAt,
    this.updatedAt,
  });

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        categoryId: json["category_id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        price: json["price"],
        stock: json["stock"],
        image: json["image"],
        isAvailable: json["is_available"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "category_id": categoryId,
        "name": name,
        "slug": slug,
        "description": description,
        "price": price,
        "stock": stock,
        "image": image,
        "is_available": isAvailable,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class User {
  final int? id;
  final String? name;
  final String? email;
  final dynamic phoneNumber;
  final String? role;
  final String? fcmId;
  final DateTime? emailVerifiedAt;
  final dynamic twoFactorSecret;
  final dynamic twoFactorRecoveryCodes;
  final dynamic twoFactorConfirmedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.role,
    this.fcmId,
    this.emailVerifiedAt,
    this.twoFactorSecret,
    this.twoFactorRecoveryCodes,
    this.twoFactorConfirmedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        role: json["role"],
        fcmId: json["fcm_id"],
        emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
        twoFactorSecret: json["two_factor_secret"],
        twoFactorRecoveryCodes: json["two_factor_recovery_codes"],
        twoFactorConfirmedAt: json["two_factor_confirmed_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "role": role,
        "fcm_id": fcmId,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "two_factor_secret": twoFactorSecret,
        "two_factor_recovery_codes": twoFactorRecoveryCodes,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
