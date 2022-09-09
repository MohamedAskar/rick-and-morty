import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty/utils/constants.dart';

class CharachterServices {
  static Future<void> getCharachter() async {
    try {
      final response = await http.get(Uri.parse(CHARACTER_URL));
      if (response.statusCode == SUCCESS) {
        log(response.body);
      } else {
        log(response.statusCode.toString());
      }
    } on HttpException {
      rethrow;
    }
  }
}
