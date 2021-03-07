import 'package:http/http.dart';

class ApiResponse<T> {
  Status status;
  Response? rawResponse;
  T? data;
  NetworkError? error;

  ApiResponse.complete(this.rawResponse, this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.rawResponse, this.error) : status = Status.ERROR;
}

class NetworkError{
  String? message;
  int? code;
  NetworkError(this.message, this.code);
}

enum Status { COMPLETED, ERROR }