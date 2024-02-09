// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mise/data/datasources/order_remote_datasource.dart';

part 'check_status_bloc.freezed.dart';
part 'check_status_event.dart';
part 'check_status_state.dart';

class CheckStatusBloc extends Bloc<CheckStatusEvent, CheckStatusState> {
  final OrderRemoteDatasource _orderRemoteDatasource;
  CheckStatusBloc(
    this._orderRemoteDatasource,
  ) : super(const _Initial()) {
    on<_CheckOrderStatus>((event, emit) async {
      emit(const _Loading());
      final response = await _orderRemoteDatasource.getOrderStatus(event.orderId);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
