part of 'shipping_cost_bloc.dart';

@freezed
class ShippingCostState with _$ShippingCostState {
  const factory ShippingCostState.initial() = _Initial;
  const factory ShippingCostState.loading() = _Loading;
  const factory ShippingCostState.loaded(CostResponseModel costResponseModel) = _Loaded;
  const factory ShippingCostState.error(String message) = _Error;
}
