import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testa_toro/core/widgets/app_bottom_nav_bar.dart';
import 'package:testa_toro/features/cart/screens/cart_screen.dart';
import 'package:testa_toro/features/favorites/screens/favorites_screen.dart';
import 'package:testa_toro/features/home/screens/home_screen.dart';
import 'package:testa_toro/features/navigation/cubit/navigation_cubit.dart';
import 'package:testa_toro/features/products/screens/product_screen.dart';
import 'package:testa_toro/features/profile/screens/profile_screen.dart';

/// Hosts the five main screens and the bottom bar.
class MainShell extends StatelessWidget {
  const MainShell({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, AppTab>(
      builder: (context, tab) {
        // Back button: from any tab other than Home, go to Home first.
        // Only from Home does back actually leave the app.
        return PopScope(
          canPop: tab == AppTab.home,
          onPopInvokedWithResult: (didPop, _) {
            if (!didPop) context.read<NavigationCubit>().goTo(AppTab.home);
          },
          child: Scaffold(
            // IndexedStack keeps all five screens alive, so scroll position
            // and loaded data are preserved when switching tabs.
            // The order MUST match the AppTab enum.
            body: IndexedStack(
              index: tab.index,
              children: const [
                HomeScreen(),
                ProductsScreen(),
                FavoritesScreen(),
                CartScreen(),
                ProfileScreen(),
              ],
            ),
            bottomNavigationBar: AppBottomNavBar(
              currentIndex: tab.index,
              onTap: (index) =>
                  context.read<NavigationCubit>().goTo(AppTab.values[index]),
            ),
          ),
        );
      },
    );
  }
}
