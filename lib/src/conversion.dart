import 'dart:convert';

extension StringUtils on String {
  bool get isNullOrEmpty => this == null || this.isEmpty;
  Map<String, dynamic> get toJson => json.decode(this);
  String get snakeCase => this.trim().replaceAll(' ', '_');
  String fallback(String val) => this.isNullOrEmpty ? val : this;
}

extension MapUtils on Map {
  String get toJsonString => json.encode(this);
  String get prettyPrint {
    JsonEncoder encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(this);
  }
}

extension DynamicUtils on dynamic {
  String get asString => this.toString();
  bool get asBool => this as bool;
  int get asInt => int.tryParse(this.toString());
  num get asNum => num.tryParse(this.toString());
  double get asDouble => double.tryParse(this.toString());
  List get asList => List.from(this);
  Map<String, dynamic> get asJson => json.decode(json.encode(this));
}
