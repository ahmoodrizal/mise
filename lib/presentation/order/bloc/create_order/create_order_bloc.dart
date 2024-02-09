// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mise/data/datasources/order_remote_datasource.dart';
import 'package:mise/data/models/requests/order_request_model.dart';
import 'package:mise/data/models/responses/order_response_model.dart';

import '../../../home/models/product_quantity.dart';

part 'create_order_bloc.freezed.dart';
part 'create_order_event.dart';
part 'create_order_state.dart';

class CreateOrderBloc extends Bloc<CreateOrderEvent, CreateOrderState> {
  final OrderRemoteDatasource _orderRemoteDatasource;
  CreateOrderBloc(
    this._orderRemoteDatasource,
  ) : super(const _Initial()) {
    on<_DoOrder>((event, emit) async {
      emit(const _Loading());
      final orderRequestData = OrderRequestModel(
        addressId: event.addressId.toString(),
        paymentMethod: event.paymentMethod,
        shippingService: event.shippingService,
        shippingCost: event.shippingCost,
        paymentVaName: event.paymentVaName,
        subtotal: 0,
        totalCost: 0,
        products: event.products.map((e) => Item(productId: e.product.id!, quantity: e.quantity)).toList(),
      );
      final response = await _orderRemoteDatasource.createOrder(orderRequestData);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
