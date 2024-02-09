import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mise/core/constants/config.dart';
import 'package:mise/data/datasources/auth_local_datasource.dart';
import 'package:mise/data/models/requests/order_request_model.dart';
import 'package:mise/data/models/responses/history_order_response_model.dart';
import 'package:mise/data/models/responses/order_detail_response_model.dart';
import 'package:mise/data/models/responses/order_response_model.dart';

class OrderRemoteDatasource {
  Future<Either<String, OrderResponseModel>> createOrder(OrderRequestModel orderRequestModel) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(
      Uri.parse('${Config.baseUrl}/order'),
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${authData!.token}',
      },
      body: orderRequestModel.toJson(),
    );
    if (response.statusCode == 201) {
      return right(OrderResponseModel.fromJson(response.body));
    } else {
      return left('Internal Server Error');
    }
  }

  Future<Either<String, String>> getOrderStatus(int orderId) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      Uri.parse('${Config.baseUrl}/order/status/$orderId'),
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${authData!.token}',
      },
    );
    if (response.statusCode == 200) {
      return right(jsonDecode(response.body)['status']);
    } else {
      return left('Internal Server Error');
    }
  }

  Future<Either<String, HistoryOrderResponseModel>> getHistoryOrders() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      Uri.parse('${Config.baseUrl}/orders'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData!.token}',
      },
    );
    if (response.statusCode == 200) {
      return right(HistoryOrderResponseModel.fromJson(response.body));
    } else {
      return left('Internal Server Error');
    }
  }

  Future<Either<String, OrderDetailResponseModel>> getOrderById(int id) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      Uri.parse('${Config.baseUrl}/order/$id'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData!.token}',
      },
    );

    if (response.statusCode == 200) {
      return right(OrderDetailResponseModel.fromJson(response.body));
    } else {
      return left('Internal Server Error');
    }
  }
}
