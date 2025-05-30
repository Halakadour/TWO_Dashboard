//import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../error/handling_exception_request.dart';

typedef FromJson<T> = T Function(String body);

class GetWithTokenApi<T> with HandlingExceptionRequest {
  final Uri uri;
  final String token;
  final FromJson fromJson;
  final Map? body;
  final bool getFCMToken;

  GetWithTokenApi({
    required this.uri,
    required this.token,
    required this.fromJson,
    this.body = const {},
    this.getFCMToken = false,
  });

  Future<T> callRequest() async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var request = http.Request('GET', uri);
      //request.body = jsonEncode(body);
      request.headers.addAll(headers);
      http.StreamedResponse streamedResponse =
          await request.send().timeout(const Duration(seconds: 20));
      http.Response response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200) {
        return fromJson(response.body);
      } else {
        Exception exception = getException(response: response);
        throw exception;
      }
    } on HttpException {
      rethrow;
    } on FormatException {
      rethrow;
    } on SocketException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
