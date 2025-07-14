import 'dart:convert';

import 'package:navigations_routing/services/storage/local_storage.dart';
import 'package:navigations_routing/user_model_and_login_api/models/user/user_model.dart';

class SessionController{
  static final SessionController _session = SessionController._internal();

  final LocalStorage _localStorage = LocalStorage();
  UserModel _userModel = UserModel();
  bool isLogin = false;

  SessionController._internal(){
    isLogin = false;
  } 

  factory SessionController(){
    return _session;
  }

  Future<void> saveUserInPrederence(dynamic user) async {
    _localStorage.setValue('token', jsonEncode(user.toJson()));
    _localStorage.setValue('isLogin', 'true');
  }

  Future<void> getUserFromPreferece() async {
    try {
      var userData = await _localStorage.getValue('token');
      var isLogin = await _localStorage.getValue('isLogin');

      if(userData.isNotEmpty){
        SessionController()._userModel = UserModel.fromJson(jsonDecode(userData));
      }
        SessionController().isLogin = isLogin == 'true' ? true : false;

    } catch (e) {
      print("[shared-preference] Error getting user from preferences: $e");
    }
  } 

 }