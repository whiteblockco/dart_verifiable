import 'package:dart_verifiable/types/credential.dart';
import 'package:dart_verifiable/types/proof.dart';
import 'package:json_annotation/json_annotation.dart';

part 'presentation.g.dart';

@JsonSerializable()
class Presentation {
  final List<String> context;
  final String id;
  final List<String> type;
  final Credential verifiableCredential;
  final Proof proof;

  Presentation(
      this.context, this.id, this.type, this.verifiableCredential, this.proof);

  Map<String, dynamic> toJson() => _$PresentationToJson(this);
  factory Presentation.fromJson(Map<String, dynamic> json) =>
      _$PresentationFromJson(json);
}
