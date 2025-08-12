import 'package:flutter/material.dart';

class CheckBoxPage extends StatefulWidget {
  const CheckBoxPage({super.key});

  @override
  State<CheckBoxPage> createState() => _CheckBoxPageState();
}

class _CheckBoxPageState extends State<CheckBoxPage> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gambar full
          SizedBox.expand(
            child: Image.asset("assets/images/nature1.png", fit: BoxFit.cover),
          ),

          // Lapisan transparan biar teks lebih jelas
          Container(color: Colors.black.withOpacity(0.3)),

          // Konten
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Syarat & Ketentuan",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 6,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "1. Pengguna wajib memberikan data yang benar dan akurat.\n"
                  "2. Segala informasi pribadi akan dijaga kerahasiaannya.\n"
                  "3. Dilarang menggunakan layanan ini untuk tujuan yang melanggar hukum.\n"
                  "4. Pihak pengelola berhak mengubah ketentuan sewaktu-waktu.\n",
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 6,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Saya menyetujui semua persyaratan yang berlaku",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 6,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
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
                      ? "Lanjutkan pendaftaran diperbolehkan"
                      : "Anda belum bisa melanjutkan",
                  style: TextStyle(
                    color: isCheck ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      const Shadow(
                        color: Colors.black,
                        blurRadius: 6,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
