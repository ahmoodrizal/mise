part of 'create_address_bloc.dart';

@freezed
class CreateAddressEvent with _$CreateAddressEvent {
  const factory CreateAddressEvent.started() = _Started;
  const factory CreateAddressEvent.createNewAddress({
    required AddressRequestModel addressRequestModel,
  }) = _CreateNewAddress;
}
