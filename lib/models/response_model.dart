import 'package:rick_and_morty/models/charachter.dart';
import 'package:rick_and_morty/models/info.dart';



class ResponseModel {
  final Info info;
  final List<Character> charachters;

  ResponseModel({
    required this.info,
    required this.charachters,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        info: Info.fromJson(json["info"]),
        charachters: List<Character>.from(
            json["results"].map((x) => Character.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(charachters.map((x) => x.toJson())),
      };
}
