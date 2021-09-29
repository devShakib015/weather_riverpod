import 'dart:io';

import 'package:http/http.dart' as http;

class NetworkHelper {
  static Future<http.Response> getData(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      return response;
    } on SocketException {
      throw 'No Internet Connection';
    }
  }
}
