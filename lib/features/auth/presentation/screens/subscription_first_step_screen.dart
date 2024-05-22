import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/colors/app_color.dart';
import '../../../../shared/components/shape/blurred_circle_shape.dart';
import '../partials/first_step_form.dart';
import '../partials/subscribe_via_social_media_partial.dart';

class SubscriptionFirstStepScreen extends StatelessWidget {
  const SubscriptionFirstStepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
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
            const Positioned(top: -50, left: -50, child: BlurredCircleShape()),
            const Positioned(
                bottom: -50, right: -50, child: BlurredCircleShape()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
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
                        'Veuillez remplir les formulaires',
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  const Gap(25),
                  const FirstStepForm(),
                  const Gap(70),
                  FractionallySizedBox(
                    widthFactor: 0.9,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 2,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColor.blue3.withOpacity(0),
                                  AppColor.blue1,
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'S\'inscrire via les réseaux sociaux',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: AppColor.blue2),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 2,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColor.blue1,
                                  AppColor.blue3.withOpacity(0),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  const SubscribeViaSocialMediaPartial(),
                  const Gap(20),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Vous avez déjà un compte ? ',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: 'Se connecter ',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColor.blue1,
                          ),
                        ),
                      ]
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
