// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mise/data/datasources/raja_ongkir_remote_datasource.dart';

import '../../../../data/models/responses/city_response_model.dart';

part 'city_bloc.freezed.dart';
part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final RajaOngkirRemoteDatasource _rajaOngkirRemoteDatasource;
  CityBloc(
    this._rajaOngkirRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetCitiesByProvince>((event, emit) async {
      emit(const _Loading());
      final response = await _rajaOngkirRemoteDatasource.getCitiesByProvince(event.provId);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.rajaongkir?.results ?? [])),
      );
    });
  }
}
