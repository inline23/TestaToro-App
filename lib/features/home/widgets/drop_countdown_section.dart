import 'dart:async';

import 'package:flutter/material.dart';
import 'package:testa_toro/core/utils/app_colors.dart';

class DropCountdownSection extends StatefulWidget {
  final DateTime dropDate;

  const DropCountdownSection({super.key, required this.dropDate});

  @override
  State<DropCountdownSection> createState() => _DropCountdownSectionState();
}

class _DropCountdownSectionState extends State<DropCountdownSection> {
  late final Timer _timer;
  late Duration _remaining;

  @override
  void initState() {
    super.initState();
    _remaining = _calculateRemaining();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _remaining = _calculateRemaining());
    });
  }

  Duration _calculateRemaining() {
    final diff = widget.dropDate.difference(DateTime.now());
    return diff.isNegative ? Duration.zero : diff;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'NEXT DROP · LIMITED',
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'MIDNIGHT VAULT: THE BULL DERBY 01',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 20,
                height: 1.1,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _TimeBox(value: _remaining.inDays, label: 'DAYS'),
                _TimeBox(value: _remaining.inHours.remainder(24), label: 'HRS'),
                _TimeBox(
                  value: _remaining.inMinutes.remainder(60),
                  label: 'MIN',
                ),
                _TimeBox(
                  value: _remaining.inSeconds.remainder(60),
                  label: 'SEC',
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: const RoundedRectangleBorder(),
                ),
                child: const Text(
                  'NOTIFY ME',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimeBox extends StatelessWidget {
  final int value;
  final String label;

  const _TimeBox({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 6),
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: AppColors.secondary,
        child: Column(
          children: [
            Text(
              value.toString().padLeft(2, '0'),
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
