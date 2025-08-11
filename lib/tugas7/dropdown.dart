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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text("Halaman Dropdown", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                value: dropdownSelect,
                hint: const Text("Pilih Produk"),
                items: ["Elektronik", "Pakaian", "Makanan", "Lainnya"].map((
                  String value,
                ) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    dropdownSelect = value;
                  });
                },
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              dropdownSelect == null
                  ? "Anda belum memilih produk"
                  : "Produk yang dipilih: $dropdownSelect",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Tampilkan gambar sesuai pilihan
            if (dropdownSelect != null)
              Image.asset(productImages[dropdownSelect]!, height: 350),
              
          ],
        ),
      ),
    );
  }
}
