part of 'create_address_bloc.dart';

@freezed
class CreateAddressState with _$CreateAddressState {
  const factory CreateAddressState.initial() = _Initial;
  const factory CreateAddressState.loading() = _Loading;
  const factory CreateAddressState.loaded() = _Loaded;
  const factory CreateAddressState.error(String message) = _Error;
}
