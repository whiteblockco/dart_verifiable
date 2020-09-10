import 'package:json_annotation/json_annotation.dart';

class RFC3339DateTimeConverter implements JsonConverter<DateTime, String> {
  const RFC3339DateTimeConverter();

  @override
  DateTime fromJson(String json) {
    if (json.contains(".")) {
      json = json.substring(0, json.length - 1);
    }

    return DateTime.parse(json);
  }

  @override
  String toJson(DateTime json) => json.toIso8601String();
}
