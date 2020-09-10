import 'dart:convert';
import 'dart:typed_data';

import 'package:dart_verifiable/types/credential.dart';
import 'package:dart_verifiable/types/proof.dart';
import 'package:json_annotation/json_annotation.dart';

part 'presentation.g.dart';

const VpType = "VerifiablePresentation";

@JsonSerializable()
class Presentation {
  @JsonKey(name: "@context")
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
      String privateKey, String ownerDID, List<Credential> credentials) async {
    var context = [
      "https://www.w3.org/2018/presentations/v1",
      "https://itsme.id/2020/presentations/v1"
    ];
    var id = "uuid-v4";
    var type = [VpType];

    var presentation = Presentation(
      context,
      id,
      type,
      credentials,
      null,
    );

    Proof proof = await Proof.create(
        privateKey, Uint8List.fromList(utf8.encode(jsonEncode(presentation.toJson()))));

    return Presentation(presentation.context, presentation.id,
        presentation.type, credentials, proof);
  }
}
