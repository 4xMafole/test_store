import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:store_repository/store_repository.dart'
    show Product, StoreRepository;

part 'products_cubit.g.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._storeRepository) : super(ProductsState());
  final StoreRepository _storeRepository;

  Future<void> fetchProducts() async {
    emit(state.copyWith(status: ProductsStatus.loading));

    try {
      final products = await _storeRepository.getProducts();

      emit(
        state.copyWith(
          products: products,
          status: ProductsStatus.success,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: ProductsStatus.failure));
    }
  }

  Future<void> refreshProducts() async {
    if (!state.status.isSuccess) return;
    if (state.products == <Product>[]) return;

    try {
      final products = await _storeRepository.getProducts();
      emit(
        state.copyWith(
          products: products,
          status: ProductsStatus.success,
        ),
      );
    } catch (_) {
      emit(state);
    }
  }
}
