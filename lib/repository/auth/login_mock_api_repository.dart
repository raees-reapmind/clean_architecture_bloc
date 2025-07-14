 
import 'package:navigations_routing/repository/auth/login_repository.dart';
import 'package:navigations_routing/user_model_and_login_api/models/user/user_model.dart'; 

class LoginMockRepository implements LoginRepository { 

  Future<UserModel> login(dynamic data) async { 
    print('Mock Login data: $data');
    await Future.delayed(const Duration(seconds: 2));  
    final response = {
      "token": "tokenxyz"
    };
    return UserModel.fromJson(response);
  }
}