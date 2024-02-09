part of 'create_order_bloc.dart';

@freezed
class CreateOrderState with _$CreateOrderState {
  const factory CreateOrderState.initial() = _Initial;
  const factory CreateOrderState.loading() = _Loading;
  const factory CreateOrderState.loaded(OrderResponseModel orderResponseModel) = _Loaded;
  const factory CreateOrderState.error(String message) = _Error;
}
