import 'package:flutter/material.dart';

import '../../../../core/utils/colors/app_color.dart';

class Preferences extends StatelessWidget {
  final VoidCallback? onTap;
  final String label;
  final bool isSelected;

  const Preferences({
    super.key,
    this.onTap,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        label: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        backgroundColor: AppColor.blue4,
        side: isSelected
            ? const BorderSide(
                color: AppColor.blue1,
                width: 2,
              )
            : BorderSide(color: AppColor.pink2.withOpacity(0.37)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
      ),
    );
  }
}
