part of 'shipping_cost_bloc.dart';

@freezed
class ShippingCostEvent with _$ShippingCostEvent {
  const factory ShippingCostEvent.started() = _Started;
  const factory ShippingCostEvent.getShippingCost({
    required String origin,
    required String destination,
    required int weight,
    required String courier,
  }) = _GetShippingCost;
}
