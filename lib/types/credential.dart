import 'package:dart_verifiable/types/proof.dart';
import 'package:json_annotation/json_annotation.dart';

part 'credential.g.dart';

@JsonSerializable()
class Credential {
  final List<String> context;
  final String id;
  final List<String> type;
  final String issuer;
  final DateTime issuanceDate;
  final DateTime expirationDate;
  final Map<String, dynamic> credentialSubject;
  final Proof proof;

  Credential(this.context, this.id, this.type, this.issuer, this.issuanceDate,
      this.expirationDate, this.credentialSubject, this.proof);

  Map<String, dynamic> toJson() => _$CredentialToJson(this);
  factory Credential.fromJson(Map<String, dynamic> json) =>
      _$CredentialFromJson(json);
}
