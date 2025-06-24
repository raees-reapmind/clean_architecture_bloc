
import 'package:flutter/material.dart';
import 'package:navigations_routing/Network%20API%20Services/api_endpoints.dart';
import 'package:navigations_routing/Network%20API%20Services/api_services.dart';
import 'package:navigations_routing/app_exceptions_handle/exceptions/app_exceptions.dart';
import 'package:navigations_routing/config/color/colors.dart';
import 'package:navigations_routing/config/reusable_components/custom_button.dart';
import 'package:navigations_routing/config/reusable_components/internet_checker.dart';
import 'package:navigations_routing/config/reusable_components/loader.dart';
import 'package:navigations_routing/config/routes/routes_names.dart';

import '../../user_model_and_login_api/models/user/user_model.dart';

class ExceptionScreenTest extends StatefulWidget {
  const ExceptionScreenTest({super.key});


  @override
State<ExceptionScreenTest> createState() => _ExceptionScreenTestState();
}

class _ExceptionScreenTestState extends State<ExceptionScreenTest> {
  @override
  Widget build(BuildContext context) {
    ApiServices().getApi(ApiEndpoints.fetchApi);
    UserModel userModel = UserModel(); 
    return Scaffold(
      floatingActionButton: FloatingActionButton( 
        onPressed: () {
          throw NoInternetException(" Net Chalu Kr be!");
        },
        backgroundColor: ColorsPallete.red,
      ),
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