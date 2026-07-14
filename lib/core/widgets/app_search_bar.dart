import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../extensions/context_extensions.dart';

/// The dark rounded search field shown in the top bar.
class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
    this.hintText = 'Search',
    this.onChanged,
    this.onSubmitted,
    this.controller,
  });

  final String hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      textInputAction: TextInputAction.search,
      style: context.text.bodyMedium?.copyWith(color: context.dashboard.panelText),
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: Icon(
          Icons.search_rounded,
          color: context.dashboard.panelTextMuted,
          size: 22,
        ),
        constraints: const BoxConstraints(minHeight: 48),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
      ),
    );
  }
}
