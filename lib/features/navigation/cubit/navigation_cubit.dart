import 'package:flutter_bloc/flutter_bloc.dart';

/// The five main destinations, in bottom-bar order.
/// `AppTab.values[i]` maps a bar index back to a tab, and `tab.index`
/// maps a tab to its position in the IndexedStack.
enum AppTab { home, products, favorites, cart, profile }

/// The state IS the selected tab, so no separate state classes are needed.
class NavigationCubit extends Cubit<AppTab> {
  NavigationCubit() : super(AppTab.home);

  /// Single entry point for switching main screens.
  /// Used by the bottom bar, the Explore button, "View all", back handling...
  void goTo(AppTab tab) => emit(tab);
}
