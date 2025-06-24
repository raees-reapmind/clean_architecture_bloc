part of 'login_bloc.dart';

abstract class LoginEvents extends Equatable {
  const LoginEvents();

  @override
  List<Object?> get props => [];
}

class EmailChanged extends LoginEvents {
  final String email;

  const EmailChanged({required this.email});

  @override
  List<Object?> get props => [email];
}

class PasswordChanged extends LoginEvents {
  final String passWord;
  const PasswordChanged({required this.passWord});

  @override
  List<Object?> get props => [passWord];
}


class EmailUnfocused extends LoginEvents{}

class PasswordUnfocused extends LoginEvents{}

class LoginSumbmit extends LoginEvents {}

class LoginApi extends LoginEvents {}