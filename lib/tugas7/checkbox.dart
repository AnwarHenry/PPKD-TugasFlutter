// import 'package:flutter/material.dart';

// class CheckBoxPage extends StatefulWidget {
//   const CheckBoxPage({super.key});

//   @override
//   State<CheckBoxPage> createState() => _CheckBoxPage();
// }

// class _CheckBoxPage extends State<CheckBoxPage> {
//   bool isCheck = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: const Color(0xFF00224F),
//       // appBar: AppBar(centerTitle: true, title: Text('Syarat & Ketentuan')),
//       body: Container(
//         padding: EdgeInsets.symmetric(horizontal: 50.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Syarat & Ketentuan", style: TextStyle(fontSize: 20)),

//             const Text(
//               "Saya menyetujui semua persyaratan yang berlaku",
//               style: TextStyle(fontSize: 15),
//             ),

//             // SizedBox()
//             Checkbox(
//               activeColor: const Color.fromARGB(255, 31, 245, 3),
//               value: isCheck,
//               onChanged: (value) {
//                 setState(() {
//                   isCheck = value!;
//                 });
//               },
//             ),
//             Text(
//               isCheck == true
//                   ? "Lanjutkan pendaftaran diperbolehkan"
//                   : "Anda belum bisa melanjutkan",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CheckBoxPage extends StatefulWidget {
  const CheckBoxPage({super.key});

  @override
  State<CheckBoxPage> createState() => _CheckBoxPage();
}

class _CheckBoxPage extends State<CheckBoxPage> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Syarat & Ketentuan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "1. Pengguna wajib memberikan data yang benar dan akurat.\n"
              "2. Segala informasi pribadi akan dijaga kerahasiaannya.\n"
              "3. Dilarang menggunakan layanan ini untuk tujuan yang melanggar hukum.\n"
              "4. Pihak pengelola berhak mengubah ketentuan sewaktu-waktu.\n",
              style: TextStyle(fontSize: 15, height: 1.5),
            ),
            const SizedBox(height: 10),
            const Text(
              "Saya menyetujui semua persyaratan yang berlaku",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            Checkbox(
              activeColor: const Color.fromARGB(255, 31, 245, 3),
              value: isCheck,
              onChanged: (value) {
                setState(() {
                  isCheck = value!;
                });
              },
            ),
            Text(
              isCheck
                  ? " Lanjutkan pendaftaran diperbolehkan"
                  : " Anda belum bisa melanjutkan",
              style: TextStyle(
                color: isCheck ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
