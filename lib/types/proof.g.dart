// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proof.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Proof _$ProofFromJson(Map<String, dynamic> json) {
  return Proof(
    json['type'] as String,
    const RFC3339DateTimeConverter().fromJson(json['created'] as String),
    json['proofPurpose'] as String,
    json['verificationMethod'] as String,
    json['jws'] as String,
  );
}

Map<String, dynamic> _$ProofToJson(Proof instance) => <String, dynamic>{
      'type': instance.type,
      'created': const RFC3339DateTimeConverter().toJson(instance.created),
      'proofPurpose': instance.proofPurpose,
      'verificationMethod': instance.verificationMethod,
      'jws': instance.jws,
    };
