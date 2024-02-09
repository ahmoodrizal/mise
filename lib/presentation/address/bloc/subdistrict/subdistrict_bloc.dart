// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mise/data/datasources/raja_ongkir_remote_datasource.dart';

import '../../../../data/models/responses/subdistrict_response_model.dart';

part 'subdistrict_bloc.freezed.dart';
part 'subdistrict_event.dart';
part 'subdistrict_state.dart';

class SubdistrictBloc extends Bloc<SubdistrictEvent, SubdistrictState> {
  final RajaOngkirRemoteDatasource _rajaOngkirRemoteDatasource;
  SubdistrictBloc(
    this._rajaOngkirRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetSubdistrictsByCity>((event, emit) async {
      emit(const _Loading());
      final response = await _rajaOngkirRemoteDatasource.getSubdistrictByCity(event.cityId);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.rajaongkir?.results ?? [])),
      );
    });
  }
}
