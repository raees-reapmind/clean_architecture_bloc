import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:navigations_routing/Utils/enums.dart';
import 'package:navigations_routing/services/session_manager/session_controller.dart';

import '../repository/auth/login_repository.dart'; 

part 'login_event.dart';
part 'login_states.dart';


class LoginBloc extends Bloc<LoginEvents, LoginStates> {

   LoginRepository loginRepository  ;

  LoginBloc({required this.loginRepository}) : super( const LoginStates()) {
    on<EmailChanged> (_onEmailChanged);
    on<PasswordChanged> (_passwordChanged);
    on<EmailUnfocused> (_emailUnFocused);
    on<PasswordUnfocused> (_passwordUnFocused);
    on<LoginSumbmit> (_loginSubmit);
    on<LoginApi> (_loginApi);
  }

  FutureOr<void> _onEmailChanged(EmailChanged event, Emitter<LoginStates> emit) {
    print('[login-bloc] email changed: ${event.email}');
    emit(
      state.copywith(
        email: event.email
      )
    );
  }

  FutureOr<void> _passwordChanged(PasswordChanged event, Emitter<LoginStates> emit) {
    print('[login-bloc] password changed: ${event.passWord}');
    emit(
      state.copywith(
        password: event.passWord
      )
    );
  }

  FutureOr<void> _emailUnFocused(EmailUnfocused event, Emitter<LoginStates> emit) {
  }

  FutureOr<void> _passwordUnFocused(PasswordUnfocused event, Emitter<LoginStates> emit) {
  }

  FutureOr<void> _loginApi(LoginApi event, Emitter<LoginStates> emit) async { 

    Map data = {
      "email": state.email,
      "password": state.password
    };

    // Map data = { 
    // "email": "eve.holt@reqres.in",
    // "password": "cityslicka" 
    // };
    
    emit(
      state.copywith(postApiStatus: PostApiStatus.loading)
    );

   await loginRepository.login(data).then((value) async{
    if(value.error.isNotEmpty){ 
      emit(
        state.copywith(message: value.error, postApiStatus: PostApiStatus.error)
      );
    } else {
      await SessionController().saveUserInPrederence(value);
      emit(
        state.copywith(postApiStatus: PostApiStatus.success)
      );
    }
   }).onError((error, stackTrace) {
    emit(
        state.copywith(postApiStatus: PostApiStatus.error, message: error.toString())
    );
  });

  }

  FutureOr<void> _loginSubmit(LoginSumbmit event, Emitter<LoginStates> emit) async{ 

  }
}