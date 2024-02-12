import 'dart:typed_data';

typedef Scope = Map<String, bool>;

class Auth {
  String? username;
  String? displayName;
  ByteData? avatar;

  final Scope scopes = {};
}
