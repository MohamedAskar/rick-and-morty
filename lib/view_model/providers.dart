import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/view_model/character_view_model.dart';

final charachterProvider =
    ChangeNotifierProvider((ref) => CharachterViewModel(ref: ref));

final filterProvider = StateProvider<Map<String, String?>>(
    (ref) => {'Gender': null, 'Status': null});
