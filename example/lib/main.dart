import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:cryptography/cryptography.dart';
import 'package:example/verifiable.dart';

import 'package:dart_verifiable/dart_verifiable.dart';

const jsonData =
    '{"verifiables":[{"verifiable":{"@context":["https://www.w3.org/2018/credentials/v1","https://itsme.id/2020/credentials/v1"],"id":"https://itsme.id/credentials/e7103672-c0dc-41a3-a5fc-04cd3baa71b7","type":["VerifiableCredential","UniversityStatusCredential"],"issuer":"https://itsme.id/issuers/37c40cf5-8bee-4555-945c-db70b16ad91a","issuanceDate":"2020-09-10T14:31:52.942429922Z","expirationDate":"2020-12-09T14:31:52.942428467Z","credentialSubject":{"id":"did:ctn:12341234","status":"재학"},"proof":{"type":"Ed25519Signature2018","created":"2020-09-10T14:31:52.942834858Z","proofPurpose":"assertionMethod","verificationMethod":"https://itsme.id/issuers/37c40cf5-8bee-4555-945c-db70b16ad91a/keys/1","jws":"2DarqifeaCJ-JCU5dq5LHef1cml9aVduavuTvD9mOpRXESu4ZkJAjkhWWXoYvUjP5DpJ0HnCntqv2lXRJ_7FAg"}},"keyName":"status"},{"verifiable":{"@context":["https://www.w3.org/2018/credentials/v1","https://itsme.id/2020/credentials/v1"],"id":"https://itsme.id/credentials/41a7e44d-f2a9-4701-bf2b-7bf853611033","type":["VerifiableCredential","UniversityStudentIdCredential"],"issuer":"https://itsme.id/issuers/37c40cf5-8bee-4555-945c-db70b16ad91a","issuanceDate":"2020-09-10T14:31:52.942846367Z","expirationDate":"2020-12-09T14:31:52.942845864Z","credentialSubject":{"id":"did:ctn:12341234","studentId":"19011296"},"proof":{"type":"Ed25519Signature2018","created":"2020-09-10T14:31:52.94311351Z","proofPurpose":"assertionMethod","verificationMethod":"https://itsme.id/issuers/37c40cf5-8bee-4555-945c-db70b16ad91a/keys/1","jws":"fNFAvJZAwkDH1MR__sU56uxEeQydxIA4tSBi0QwH-DyiSWsNQ97pMszTOFzEMRpnqST7TyCluzEHotsnFCByBQ"}},"keyName":"studentId"},{"verifiable":{"@context":["https://www.w3.org/2018/credentials/v1","https://itsme.id/2020/credentials/v1"],"id":"https://itsme.id/credentials/4f854bad-a88c-4ae2-8d80-c15c905f0105","type":["VerifiableCredential","UniversityNameCredential"],"issuer":"https://itsme.id/issuers/37c40cf5-8bee-4555-945c-db70b16ad91a","issuanceDate":"2020-09-10T14:31:52.943119717Z","expirationDate":"2020-12-09T14:31:52.943119386Z","credentialSubject":{"id":"did:ctn:12341234","schoolName":"세종대학교"},"proof":{"type":"Ed25519Signature2018","created":"2020-09-10T14:31:52.94338115Z","proofPurpose":"assertionMethod","verificationMethod":"https://itsme.id/issuers/37c40cf5-8bee-4555-945c-db70b16ad91a/keys/1","jws":"0cyMUryG2hjwucp9E9hdzEAGp8as52QiDuKlxz99_RWoj5hoIRm7NClpl2ltLnRRbhB0JpXMUBN2jmpQjH93Aw"}},"keyName":"schoolName"},{"verifiable":{"@context":["https://www.w3.org/2018/credentials/v1","https://itsme.id/2020/credentials/v1"],"id":"https://itsme.id/credentials/ad815e6b-ec66-4f3b-a844-f487bd2d35b8","type":["VerifiableCredential","UniversityHakjukStatusCredential"],"issuer":"https://itsme.id/issuers/37c40cf5-8bee-4555-945c-db70b16ad91a","issuanceDate":"2020-09-10T14:31:52.943387493Z","expirationDate":"2020-12-09T14:31:52.943387208Z","credentialSubject":{"hakjuk":"","id":"did:ctn:12341234"},"proof":{"type":"Ed25519Signature2018","created":"2020-09-10T14:31:52.9436497Z","proofPurpose":"assertionMethod","verificationMethod":"https://itsme.id/issuers/37c40cf5-8bee-4555-945c-db70b16ad91a/keys/1","jws":"kz7WC_6NVYTXlK2UnmppKfWY7m5AVx0fE_7EK8HNRJG8f1vpcI5S7cY415NpW9OKTDYNqQZVB2gK65U1JCYACQ"}},"keyName":"hakjuk"},{"verifiable":{"@context":["https://www.w3.org/2018/credentials/v1","https://itsme.id/2020/credentials/v1"],"id":"https://itsme.id/credentials/a61ea655-7b6c-4e58-b9bb-290b34ef668c","type":["VerifiableCredential","UniversityJaehakStatusCredential"],"issuer":"https://itsme.id/issuers/37c40cf5-8bee-4555-945c-db70b16ad91a","issuanceDate":"2020-09-10T14:31:52.943656342Z","expirationDate":"2020-12-09T14:31:52.943656055Z","credentialSubject":{"id":"did:ctn:12341234","jaehakStatus":true},"proof":{"type":"Ed25519Signature2018","created":"2020-09-10T14:31:52.943919744Z","proofPurpose":"assertionMethod","verificationMethod":"https://itsme.id/issuers/37c40cf5-8bee-4555-945c-db70b16ad91a/keys/1","jws":"5sBquR1Yk6P3syPgtXy6PVDM-6kvl2iwWHBCGn-BoutWsuyzKGIMmUr-QVDr_XXIaF8jk04ZIDBpRcMgvT94Dg"}},"keyName":"jaehakStatus"},{"verifiable":{"@context":["https://www.w3.org/2018/credentials/v1","https://itsme.id/2020/credentials/v1"],"id":"https://itsme.id/credentials/64aeeb08-355e-4276-a96a-71d66f6b1409","type":["VerifiableCredential","UniversityHyuhakStatusCredential"],"issuer":"https://itsme.id/issuers/37c40cf5-8bee-4555-945c-db70b16ad91a","issuanceDate":"2020-09-10T14:31:52.943925245Z","expirationDate":"2020-12-09T14:31:52.943924956Z","credentialSubject":{"hyuhakStatus":false,"id":"did:ctn:12341234"},"proof":{"type":"Ed25519Signature2018","created":"2020-09-10T14:31:52.94418493Z","proofPurpose":"assertionMethod","verificationMethod":"https://itsme.id/issuers/37c40cf5-8bee-4555-945c-db70b16ad91a/keys/1","jws":"a1yVhAn62bWnXqWZqH6LF1Ng7KZwCiWHmQaDP3491Rht75A7jj6VF1jPHqlRl76gzu3G1YyRtHOSKew1ZGyDBg"}},"keyName":"hyuhakStatus"},{"verifiable":{"@context":["https://www.w3.org/2018/credentials/v1","https://itsme.id/2020/credentials/v1"],"id":"https://itsme.id/credentials/3c92357f-6e20-4eba-b566-45420f85e24b","type":["VerifiableCredential","UniversityGraduateStatusCredential"],"issuer":"https://itsme.id/issuers/37c40cf5-8bee-4555-945c-db70b16ad91a","issuanceDate":"2020-09-10T14:31:52.944190282Z","expirationDate":"2020-12-09T14:31:52.944189996Z","credentialSubject":{"graduateStatus":false,"id":"did:ctn:12341234"},"proof":{"type":"Ed25519Signature2018","created":"2020-09-10T14:31:52.944460908Z","proofPurpose":"assertionMethod","verificationMethod":"https://itsme.id/issuers/37c40cf5-8bee-4555-945c-db70b16ad91a/keys/1","jws":"2ncIY3X9-m7cfFIPKX7JARH1Cg0ib0pembRjpFDubSeSe_661MxXV2YDA7wyRUSaamL67F2I4H-fWYV3KUXWAQ"}},"keyName":"graduateStatus"},{"verifiable":{"@context":["https://www.w3.org/2018/credentials/v1","https://itsme.id/2020/credentials/v1"],"id":"https://itsme.id/credentials/18b7f294-3548-4ad2-9a12-7c5923693f6c","type":["VerifiableCredential","UniversityAdmissionStatusCredential"],"issuer":"https://itsme.id/issuers/37c40cf5-8bee-4555-945c-db70b16ad91a","issuanceDate":"2020-09-10T14:31:52.944475498Z","expirationDate":"2020-12-09T14:31:52.944475198Z","credentialSubject":{"admissionStatus":true,"id":"did:ctn:12341234"},"proof":{"type":"Ed25519Signature2018","created":"2020-09-10T14:31:52.944745722Z","proofPurpose":"assertionMethod","verificationMethod":"https://itsme.id/issuers/37c40cf5-8bee-4555-945c-db70b16ad91a/keys/1","jws":"R9yA09H-MdVYSQBkDhq-3I4kIyv5Mn5gUO3hV8XxN18fgtNp6ckXadNwrsGele9SvoG8HXG7PQfnFWs7VT-KAA"}},"keyName":"admissionStatus"},{"verifiable":{"@context":["https://www.w3.org/2018/credentials/v1","https://itsme.id/2020/credentials/v1"],"id":"https://itsme.id/credentials/46e01226-dccc-4505-a37c-ba6d853d7581","type":["VerifiableCredential","UniversityExpelStatusCredential"],"issuer":"https://itsme.id/issuers/37c40cf5-8bee-4555-945c-db70b16ad91a","issuanceDate":"2020-09-10T14:31:52.944751509Z","expirationDate":"2020-12-09T14:31:52.944751208Z","credentialSubject":{"expelStatus":false,"id":"did:ctn:12341234"},"proof":{"type":"Ed25519Signature2018","created":"2020-09-10T14:31:52.945066603Z","proofPurpose":"assertionMethod","verificationMethod":"https://itsme.id/issuers/37c40cf5-8bee-4555-945c-db70b16ad91a/keys/1","jws":"K5kf1XVb1a3f8uc3zLGNNgiPYiXZ2e73YZnY_APYhPVZTSazpNad8MxJjOHOmc906dphCNvd7SiWPT-A6-NlCw"}},"keyName":"expelStatus"}]}';

const b64PrivateKey = "aYSc7H/FyDVbgFWyRL2eZMHnarovp4A4pD4ro+IP604=";

const issuerB64PrivateKey = "31M+T3q9urxfsPPANzRiKkqDgYhJPZ6A0GmxvTtAobc=";

const issuerB64PublicKey = "ICT8C0k75FHHKOU4e0axbFtmlPi/IsH1M6cz0YIvF/I=";

void main() async {
  var creds = Verifiables.fromJson(jsonDecode(jsonData));
  var vcs = List<Credential>();
  creds.verifiables.forEach((element) {
    vcs.add(element.verifiable);
  });
  var p = await Presentation.create(b64PrivateKey, "did:ctn:12341234", vcs);
  var ep = jsonEncode(p);

  await http.post("http://localhost:4434", body: utf8.encode(ep));

  // print(ep);

  var privateKey = PrivateKey(base64Decode(b64PrivateKey));

  var keyPair = ed25519.newKeyPairFromSeedSync(privateKey);

  var verified = await p.verify(base64.encode(keyPair.publicKey.bytes));

  print(verified);

  var issuerPrivateKey = PrivateKey(base64.decode(issuerB64PrivateKey));
  var issuerKeyPair = ed25519.newKeyPairFromSeedSync(issuerPrivateKey);

  var v2 = await p.verifiableCredential[0]
      .verify(base64.encode(issuerKeyPair.publicKey.bytes));
  print(v2);

  // print(base64.encode(sha512.hashSync(utf8.encode(ep)).bytes));
  //

  // var dec = Presentation.fromJson(jsonDecode(ep));
  // var sig = base64.decode(base64.normalize(dec.proof.jws));
  //
  // var b = Presentation(
  //     dec.context, dec.id, dec.type, dec.verifiableCredential, null);
  //
  // print(ed25519.verifySync(utf8.encode(jsonEncode(b.toJson())),
  //     Signature(List.from(sig), publicKey: keyPair.publicKey)));
}
