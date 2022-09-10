import 'package:rick_and_morty/models/response_model.dart';

class Success {
  final int code;
  final ResponseModel data;

  Success({required this.code, required this.data});
}

class Failure {
  final int code;
  final String message;

  Failure({required this.code, required this.message});
}
