import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie/data/core/api_constants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  Future<dynamic> get(String path, {Map<dynamic, dynamic>? params}) async {
    final response = await _client.get(
      Uri.parse(_getPath(path, params)),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  String _getPath(String path, Map<dynamic, dynamic>? params) {
    var paramsString = '';
    if (params?.isNotEmpty ?? false) {
      params?.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }

    return '${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}$paramsString';
  }
}