import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:testa_toro/features/products/repos/product_repo.dart';

import '../cubit/product_cubit.dart';
import '../cubit/product_state.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCubit(
        ProductRepo(
          Supabase.instance.client,
        ),
      )..getProducts(),
      child: const ProductsView(),
    );
  }
}

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ProductFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                textAlign: TextAlign.center,
              ),
            );
          }

          if (state is ProductSuccess) {
            if (state.products.isEmpty) {
              return const Center(
                child: Text('No products found'),
              );
            }

            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];

                return ListTile(
                  title: Text(product.name),
                  subtitle: Text(
                    product.description ?? '',
                  ),
                  trailing: Text(
                    '${product.basePrice} EGP',
                  ),
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}

