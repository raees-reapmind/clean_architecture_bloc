import 'package:navigations_routing/user_model_and_login_api/models/user/user_model.dart';

abstract class LoginRepository {  
  Future<UserModel> login(dynamic data);
}