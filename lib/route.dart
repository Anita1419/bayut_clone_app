import 'package:bayut_clone_app/bottom_navigation_pages/searchpage_widgets/filtersSheets/Allfilters/AllfilterPage.dart';
import 'package:bayut_clone_app/screens/SigningScreens/emailSignUpscreen.dart';
import 'package:bayut_clone_app/screens/homescreen.dart';
import 'package:bayut_clone_app/screens/SigningScreens/onboardingscreen.dart';
import 'package:bayut_clone_app/screens/SigningScreens/signup_screen.dart';
import 'package:bayut_clone_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'constants/route_constants.dart';

class AppRouter {
  static Route<MaterialPageRoute> onNavigate(RouteSettings settings) {
    late final Widget selectedPage;

    switch (settings.name) {
      case signupScreen:
        selectedPage = const SignUpScreen();
        break;
      case homeScreen:
        selectedPage = const HomeScreen();
        break;

      case onboardingScreen:
        selectedPage = const OnBoradingScreen();
        break;
      case allFiltersPage:
        selectedPage = const AllFilterPage();
        break;
      case emailSignUpScreen:
        selectedPage = const EmailSignUpScreen();
        break;

      default:
        selectedPage = const SplashScreen();
        break;
    }

    return MaterialPageRoute(builder: (context) => selectedPage);
  }
}
