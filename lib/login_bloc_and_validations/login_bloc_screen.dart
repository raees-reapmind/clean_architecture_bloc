
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigations_routing/Utils/flush_bar_helper.dart';
import 'package:navigations_routing/config/routes/routes_names.dart'; 
import 'package:navigations_routing/login_bloc_and_validations/widgets/textfield_widgets.dart';
import 'package:navigations_routing/main.dart';
import 'package:navigations_routing/repository/auth/login_repository.dart';

import '../../../config/color/colors.dart';
import '../../../config/reusable_components/custom_button.dart'; 
import '../Utils/enums.dart';
import '../login_ui_and_code_refactor/login_bloc.dart';

class LoginBlocScreen extends StatefulWidget {
  const LoginBlocScreen({super.key});


  @override
State<LoginBlocScreen> createState() => _LoginBlocScreenState();
}

class _LoginBlocScreenState extends State<LoginBlocScreen> {

late LoginBloc _loginBloc;
 
final emailFocusNode = FocusNode();
final passwordFocusNode = FocusNode(); 
final _formKey = GlobalKey<FormState>(); 


@override
void initState() {
  super.initState();
  _loginBloc = LoginBloc(loginRepository: getIt());
}
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Login Bloc Screen'),
      backgroundColor: ColorsPallete.blue,
      foregroundColor: ColorsPallete.white,
    ),
    body: BlocListener<LoginBloc, LoginStates>(
    listenWhen: (previous, current) =>
        previous.postApiStatus != current.postApiStatus,
    listener: (cntxt, state) {
      if (state.postApiStatus == PostApiStatus.error) {
        FlushBarHelper.showFlushBar(context: context, message: state.message, backgroundColor: ColorsPallete.red, icon: Icons.error, margin: const EdgeInsets.all(10.0), padding: EdgeInsets.all(15.0), borderRadius: BorderRadius.circular(8.0));
      } else if (state.postApiStatus == PostApiStatus.loading) {
        FlushBarHelper.showFlushBar(context: context, message: 'Validating...', backgroundColor: ColorsPallete.yellow, margin: const EdgeInsets.all(10.0), padding: EdgeInsets.all(15.0), borderRadius: BorderRadius.circular(8.0));
      } else if (state.postApiStatus == PostApiStatus.success) {
        Navigator.pushNamed(context, RoutesNames.homeScreen);
        FlushBarHelper.showFlushBar(context: context, message: 'Login Successful', backgroundColor: ColorsPallete.green, icon: Icons.check, margin: const EdgeInsets.all(10.0), padding: EdgeInsets.all(15.0), borderRadius: BorderRadius.circular(8.0));
      }
    },
      child: BlocBuilder<LoginBloc, LoginStates>(
        buildWhen: (previous, current) =>
            previous.postApiStatus != current.postApiStatus,
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EmailInputField(emailFocusNode: emailFocusNode),
                  const SizedBox(height: 20),
                  PasswordInputField(passwordFocusNode: passwordFocusNode),
                  const SizedBox(height: 20),
                  CustomButton(
                    title: 'Login',
                    isApiCalling: state.postApiStatus == PostApiStatus.loading,
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        context.read<LoginBloc>().add(LoginApi());
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}

}