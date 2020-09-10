import 'dart:convert';
import 'dart:typed_data';

import 'package:dart_verifiable/signer/ed25519/ed25519.dart';
import 'package:dart_verifiable/types/rfc3339.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rfc_3339_date_time_serializer/rfc_3339_date_time_serializer.dart';

part 'proof.g.dart';

@JsonSerializable()
@RFC3339DateTimeConverter()
class Proof {
  final String type;
  final DateTime created;
  final String proofPurpose;
  final String verificationMethod;
  final String jws;

  Proof(this.type, this.created, this.proofPurpose, this.verificationMethod,
      this.jws);

  Map<String, dynamic> toJson() => _$ProofToJson(this);

  factory Proof.fromJson(Map<String, dynamic> json) => _$ProofFromJson(json);

  static create(String privateKey, Uint8List data) async {
    var signer = Ed25519Singer();
    var signed = await signer.sign(data, privateKey);

    return Proof(
      "Ed25519Signature2018",
      DateTime.now(),
      "assertionMetohod",
      "what is it?!",
      base64.encode(signed).replaceAll("=", ""),
    );
  }
}
