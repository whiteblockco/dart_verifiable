import 'dart:convert';

import 'package:cryptography/cryptography.dart';
import 'package:dart_verifiable/signer/ed25519/ed25519.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('signer', () async {
    var keypair = await ed25519.newKeyPair();
    Ed25519Singer signer = Ed25519Singer();
    var data =
        await signer.sign(utf8.encode("hello world"), keypair.privateKey);
    print(data);

    var verifed = await signer.verify(
        utf8.encode("hello world"), data, keypair.publicKey);
    print(verifed);
  });
}
