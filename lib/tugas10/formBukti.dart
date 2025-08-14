import 'package:flutter/material.dart';

class FormBukti extends StatelessWidget {
  const FormBukti({
    super.key,
    required this.name,
    this.phone,
    required this.email,
    required this.domisili,
  });

  final String name;
  final String email;
  final String? phone;
  final String domisili;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bukti Pendaftaran"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Terima kasih, $name dari $domisili telah mendaftar.",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
