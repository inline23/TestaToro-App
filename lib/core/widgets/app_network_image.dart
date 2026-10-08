import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:testa_toro/core/utils/app_colors.dart';

/// Reusable cached network image with placeholder / error states.
class AppNetworkImage extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  final BoxFit fit;

  /// Decode the image at a smaller size to save memory (e.g. 600 for cards).
  final int? memCacheWidth;

  const AppNetworkImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.memCacheWidth,
  });

  Widget _box(Widget child) {
    return Container(
      width: width,
      height: height,
      color: AppColors.secondary,
      alignment: Alignment.center,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = url;

    if (imageUrl == null || imageUrl.isEmpty) {
      return _box(const Icon(Icons.image_outlined, color: Colors.black38));
    }

    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      memCacheWidth: memCacheWidth,
      fadeInDuration: const Duration(milliseconds: 200),
      placeholder: (_, __) => _box(
        const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
      errorWidget: (_, __, ___) => _box(
        const Icon(Icons.broken_image_outlined, color: Colors.black38),
      ),
    );
  }
}
