import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:testa_toro/core/utils/app_colors.dart';
import 'package:testa_toro/features/home/widgets/announcement_bar.dart';
import 'package:testa_toro/features/home/widgets/brand_story_section.dart';
import 'package:testa_toro/features/home/widgets/category_strip.dart';
import 'package:testa_toro/features/home/widgets/drop_countdown_section.dart';
import 'package:testa_toro/features/home/widgets/hero_section.dart';
import 'package:testa_toro/features/home/widgets/home_footer.dart';
import 'package:testa_toro/features/home/widgets/home_header.dart';
import 'package:testa_toro/features/home/widgets/trending_section.dart';
import 'package:testa_toro/features/products/cubit/product_cubit.dart';
import 'package:testa_toro/features/products/repos/product_repo.dart';
import 'package:testa_toro/features/products/screens/product_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCubit(
        ProductRepo(Supabase.instance.client),
      )..getProducts(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  void _openProducts(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const ProductsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    HeroSection(onExplore: () => _openProducts(context)),
                    const CategoryStrip(),
                    // TODO: replace with the real drop date from the backend.
                    DropCountdownSection(dropDate: DateTime(2026, 11, 1)),
                    TrendingSection(onViewAll: () => _openProducts(context)),
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
