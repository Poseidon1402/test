import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../shared/components/buttons/custom_elevated_button.dart';
import '../../../../shared/components/input/custom_text_form_field.dart';
import '../../../../shared/components/shape/blurred_circle_shape.dart';

class SubscriptionSecondStepScreen extends StatelessWidget {
  const SubscriptionSecondStepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: const [
          Icon(
            Icons.info,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Stack(
          children: [
            const Positioned(
              top: -50,
              left: -50,
              child: BlurredCircleShape(),
            ),
            const Positioned(
              bottom: -50,
              right: -50,
              child: BlurredCircleShape(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Gap(70),
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset('assets/logo/logo.png'),
                  ),
                  const Gap(10),
                  Align(
                    alignment: Alignment.topRight,
                    child: FractionallySizedBox(
                      widthFactor: 0.7,
                      child: Text(
                        'Créer un compte sur SoldOut',
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  const Gap(5),
                  Align(
                    alignment: Alignment.topRight,
                    child: FractionallySizedBox(
                      widthFactor: 0.7,
                      child: Text(
                        'Veuillez tapez le code de confirmation envoyé à votre email',
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  const Gap(25),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CustomTextFormField(
                          label: 'Code de Confirmation',
                          backgroundColor: Colors.transparent,
                          borderRadius: 0,
                          prefixIcon: Icon(
                            Icons.email,
                            color: AppColor.white1,
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor: 0.4,
                          child: CustomElevatedButton(
                            onPressed: () {},
                            borderRadius: 35,
                            child: Text(
                              'Confirmer',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColor.green1,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  Expanded(
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Vous avez déjà un compte ? ',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            TextSpan(
                              text: 'Se connecter ',
                              style:
                                  Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: AppColor.blue1,
                                      ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
