library dart_verifiable;

/*
{
  "@context": [
    "https://www.w3.org/2018/credentials/v1",
    "https://www.w3.org/2018/credentials/examples/v1"
  ],
  "id": "https://itsme.id/credentials/${uuid}",
  "type": ["VerifiablePresentation"],
  "verifiableCredential": [
    "@context": [
          "https://www.w3.org/2018/credentials/v1",
          "https://itsme.id/2020/credentials/v1"
      ],
      "id": "https://itsme.id/credentials/6794bfc1-835d-4f4a-8a33-e8d326bacc5c",
      "type": [
          "VerifiableCredential",
          "UniversityStatusCredential"
      ],
      "issuer": "https://itsme.id/issuers/47874950-6a1a-42f7-a0e8-a0831a6ac55e",
      "issuanceDate": "2020-09-09T15:08:34.932839885Z",
      "expirationDate": "2020-09-30T15:08:34.932840209Z",
      "credentialSubject": {
          "id": "did:ctn:12341234",
          "status": "재학"
      },
      "proof": {
          "type": "Ed25519Signature2018",
          "created": "2020-09-09T15:08:34.933872244Z",
          "proofPurpose": "assertionMethod",
          "verificationMethod": "https://itsme.id/issuers/47874950-6a1a-42f7-a0e8-a0831a6ac55e/keys/1",
          "jws": "MEUCIQDa7cKQM50E1fsk_apEAqcQt0-szoDtgpgnlq4chZjP_QIgB-gtM-67yuvsMGbnKeiSFfPtumbG0Ld2bnYvV-5d1OA"
      }
  ],
  proof: [{
    "type": "Ed25519Signature2018",
    "created": ${created},
    "proofPurpose": "assertionMethod",
    "verificationMethod": ${holderDID} // "did:example:ebfeb1f712ebc6f1c276e12ec21#keys-1",
    "jws": base64.URLEncoding.WithPadding(base64.NoPadding).EncodeToString(sig.Serialize())
  }]
 */

class DartVerifiable {
  _generateBaseVP() {}

  static create(String privateKey, String ownerDID,
      List<Map<String, dynamic>> credentials) {}
}
