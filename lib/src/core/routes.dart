import 'package:flutter/material.dart';

import '../features/authentication/views/login_screen.dart';
import '../features/authentication/views/signup_screen.dart';
import '../features/home/views/home_view.dart';
import '../features/startup/view/onboarding_screen.dart';
import '../features/startup/view/splash.dart';

class Routes {
  static const login = "/login";
  static const onboarding = "/onboarding";
  static const splash = "/";
  static const signup = "/signup";

  static const home = "/home";

  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreenView());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Text("No page defined for this route"),
          ),
        );
    }
  }
}
