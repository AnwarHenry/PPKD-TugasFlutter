// import 'package:flutter/material.dart';

// class FormBukti extends StatelessWidget {
//   const FormBukti({
//     super.key,
//     required this.name,
//     this.phone,
//     required this.email,
//     required this.domisili,
//   });
//   final String name;
//   final String email;
//   final String? phone;
//   final String domisili;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             email,
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           Text(
//             phone ?? "Tidak ada nomor telepon",
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           Text(
//             name,
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }

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
        title: const Text("Bukti Pemesanan"),
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
              "Terima kasih, $name dari $domisili telah memesan.",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
