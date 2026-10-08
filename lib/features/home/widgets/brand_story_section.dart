import 'package:flutter/material.dart';
import 'package:testa_toro/core/utils/app_colors.dart';

class BrandStorySection extends StatelessWidget {
  const BrandStorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.primary,
      padding: const EdgeInsets.all(24),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BORN IN CAIRO, ENGINEERED FOR THE STREETS.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              height: 1.1,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Premium footwear and leather goods, designed locally and built to last.',
            style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.5),
          ),
          SizedBox(height: 20),
          _StoryCard(
            icon: Icons.verified_outlined,
            title: 'PREMIUM MATERIALS',
            subtitle: 'Full-grain leather and durable soles.',
          ),
          SizedBox(height: 12),
          _StoryCard(
            icon: Icons.place_outlined,
            title: 'MADE IN EGYPT',
            subtitle: 'Crafted by local artisans.',
          ),
        ],
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _StoryCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(border: Border.all(color: Colors.white24)),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white60, fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
