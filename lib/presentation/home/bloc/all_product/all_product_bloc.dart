// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mise/data/datasources/product_remote_datasource.dart';
import 'package:mise/data/models/responses/product_response_model.dart';

part 'all_product_bloc.freezed.dart';
part 'all_product_event.dart';
part 'all_product_state.dart';

class AllProductBloc extends Bloc<AllProductEvent, AllProductState> {
  final ProductRemoteDatasource _productRemoteDatasource;
  AllProductBloc(
    this._productRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetAllProducts>((event, emit) async {
      emit(const AllProductState.loading());
      final response = await _productRemoteDatasource.getProducts();
      response.fold(
        (l) => emit(const AllProductState.error('Internal Server Error')),
        (r) => emit(AllProductState.loaded(r.data!.data!)),
      );
    });
  }
}
