import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String name;
  final String email;
  final String namaEvent;
  final String asalKota;

  User({
    required this.name,
    required this.email,
    required this.namaEvent,
    required this.asalKota,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'nama_event': namaEvent,
      'asal_kota': asalKota,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      email: map['email'] as String,
      namaEvent: map['nama_event'] as String,
      asalKota: map['asal_kota'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
