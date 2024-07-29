import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl =
        'https://api.openai.com/v1/engines/davinci-codex/completations';
    _dio.options.headers['Authorizarization'] =
        'Bearer ${dotenv.env['OPENAI_API_KEY']}';
    _dio.options.headers['Content-Type'] = 'application/json';
  }

  Future<String> getChatGptResponse(String prompt) async {
    try {
      final response = await _dio.post(
        '',
        data: {
          'prompt': prompt,
          'max_tokens': 100,
        },
      );
      return response.data['choices'][0]['text'];
    } on DioException catch (dioException) {
      log('Error: $dioException');
      return 'Error to get response';
    }
  }
}
