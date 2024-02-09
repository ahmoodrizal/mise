// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mise/data/datasources/raja_ongkir_remote_datasource.dart';
import 'package:mise/data/models/responses/waybill_response_model.dart';

part 'tracking_bloc.freezed.dart';
part 'tracking_event.dart';
part 'tracking_state.dart';

class TrackingBloc extends Bloc<TrackingEvent, TrackingState> {
  final RajaOngkirRemoteDatasource _rajaOngkirRemoteDatasource;
  TrackingBloc(
    this._rajaOngkirRemoteDatasource,
  ) : super(const _Initial()) {
    on<_CheckWaybill>((event, emit) async {
      emit(const _Loading());
      final response = await _rajaOngkirRemoteDatasource.getWaybill(event.waybill, event.courier);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
