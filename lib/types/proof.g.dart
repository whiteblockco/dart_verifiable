// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proof.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Proof _$ProofFromJson(Map<String, dynamic> json) {
  return Proof(
    json['type'] as String,
    json['created'] == null ? null : DateTime.parse(json['created'] as String),
    json['proofPurpose'] as String,
    json['verificationMethod'] as String,
    json['jws'] as String,
  );
}

Map<String, dynamic> _$ProofToJson(Proof instance) => <String, dynamic>{
      'type': instance.type,
      'created': instance.created?.toIso8601String(),
      'proofPurpose': instance.proofPurpose,
      'verificationMethod': instance.verificationMethod,
      'jws': instance.jws,
    };
