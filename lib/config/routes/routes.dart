import 'package:flutter/material.dart';
import 'package:navigations_routing/config/routes/routes_names.dart'; 
import '../../Navigation_and_routing/Views/view.dart'; 

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RoutesNames.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RoutesNames.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Center(
              child: TextButton(
                  onPressed: () {}, child: const Text('No Route generated')),
            ),
          );
        });
    }
  }
}
