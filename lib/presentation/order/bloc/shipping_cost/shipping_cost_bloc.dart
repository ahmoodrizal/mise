// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mise/data/datasources/raja_ongkir_remote_datasource.dart';
import 'package:mise/data/models/responses/cost_response_model.dart';

part 'shipping_cost_bloc.freezed.dart';
part 'shipping_cost_event.dart';
part 'shipping_cost_state.dart';

class ShippingCostBloc extends Bloc<ShippingCostEvent, ShippingCostState> {
  final RajaOngkirRemoteDatasource _rajaOngkirRemoteDatasource;
  ShippingCostBloc(
    this._rajaOngkirRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetShippingCost>((event, emit) async {
      emit(const _Loading());
      final response = await _rajaOngkirRemoteDatasource.getShippingCost(
        origin: event.origin,
        destination: event.destination,
        courier: event.courier,
        weight: event.weight.toString(),
      );
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
