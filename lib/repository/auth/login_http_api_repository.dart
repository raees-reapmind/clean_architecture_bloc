import 'package:flutter_dotenv/flutter_dotenv.dart'; 
import 'package:navigations_routing/Network%20API%20Services/api_endpoints.dart';
import 'package:navigations_routing/repository/auth/login_repository.dart';
import 'package:navigations_routing/user_model_and_login_api/models/user/user_model.dart';

import '../../Network API Services/api_services.dart';

class LoginHttpRepository implements LoginRepository{
  final _apiService = ApiServices(); 

  @override
  Future<UserModel> login(dynamic data) async {
    print('[login-test] Login data: $data');
    final response = await _apiService.postApi(ApiEndpoints.loginApi, data, 
        headers: {
          'x-api-key' : dotenv.env['LOGIN_API_KEY'] ?? '',
        }
        );
    print('[login-test] Login response: $response');
    return UserModel.fromJson(response);
  }
}