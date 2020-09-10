import 'dart:convert';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:dart_verifiable/signer/ed25519/ed25519.dart';
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

  Future<bool> verify(String holderPublicKey) async {
    var p = Presentation(
      context,
      id,
      type,
      verifiableCredential,
      null,
    );

    var msg = utf8.encode(jsonEncode(p.toJson()));

    var signer = Ed25519Singer();
    return await signer.verify(
        msg, base64.decode(base64.normalize(proof.jws)), PublicKey(base64.decode(holderPublicKey)));
  }

  static Future<Presentation> create(
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

    Proof proof = await Proof.create(privateKey,
        Uint8List.fromList(utf8.encode(jsonEncode(presentation.toJson()))));

    return Presentation(presentation.context, presentation.id,
        presentation.type, credentials, proof);
  }
}
