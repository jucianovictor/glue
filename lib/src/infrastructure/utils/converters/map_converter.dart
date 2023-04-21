import 'dart:convert';

abstract class MapConverter {
  static Map fromJson(String json) {
    return jsonDecode(json);
  }

  static String toJson(Map map) {
    return jsonEncode(map);
  }
}
