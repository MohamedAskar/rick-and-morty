import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty/models/api_status_models.dart';
import 'package:rick_and_morty/models/response_model.dart';
import 'package:rick_and_morty/utils/constants.dart';

class CharachterServices {
  static Future<Object> getCharachter(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      log(response.request!.url.toString());
      if (response.statusCode == SUCCESS) {
        final results = Success(
            code: response.statusCode,
            data: ResponseModel.fromJson(jsonDecode(response.body)));
        return results;
      } else {
        return Failure(code: response.statusCode, message: response.body);
      }
    } on HttpException {
      rethrow;
    }
  }
}
