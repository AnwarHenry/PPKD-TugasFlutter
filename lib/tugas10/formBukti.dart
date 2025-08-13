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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            email,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            phone ?? "Tidak ada nomor telepon",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
