import 'dart:convert';

import 'package:impaktfull_ui_figma_sync/src/model/figma_config.dart';
import 'package:http/http.dart' as http;

class FigmaApi {
  final FigmaConfig config;

  FigmaApi({
    required this.config,
  });

  Future<Map<String, dynamic>> get({
    required String path,
    Map<String, String>? queryParameters,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: 'api.figma.com',
      path: path,
      queryParameters: queryParameters,
    );
    final response = await http.get(
      uri,
      headers: {
        'X-Figma-Token': config.personalAccessToken,
      },
    );
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}
