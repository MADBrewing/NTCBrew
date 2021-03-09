import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ntcbrew/network/const.dart';
import 'dart:convert';

import 'package:ntcbrew/network/exceptions/NetworkException.dart';

Future<dynamic> get(String url, {Map<String, String>? headers}) async {
  return fetchData(() => http.get(Uri.parse("${Constants.url}$url"), headers: headers));
}

Future<dynamic> post(String url, {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
  return fetchData(() => http.post(Uri.parse("${Constants.url}$url"), headers: headers, body: body, encoding: encoding));
}

Future<dynamic> delete(String url, {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
  return fetchData(() => http.delete(Uri.parse("${Constants.url}$url"), headers: headers, body: body, encoding: encoding));
}

Future<dynamic> fetchData(Future<dynamic> Function() func) async {
  try {
    return func().then((value) => decodeResponse(value));
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
