import 'package:flutter/material.dart';

import '../core/constants/colors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final bool isLoading;

  const AppButton({
    Key? key,
    this.onPressed,
    required this.label,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? const CircularProgressIndicator()
          : Center(
              child: Text(
                label,
                style: const TextStyle(
                  color: AppColors.light,
                ),
              ),
            ),
    );
  }
}

class AppButton1 extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final bool isLoading;

  const AppButton1({
    Key? key,
    this.onPressed,
    required this.label,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: const Color(0xFF4F3EF),
          side: const BorderSide(width: 3, color: Colors.white24)),
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? const CircularProgressIndicator()
          : Center(
              child: Text(
                label,
                style: const TextStyle(
                  color: AppColors.light,
                ),
              ),
            ),
    );
  }
}
