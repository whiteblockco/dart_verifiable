import 'dart:convert';

import 'package:dart_verifiable/types/credential.dart';
import 'package:dart_verifiable/types/proof.dart';
import 'package:json_annotation/json_annotation.dart';

part 'presentation.g.dart';

const VpType = "VerifiablePresentation";

@JsonSerializable()
class Presentation {
  final List<String> context;
  final String id;
  final List<String> type;
  final List<Credential> verifiableCredential;
  final Proof proof;

  Presentation(
      this.context, this.id, this.type, this.verifiableCredential, this.proof);

  Map<String, dynamic> toJson() => _$PresentationToJson(this);
  factory Presentation.fromJson(Map<String, dynamic> json) =>
      _$PresentationFromJson(json);

  static create(
      String privateKey, String ownerDID, List<Credential> credentials) {
    var context = [
      "https://www.w3.org/2018/credentials/v1",
      "https://itsme.id/2020/credentials/v1"
    ];
    var id = "id";
    var type = [VpType];

    var presentation = Presentation(
      context,
      id,
      type,
      credentials,
      null,
    );

    Proof proof = Proof.create(
        privateKey, utf8.encode(jsonEncode(presentation.toJson())));

    return Presentation(presentation.context, presentation.id,
        presentation.type, credentials, proof);
  }
}
