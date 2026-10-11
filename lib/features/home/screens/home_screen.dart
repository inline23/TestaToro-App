import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testa_toro/core/utils/app_colors.dart';
import 'package:testa_toro/features/home/widgets/announcement_bar.dart';
import 'package:testa_toro/features/home/widgets/brand_story_section.dart';
import 'package:testa_toro/features/home/widgets/category_strip.dart';
import 'package:testa_toro/features/home/widgets/drop_countdown_section.dart';
import 'package:testa_toro/features/home/widgets/hero_section.dart';
import 'package:testa_toro/features/home/widgets/home_footer.dart';
import 'package:testa_toro/features/home/widgets/home_header.dart';
import 'package:testa_toro/features/home/widgets/trending_section.dart';
import 'package:testa_toro/features/navigation/cubit/navigation_cubit.dart';

/// ProductCubit now comes from main.dart (shared), so this screen no longer
/// creates its own BlocProvider.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Explore and "View all" go through the SAME logic as the Products tab.
    void openProducts() =>
        context.read<NavigationCubit>().goTo(AppTab.products);

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            const AnnouncementBar(),
            const HomeHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HeroSection(onExplore: openProducts),
                    const CategoryStrip(),
                    // TODO: replace with the real drop date from the backend.
                    DropCountdownSection(dropDate: DateTime(2026, 11, 1)),
                    TrendingSection(onViewAll: openProducts),
                    const BrandStorySection(),
                    const HomeFooter(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
