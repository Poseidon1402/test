import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../core/utils/constants/routes.dart';
import '../../../../shared/components/buttons/custom_elevated_button.dart';
import '../../../../shared/components/shape/blurred_circle_shape.dart';

class SubscriptionThirdStepScreen extends StatelessWidget {
  const SubscriptionThirdStepScreen({super.key});

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
                        'Finaliser la création du compte sur SoldOut',
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  const Gap(5),
                  Align(
                    alignment: Alignment.topRight,
                    child: FractionallySizedBox(
                      widthFactor: 0.6,
                      child: Text(
                        'Veuillez choisir votre type d\'évènement préféré',
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
                        FractionallySizedBox(
                          widthFactor: 0.4,
                          child: CustomElevatedButton(
                            onPressed: () => context.push(Routes.subscriptionThirdStep),
                            borderRadius: 35,
                            child: Text(
                              'Enregistrer',
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