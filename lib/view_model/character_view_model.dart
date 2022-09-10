import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/models/api_status_models.dart';
import 'package:rick_and_morty/models/charachter.dart';
import 'package:rick_and_morty/models/info.dart';
import 'package:rick_and_morty/repository/character_services.dart';
import 'package:rick_and_morty/utils/constants.dart';

final charachterProvider =
    ChangeNotifierProvider((ref) => CharachterViewModel());

class CharachterViewModel extends ChangeNotifier {
  Info? _info;
  final List<Character> _charachter = [];
  String? _error;
  bool _isLoading = false;

  Info? get info => _info;
  List<Character> get charachter => _charachter;
  String? get error => _error;
  bool get isLoading => _isLoading;

  CharachterViewModel() {
    getCharachter();
  }

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future getCharachter(
      {String? gender, String? status, bool isRefresh = true}) async {
    if (isRefresh) {
      setLoading(true);
    }
    String url = (info != null && !isRefresh)
        ? info!.next!
        : setUrl(gender: gender, status: status);

    final response = await CharachterServices.getCharachter(url);
    if (response is Success) {
      _info = response.data.info;
      _charachter.addAll(response.data.charachters);
    }
    if (response is Failure) {
      _error = response.message;
    }

    setLoading(false);
  }

  String setUrl({String? gender, String? status}) {
    String url = CHARACTER_PAGE_URL;
    if (gender != null) {
      url += '&gender=$gender';
    }
    if (status != null) {
      url += '&status=$status';
    }
    return url;
  }
}
