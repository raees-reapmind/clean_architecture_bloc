import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:navigations_routing/Network%20API%20Services/base_api_services.dart';
import 'package:http/http.dart' as http;
import 'package:navigations_routing/app_exceptions_handle/exceptions/app_exceptions.dart';

class ApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    log('getApi called with URL: $url');
    dynamic jsonResponse;

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'User-Agent': 'FlutterApp/1.0',
        },
      ).timeout(const Duration(seconds: 50));

      log('Response: ${response.body}');

      jsonResponse = returnResponse(response);
    } catch (e) {
      log('getApi e: $e'); 
      throw fetchDataException('An unexpected error occurred: $e');
    }

    return jsonResponse;
  }

  @override
  Future<dynamic> postApi(String url, data, {Map<String, String>? headers}) async {
    dynamic jsonResponse;

    if(kDebugMode) {
      log('postApi called with URL: $url');
      log('Data: $data');
      log('Headers: $headers');
    }

    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: data,
            headers: { 
            if (headers != null) ...headers,
          },
          )
          .timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);

      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetException('No internet connection');
    } on TimeoutException {
      throw fetchDataException('Request Timeout');
    }

    return jsonResponse;
  }

  @override
  Future<dynamic> delete(String url) async {}

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(jsonDecode(response.body).toString());
      case 401:
        throw UnauthorisedException(jsonDecode(response.body).toString());
      case 404:
        throw ResourceNotFoundException("Resource not found");
      case 500:
        throw ServerException("Internal Server Error");
      default:
        throw fetchDataException(
            "Unexpected status code: ${response.statusCode}");
    }
  }
}
