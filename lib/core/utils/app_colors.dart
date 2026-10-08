import 'package:flutter/material.dart';
import 'package:testa_toro/core/utils/constants.dart';

/// Converts the hex strings in constants.dart into real [Color]s.
class AppColors {
  AppColors._();

  static Color fromHex(String hex) {
    final value = hex.replaceFirst('#', '');
    return Color(int.parse('FF$value', radix: 16));
  }

  static final Color bg = fromHex(bgColor);
  static final Color secondary = fromHex(secondaryColor);
  static final Color primary = fromHex(primaryColor);
}
