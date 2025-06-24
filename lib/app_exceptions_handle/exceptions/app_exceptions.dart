import 'dart:core';

class AppException implements Exception {

    final String? _message;
    final String? _prefix;

    AppException([this._message,this._prefix]);

    @override
    String toString() {
        return "${_prefix ?? ''}${_message ?? ''}";
    }

}

class NoInternetException extends AppException {
    NoInternetException([String? message]) : super(message, "No Internet Connection");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message]) : super(message, "Unauthorised Requrest");
}

class fetchDataException extends AppException {
  fetchDataException([String? message]) : super(message, "Error During Communication");
}
class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "Invalid Request");
}
class ResourceNotFoundException extends AppException {
  ResourceNotFoundException([String? message]) : super(message, "Resource Not Found");
}
class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input");
}
class ServerException extends AppException {
  ServerException([String? message]) : super(message, "Server Error");
}
