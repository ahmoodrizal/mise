part of 'create_order_bloc.dart';

@freezed
class CreateOrderEvent with _$CreateOrderEvent {
  const factory CreateOrderEvent.started() = _Started;
  const factory CreateOrderEvent.doOrder({
    required int addressId,
    required String paymentMethod,
    required String shippingService,
    required int shippingCost,
    required String paymentVaName,
    required List<ProductQuantity> products,
  }) = _DoOrder;
}
