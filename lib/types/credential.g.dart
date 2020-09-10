// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Credential _$CredentialFromJson(Map<String, dynamic> json) {
  return Credential(
    (json['@context'] as List)?.map((e) => e as String)?.toList(),
    json['id'] as String,
    (json['type'] as List)?.map((e) => e as String)?.toList(),
    json['issuer'] as String,
    json['issuanceDate'] == null
        ? null
        : DateTime.parse(json['issuanceDate'] as String),
    json['expirationDate'] == null
        ? null
        : DateTime.parse(json['expirationDate'] as String),
    json['credentialSubject'] as Map<String, dynamic>,
    json['proof'] == null
        ? null
        : Proof.fromJson(json['proof'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CredentialToJson(Credential instance) =>
    <String, dynamic>{
      '@context': instance.context,
      'id': instance.id,
      'type': instance.type,
      'issuer': instance.issuer,
      'issuanceDate': instance.issuanceDate?.toIso8601String(),
      'expirationDate': instance.expirationDate?.toIso8601String(),
      'credentialSubject': instance.credentialSubject,
      'proof': instance.proof,
    };
