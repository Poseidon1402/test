import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../core/utils/constants/routes.dart';
import '../../../../shared/components/buttons/custom_elevated_button.dart';
import '../../../../shared/components/input/custom_text_form_field.dart';

class FirstStepBody extends StatelessWidget {
  const FirstStepBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextFormField(
          label: 'Adresse email',
          backgroundColor: Colors.transparent,
          borderRadius: 0,
          prefixIcon: Icon(
            Icons.email,
            color: AppColor.white1,
          ),
        ),
        const Gap(20),
        const CustomTextFormField(
          label: 'Téléphone',
          backgroundColor: Colors.transparent,
          borderRadius: 0,
          prefixIcon: Icon(
            Icons.phone,
            color: AppColor.white1,
          ),
        ),
        const Gap(20),
        const CustomTextFormField(
          label: 'Nom de l\'utilisateur',
          backgroundColor: Colors.transparent,
          borderRadius: 0,
          prefixIcon: Icon(
            Icons.person,
            color: AppColor.white1,
          ),
        ),
        const Gap(20),
        const CustomTextFormField(
          label: 'Mot de passe',
          backgroundColor: Colors.transparent,
          borderRadius: 0,
          prefixIcon: Icon(
            Icons.lock,
            color: AppColor.white1,
          ),
          suffixIcon: Icon(
            Icons.remove_red_eye,
            color: AppColor.white1,
          ),
        ),
        const Gap(20),
        const CustomTextFormField(
          label: 'Confirmer le Mot de passe',
          backgroundColor: Colors.transparent,
          borderRadius: 0,
          // validator: (value) => isTheSamePassword(),
          prefixIcon: Icon(
            Icons.lock,
            color: AppColor.white1,
          ),
          suffixIcon: Icon(
            Icons.remove_red_eye,
            color: AppColor.white1,
          ),
        ),
        const Gap(20),
        const CustomTextFormField(
          label: 'ID Parrain',
          backgroundColor: Colors.transparent,
          borderRadius: 0,
          prefixIcon: Icon(
            Icons.person,
            color: AppColor.white1,
          ),
        ),
        const Gap(30),
        FractionallySizedBox(
          widthFactor: 0.4,
          child: CustomElevatedButton(
            onPressed: () => context.push(Routes.subscriptionSecondStep),
            borderRadius: 35,
            child: Text(
              'S\'inscrire',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColor.green1,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}