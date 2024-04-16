import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:zoner/screens/auth/onboarding/basic_info_screen.dart';
import 'package:zoner/screens/auth/onboarding/doctor_patient_selector_screen.dart';
import 'package:zoner/screens/patient/discover/discover_screen.dart';

import '../screens/auth/onboarding/onboarding_screen.dart';
import '../screens/auth/register.dart';
import '../screens/auth/sign_in.dart';
import '../screens/patient/home/home_screen.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        path: "/",
        name: HomeScreen.id,
        builder: (BuildContext context, GoRouterState state) =>
            const HomeScreen(),
      ),

      ///------Onboarding and Auth-------///
      GoRoute(
        path: "/${OnboardingScreen.id}",
        name: OnboardingScreen.id,
        builder: (BuildContext context, GoRouterState state) =>
            const OnboardingScreen(),
        routes: <GoRoute>[
          GoRoute(
            path: SignInScreen.id,
            name: SignInScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const SignInScreen(),
          ),
          GoRoute(
            path: RegisterScreen.id,
            name: RegisterScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const RegisterScreen(),
          ),
          GoRoute(
            path: BasicInfoScreen.id,
            name: BasicInfoScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const BasicInfoScreen(),
          ),
          GoRoute(
            path: DoctorPatientSelectorScreen.id,
            name: DoctorPatientSelectorScreen.id,
            builder: (BuildContext context, GoRouterState state) =>
                const DoctorPatientSelectorScreen(),
          ),
        ],
      ),

      ///-------Patient Section--------///

      ///------ Discover-------///
      GoRoute(
        path: "patient/${DiscoverScreen.id}",
        name: DiscoverScreen.id,
        builder: (BuildContext context, GoRouterState state) =>
            const DiscoverScreen(),
      ),
    ],
  );
}
