import 'dart:convert';

import 'package:cryptography/cryptography.dart';
import 'package:dart_verifiable/signer/ed25519/ed25519.dart';
import 'package:dart_verifiable/types/proof.dart';
import 'package:dart_verifiable/types/rfc3339.dart';
import 'package:json_annotation/json_annotation.dart';

part 'credential.g.dart';

@JsonSerializable()
@RFC3339DateTimeConverter()
class Credential {
  @JsonKey(name: "@context")
  final List<String> context;
  final String id;
  final List<String> type;
  final String issuer;
  final String issuanceDate;
  final String expirationDate;
  final Map<String, dynamic> credentialSubject;
  final Proof proof;

  Credential(this.context, this.id, this.type, this.issuer, this.issuanceDate,
      this.expirationDate, this.credentialSubject, this.proof);

  Map<String, dynamic> toJson() => _$CredentialToJson(this);
  factory Credential.fromJson(Map<String, dynamic> json) =>
      _$CredentialFromJson(json);

  Future<bool> verify(String issuerPublicKey) async {
    var c = Credential(
      context,
      id,
      type,
      issuer,
      issuanceDate,
      expirationDate,
      credentialSubject,
      null,
    );

    print(jsonEncode(c.toJson()));

    var msg = utf8.encode(jsonEncode(c.toJson()));

    var signer = Ed25519Singer();
    return await signer.verify(
        msg, base64.decode(base64.normalize(proof.jws)), PublicKey(base64.decode(issuerPublicKey)));
  }
}
