import 'package:flutter/material.dart';
import 'package:testa_toro/core/utils/app_colors.dart';

/// Reusable and "dumb": it only knows which index is selected and reports taps.
/// It has no idea about Cubits, which keeps it reusable and easy to test.
class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  // Same order as the AppTab enum.
  static const _items = <_NavItemData>[
    _NavItemData('HOME', Icons.home_outlined, Icons.home),
    _NavItemData('PRODUCTS', Icons.grid_view_outlined, Icons.grid_view),
    _NavItemData('FAVORITES', Icons.favorite_border, Icons.favorite),
    _NavItemData('CART', Icons.shopping_bag_outlined, Icons.shopping_bag),
    _NavItemData('PROFILE', Icons.person_outline, Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bg,
        border: Border(top: BorderSide(color: AppColors.secondary)),
      ),
      // SafeArea keeps the bar above the iOS home indicator / Android gesture bar.
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              for (var i = 0; i < _items.length; i++)
                Expanded(
                  child: _NavBarButton(
                    data: _items[i],
                    selected: i == currentIndex,
                    onTap: () => onTap(i),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItemData {
  final String label;
  final IconData icon;
  final IconData activeIcon;

  const _NavItemData(this.label, this.icon, this.activeIcon);
}

class _NavBarButton extends StatelessWidget {
  final _NavItemData data;
  final bool selected;
  final VoidCallback onTap;

  const _NavBarButton({
    required this.data,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.primary : Colors.black45;

    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          // Small indicator line on top of the selected tab.
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 2,
            width: selected ? 28 : 0,
            color: AppColors.primary,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(selected ? data.activeIcon : data.icon,
                    size: 22, color: color),
                const SizedBox(height: 4),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    data.label,
                    style: TextStyle(
                      color: color,
                      fontSize: 9,
                      letterSpacing: 1,
                      fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
