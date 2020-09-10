import 'package:dart_verifiable/dart_verifiable.dart';

class Verifiable {
  final Credential verifiable;
  final String keyName;

  Verifiable(this.verifiable, this.keyName);

  factory Verifiable.fromJson(Map<String, dynamic> json) {
    return Verifiable(
      Credential.fromJson(json["verifiable"]),
      json['keyName'] as String,
    );
  }
}

class Verifiables {
  final List<Verifiable> verifiables;

  Verifiables(this.verifiables);

  factory Verifiables.fromJson(Map<String, dynamic> json) {
    var a = List<Verifiable>();
    var b = json['verifiables'] as List<dynamic>;
    b.forEach((v) {
      a.add(Verifiable.fromJson(v));
    });

    return Verifiables(a);
  }
}
