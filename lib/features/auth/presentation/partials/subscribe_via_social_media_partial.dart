import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../shared/components/buttons/custom_elevated_button.dart';

class SubscribeViaSocialMediaPartial extends StatelessWidget {
  const SubscribeViaSocialMediaPartial({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 20,
      children: [
        CustomElevatedButton(
          onPressed: () {},
          verticalPadding: 20,
          backgroundColor: AppColor.white1.withOpacity(0.07),
          child: SvgPicture.asset('assets/icons/gmail.svg'),
        ),
        CustomElevatedButton(
          onPressed: () {},
          backgroundColor: AppColor.white1.withOpacity(0.07),
          child: SvgPicture.asset('assets/icons/facebook.svg'),
        ),
        CustomElevatedButton(
          onPressed: () {},
          backgroundColor: AppColor.white1.withOpacity(0.07),
          child: SvgPicture.asset('assets/icons/insta.svg'),
        ),
        CustomElevatedButton(
          onPressed: () {},
          backgroundColor: AppColor.white1.withOpacity(0.07),
          child: SvgPicture.asset('assets/icons/linkedin.svg'),
        ),
        CustomElevatedButton(
          onPressed: () {},
          backgroundColor: AppColor.white1.withOpacity(0.07),
          child: SvgPicture.asset('assets/icons/tiktok.svg'),
        ),
      ],
    );
  }
}