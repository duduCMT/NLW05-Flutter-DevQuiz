import 'dart:convert';

class AwnserModel {
  final String titile;
  final bool isRight;

  AwnserModel({
    required this.titile,
    this.isRight = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'titile': titile,
      'isRight': isRight,
    };
  }

  factory AwnserModel.fromMap(Map<String, dynamic> map) {
    return AwnserModel(
      titile: map['titile'],
      isRight: map['isRight'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AwnserModel.fromJson(String source) => AwnserModel.fromMap(json.decode(source));
}
