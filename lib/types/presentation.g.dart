// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presentation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Presentation _$PresentationFromJson(Map<String, dynamic> json) {
  return Presentation(
    (json['@context'] as List)?.map((e) => e as String)?.toList(),
    json['id'] as String,
    (json['type'] as List)?.map((e) => e as String)?.toList(),
    (json['verifiableCredential'] as List)
        ?.map((e) =>
            e == null ? null : Credential.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['proof'] == null
        ? null
        : Proof.fromJson(json['proof'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PresentationToJson(Presentation instance) =>
    <String, dynamic>{
      '@context': instance.context,
      'id': instance.id,
      'type': instance.type,
      'verifiableCredential': instance.verifiableCredential,
      'proof': instance.proof,
    };
