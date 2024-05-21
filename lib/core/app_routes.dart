import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/presentation/screens/subscription_first_step_screen.dart';
import 'utils/constants/routes.dart';

abstract class AppRoutes {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final configuration = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.subscriptionFirstStep,
    routes: [
      GoRoute(
        path: Routes.subscriptionFirstStep,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          key: state.pageKey,
          child: const SubscriptionFirstStepScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.linear).animate(animation),
              child: child,
            );
          },
        ),
      ),
    ],
  );
}
