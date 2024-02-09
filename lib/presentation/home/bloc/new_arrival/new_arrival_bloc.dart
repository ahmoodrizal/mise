// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mise/data/datasources/product_remote_datasource.dart';

import '../../../../data/models/responses/product_response_model.dart';

part 'new_arrival_bloc.freezed.dart';
part 'new_arrival_event.dart';
part 'new_arrival_state.dart';

class NewArrivalBloc extends Bloc<NewArrivalEvent, NewArrivalState> {
  final ProductRemoteDatasource _productRemoteDatasource;
  NewArrivalBloc(
    this._productRemoteDatasource,
  ) : super(const _Initial()) {
    on<NewArrivalEvent>((event, emit) async {
      emit(const NewArrivalState.loading());
      final response = await _productRemoteDatasource.getProductsByCategory(8);
      response.fold(
        (l) => emit(const NewArrivalState.error('Internal Server Error')),
        (r) => emit(NewArrivalState.loaded(r.data!.data!)),
      );
    });
  }
}
