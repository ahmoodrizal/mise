// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mise/data/datasources/address_remote_datasource.dart';
import 'package:mise/data/models/requests/address_request_model.dart';

part 'create_address_bloc.freezed.dart';
part 'create_address_event.dart';
part 'create_address_state.dart';

class CreateAddressBloc extends Bloc<CreateAddressEvent, CreateAddressState> {
  final AddressRemoteDatasource _addressRemoteDatasource;
  CreateAddressBloc(
    this._addressRemoteDatasource,
  ) : super(const _Initial()) {
    on<_CreateNewAddress>((event, emit) async {
      emit(const _Loading());
      final response = await _addressRemoteDatasource.createNewAddress(event.addressRequestModel);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(const _Loaded()),
      );
    });
  }
}
