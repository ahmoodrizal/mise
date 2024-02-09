part of 'tracking_bloc.dart';

@freezed
class TrackingEvent with _$TrackingEvent {
  const factory TrackingEvent.started() = _Started;
  const factory TrackingEvent.checkWaybill(String waybill, String courier) = _CheckWaybill;
}
