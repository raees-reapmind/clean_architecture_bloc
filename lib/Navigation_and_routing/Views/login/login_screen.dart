
import 'package:flutter/material.dart';
import 'package:navigations_routing/config/reusable_components/loader.dart';

import '../../../config/color/colors.dart';
import '../../../config/reusable_components/custom_button.dart';
import '../../../config/routes/routes_names.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});


  @override
State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
            const LoaderWidget(color: ColorsPallete.blue),
              CustomButton(
                title: 'Login screen', 
                buttonColor: ColorsPallete.blue,
                titleColor: ColorsPallete.white,
                onPressed: () {
                     Navigator.pushNamed(context, RoutesNames.homeScreen);
                },
              ),
              TextButton(onPressed: () {
                Navigator.pushNamed(context, RoutesNames.homeScreen);
              
              }, child: const Text('Login Screen')),
            ],
          ),
        ),
      ),
    );
  }
}