import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/utils/colors/app_color.dart';

class BlurredCircleShape extends StatelessWidget {
  const BlurredCircleShape({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(
        sigmaX: 150,
        sigmaY: 150,
        tileMode: TileMode.decal,
      ),
      child: CircleAvatar(
        backgroundColor: AppColor.blue1.withOpacity(0.8),
        radius: 120,
      ),
    );
  }
}