
import 'package:flutter/material.dart'; 
import '../../config/color/colors.dart';
import '../../config/reusable_components/custom_button.dart';
import '../../config/reusable_components/loader.dart';
import '../../config/routes/routes_names.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const LoaderWidget(color: ColorsPallete.yellow),
               CustomButton(
                title: 'Home screen', 
                buttonColor: ColorsPallete.purple,
                titleColor: ColorsPallete.white,
                onPressed: () {
                     Navigator.pushNamedAndRemoveUntil(context, RoutesNames.splashScreen, (route) => false);
                },
              ),
              TextButton(onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, RoutesNames.splashScreen, (route) => false);
              }, child: const Text('Home Screen')),
            ],
          ),
        ),
      ),
    );
  }
}