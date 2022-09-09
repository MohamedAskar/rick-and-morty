import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/repository/character_services.dart';

final charachterProvider = ChangeNotifierProvider((ref) => CharachterViewModel());

class CharachterViewModel extends ChangeNotifier {
  Future getCharachter() async {
    final response = await CharachterServices.getCharachter();
  }
}
