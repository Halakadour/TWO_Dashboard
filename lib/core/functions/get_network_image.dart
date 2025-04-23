import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:two_dashboard/config/constants/base_uri.dart';

Future<String?> fetchImage(String filename) async {
  final response = await http.post(
    Uri.parse('$baseUri/api/get/image?filename=$filename'),
  );

  if (response.statusCode == 200) {
    return base64Encode(response.bodyBytes);
  }
  return null;
}
