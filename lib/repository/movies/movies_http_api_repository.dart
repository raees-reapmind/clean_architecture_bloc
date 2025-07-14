import 'dart:async';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart'; 
import 'package:navigations_routing/Network%20API%20Services/api_endpoints.dart';
import 'package:navigations_routing/app_exceptions_handle/exceptions/app_exceptions.dart';
import 'package:navigations_routing/movies_model_with_freezed/models/movies/movies.dart';
import 'package:navigations_routing/repository/auth/login_repository.dart';
import 'package:navigations_routing/repository/movies/movies_repository.dart';
import 'package:navigations_routing/user_model_and_login_api/models/user/user_model.dart';

import '../../Network API Services/api_services.dart';

class MoviesHttpRepository implements MoviesRepository{
  final _apiService = ApiServices(); 

  @override
  Future<MoviesModel> fetchMovies() async {
    try {
      print('[movies-test] Fetching movies...');
      final response = await _apiService.getApi(ApiEndpoints.moviesApi);
      print('[movies-test] Movies response: $response');
      return MoviesModel.fromJson(response);
    } on SocketException {
      throw NoInternetException('No internet connection');
    } on TimeoutException {
      throw fetchDataException('Request Timeout');
    } catch (e) {
      print('[movies-test] Error fetching movies: $e');
      rethrow;
    }
  }

}