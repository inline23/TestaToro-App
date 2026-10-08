import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testa_toro/core/utils/app_colors.dart';
import 'package:testa_toro/features/home/widgets/home_product_card.dart';
import 'package:testa_toro/features/products/cubit/product_cubit.dart';
import 'package:testa_toro/features/products/cubit/product_state.dart';

class TrendingSection extends StatelessWidget {
  final VoidCallback onViewAll;

  const TrendingSection({super.key, required this.onViewAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'TRENDING NOW',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
              GestureDetector(
                onTap: onViewAll,
                child: Text(
                  'VIEW ALL',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (state is ProductFailure) {
                return Center(
                  child: Text(state.errorMessage, textAlign: TextAlign.center),
                );
              }

              if (state is ProductSuccess) {
                if (state.products.isEmpty) {
                  return const Center(child: Text('No products found'));
                }

                final products = state.products.take(4).toList();

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.62,
                  ),
                  itemBuilder: (context, index) =>
                      HomeProductCard(product: products[index]),
                );
              }

              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
