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
          // Background gambar full (nature2)
          SizedBox.expand(
            child: Image.asset("assets/images/nature2.png", fit: BoxFit.cover),
          ),

          // Lapisan transparan biar teks tetap terbaca
          Container(color: Colors.black.withOpacity(0.3)),

          // Konten
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 40.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Syarat & Ketentuan",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 8,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "1. Pengguna wajib memberikan data yang benar dan akurat.\n"
                  "2. Segala informasi pribadi akan dijaga kerahasiaannya.\n"
                  "3. Dilarang menggunakan layanan ini untuk tujuan yang melanggar hukum.\n"
                  "4. Pihak pengelola berhak mengubah ketentuan sewaktu-waktu.\n",
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.6,
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
                const SizedBox(height: 15),
                const Text(
                  "Saya menyetujui semua persyaratan yang berlaku",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
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
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.greenAccent,
                      checkColor: Colors.black,
                      value: isCheck,
                      onChanged: (value) {
                        setState(() {
                          isCheck = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        isCheck
                            ? "✔ Lanjutkan pendaftaran diperbolehkan"
                            : "✘ Anda belum bisa melanjutkan",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: isCheck
                              ? Colors.greenAccent
                              : Colors.redAccent,
                          shadows: const [
                            Shadow(
                              color: Colors.black,
                              blurRadius: 6,
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
