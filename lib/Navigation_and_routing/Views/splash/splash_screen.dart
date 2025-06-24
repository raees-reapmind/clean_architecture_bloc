
import 'package:flutter/material.dart';
import 'package:navigations_routing/config/color/colors.dart';
import 'package:navigations_routing/config/reusable_components/custom_button.dart';
import 'package:navigations_routing/config/reusable_components/internet_checker.dart';
import 'package:navigations_routing/config/reusable_components/loader.dart';
import 'package:navigations_routing/config/routes/routes_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const LoaderWidget(color: ColorsPallete.red),
              const InternetChecker(),
                CustomButton(
                title: 'splash screen', 
                buttonColor: ColorsPallete.green,
                titleColor: ColorsPallete.white,
                onPressed: () {
                     Navigator.pushNamed(context, RoutesNames.loginScreen);
                },
              ),
              TextButton(onPressed: () {
                Navigator.pushNamed(context, RoutesNames.loginScreen);
              }, child: const Text('Splash Screen')),
            ],
          ),
        ),
      ),
    );
  }
}