import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigations_routing/Utils/validations.dart';

import '../../login_ui_and_code_refactor/login_bloc.dart';

class EmailInputField extends StatelessWidget {
  final FocusNode emailFocusNode;
  final String? Function(String?)? validator;

  EmailInputField({
    Key? key,
    required this.emailFocusNode,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) { 

    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen:(previous, current) => previous.email != current.email,
      builder: (context, state) { 

      return TextFormField(
        focusNode: emailFocusNode,
        decoration: const InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          context.read<LoginBloc>().add(EmailChanged(email: value));
        },
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }

          if(Validations.isValidEmail(value) == false) {
            return 'Please enter a valid email address';
          }
          return null;
        },
      );
    });
  }
}

class PasswordInputField extends StatelessWidget {
  final FocusNode passwordFocusNode;
  final String? Function(String?)? validator;

  PasswordInputField({
    Key? key,
    required this.passwordFocusNode,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<LoginBloc, LoginStates>(
      buildWhen:(previous, current) => previous.password != current.password,

      builder: (context, state) {
        print('[password-input-field] password: ${state.password}');
      return TextFormField(
        focusNode: passwordFocusNode,
        decoration: const InputDecoration(
          labelText: 'Password',
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          context.read<LoginBloc>().add(PasswordChanged(passWord: value));
        },
        keyboardType: TextInputType.visiblePassword,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          if( value.length < 6) {
            return 'Password must be at least 6 characters long';
          }
          return null;
        },
      );
    });
  }
}
