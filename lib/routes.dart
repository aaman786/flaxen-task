import 'package:auth_flaxen/home/home_page.dart';
import 'package:flutter/material.dart';

import 'login/login_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const LoginScreen());

    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const HomeScreen());

    // case SearchServiceScreen.routeName:
    //   final List<ServiceModel> services =
    //       routeSettings.arguments as List<ServiceModel>;
    //   return MaterialPageRoute(
    //       settings: routeSettings,
    //       builder: (_) => SearchServiceScreen(services: services));

    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
              body: Center(child: Text("Screen does not exist!..."))));
  }
}
