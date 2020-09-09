import 'package:json_annotation/json_annotation.dart';

part 'proof.g.dart';

@JsonSerializable()
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
}
