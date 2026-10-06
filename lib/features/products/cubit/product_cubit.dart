import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testa_toro/features/products/cubit/product_state.dart';
import 'package:testa_toro/features/products/repos/product_repo.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo productRepo;

  ProductCubit(this.productRepo) : super(ProductInitial());

  Future<void> getProducts() async {
    emit(ProductLoading());

    try {
      final products = await productRepo.getProducts();

      emit(ProductSuccess(products));
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }
}
