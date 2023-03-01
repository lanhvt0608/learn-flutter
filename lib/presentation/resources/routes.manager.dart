// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:section2/app/di.dart';
import 'package:section2/presentation/forgot_password/forgot_password.dart';
import 'package:section2/presentation/login/login.dart';
import 'package:section2/presentation/main/main_view.dart';
import 'package:section2/presentation/resources/strings_manager.dart';
import 'package:section2/presentation/store_details/store_details.dart';

import '../onboarding/onboarding.dart';
import '../register/register.dart';
import '../splash/splash.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailRoute = "/storeDetail";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => MainView());
      case Routes.storeDetailRoute:
        return MaterialPageRoute(builder: (_) => StoreDetailsView());
      default:
        return UnDefinedRoute();
    }
  }

  static Route<dynamic> UnDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.noRouteFound),
        ),
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
