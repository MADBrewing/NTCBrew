import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ntcbrew/network/const.dart';
import 'dart:convert';

import 'package:ntcbrew/network/exceptions/NetworkException.dart';

Future<dynamic> get(String url, {Map<String, String>? headers}) async {
  try {
    final response = await http.get(Uri.parse("${Constants.url}$url"), headers: headers);
    return decodeResponse(response);
  } on SocketException {
    throw FetchDataException('No Internet connection');
  }
}

Future<dynamic> post(String url, {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
  try {
    final response = await http.post(Uri.parse("${Constants.url}$url"), headers: headers, body: body, encoding: encoding);
    return decodeResponse(response);
  } on SocketException {
    throw FetchDataException('No Internet connection');
  }
}

Future<dynamic> delete(String url, {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
  try {
    final response = await http.delete(Uri.parse("${Constants.url}$url"), headers: headers, body: body, encoding: encoding);
    return decodeResponse(response);
  } on SocketException {
    throw FetchDataException('No Internet connection');
  }
}

dynamic decodeResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = jsonDecode(response.body);
      print(responseJson);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          '${response.request?.url ?? "---"} -> Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
  }
}