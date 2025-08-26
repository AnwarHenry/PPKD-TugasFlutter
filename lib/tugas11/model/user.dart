// lib/tugas11/model/user.dart
// lib/tugas11/model/user.dart
class User {
  final int? id; // nullable karena saat insert belum ada id
  final String name;
  final String email;
  final String namaEvent;
  final String asalKota;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.namaEvent,
    required this.asalKota,
  });

  // Convert objek User ke Map untuk SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'namaEvent': namaEvent,
      'asalKota': asalKota,
    };
  }

  // Membuat objek User dari Map (hasil query SQLite)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      namaEvent: map['namaEvent'],
      asalKota: map['asalKota'],
    );
  }
}
