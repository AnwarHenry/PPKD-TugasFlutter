import 'package:flutter/material.dart';

class DropdownPage extends StatefulWidget {
  const DropdownPage({super.key});

  @override
  State<DropdownPage> createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage> {
  String? dropdownSelect;

  // Map kategori ke gambar
  final Map<String, String> productImages = {
    "Elektronik": "assets/images/elektronik.png",
    "Pakaian": "assets/images/pakaian.png",
    "Makanan": "assets/images/makanan.png",
    "Lainnya": "assets/images/lainnya.png",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background nature2
          Image.asset("assets/images/nature2.png", fit: BoxFit.cover),

          // Lapisan gelap supaya teks lebih jelas
          Container(color: Colors.black.withOpacity(0.3)),

          // Konten
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                const Text(
                  "Halaman Dropdown",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black54,
                        blurRadius: 6,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                // Dropdown dalam card transparan
                Card(
                  color: Colors.white.withOpacity(0.85),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    child: DropdownButton<String>(
                      value: dropdownSelect,
                      hint: const Text("Pilih Produk"),
                      dropdownColor: Colors.white,
                      underline: const SizedBox(),
                      isExpanded: true,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black87,
                      ),
                      items: ["Elektronik", "Pakaian", "Makanan", "Lainnya"]
                          .map((String value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 16),
                              ),
                            );
                          })
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          dropdownSelect = value;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Hasil pilihan
                if (dropdownSelect == null)
                  const Text(
                    "Anda belum memilih produk",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black54,
                          blurRadius: 4,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                  )
                else
                  Column(
                    children: [
                      Text(
                        "Produk yang dipilih: $dropdownSelect",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black54,
                              blurRadius: 4,
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Tampilkan gambar dalam card elegan
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          productImages[dropdownSelect]!,
                          width: double.infinity,
                          height: 260,
                          fit: BoxFit.cover,
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
