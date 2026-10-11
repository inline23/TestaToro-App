import 'package:flutter/material.dart';
import 'package:testa_toro/core/utils/app_colors.dart';

/// PLACEHOLDER: replace with the real Profile screen when it exists.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(title: const Text('Profile')),
      body: const Center(child: Text('Profile coming soon')),
    );
  }
}
