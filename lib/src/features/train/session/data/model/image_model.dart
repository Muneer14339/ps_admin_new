

import 'dart:convert';

class ImageModel {
  final int lastScore;
  final String imagePath;

  ImageModel({
    required this.lastScore,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'lastScore': lastScore,
      'imagePath': imagePath,
    };
  }

  static ImageModel fromMap(Map<String, dynamic> map) {
    return ImageModel(
      lastScore: map['lastScore'],
      imagePath: map['imagePath'],
    );
  }

  static String listToJson(List<ImageModel> list) {
    return jsonEncode(list.map((model) => model.toMap()).toList());
  }

  static List<ImageModel> listFromJson(String json) {
    final List<dynamic> jsonList = jsonDecode(json);
    return jsonList.map((map) => ImageModel.fromMap(map)).toList();
  }

}
