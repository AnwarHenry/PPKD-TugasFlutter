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
          // Background nature1
          Image.asset("assets/images/nature1.png", fit: BoxFit.cover),

          // Konten
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text(
                  "Halaman Dropdown",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // teks terlihat di background
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: dropdownSelect,
                    hint: const Text("Pilih Produk"),
                    dropdownColor: Colors.white,
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
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(height: 20),
                // Tampilkan gambar sesuai pilihan
                if (dropdownSelect != null)
                  Image.asset(productImages[dropdownSelect]!, height: 350),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class DropdownPage extends StatefulWidget {
//   const DropdownPage({super.key});

//   @override
//   State<DropdownPage> createState() => _DropdownPageState();
// }

// class _DropdownPageState extends State<DropdownPage> {
//   String? dropdownSelect;

//   // Map kategori ke gambar
//   final Map<String, String> productImages = {
//     "Elektronik": "assets/images/elektronik.png",
//     "Pakaian": "assets/images/pakaian.png",
//     "Makanan": "assets/images/makanan.png",
//     "Lainnya": "assets/images/lainnya.png",
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           // Background nature1
//           Image.asset("assets/images/nature1.png", fit: BoxFit.cover),

//           // Konten
//           SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 40),
//                 const Text(
//                   "Halaman Dropdown",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white, // teks terlihat di background
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: DropdownButton<String>(
//                     value: dropdownSelect,
//                     hint: const Text("Pilih Produk"),
//                     dropdownColor: Colors.white,
//                     items: ["Elektronik", "Pakaian", "Makanan", "Lainnya"].map((
//                       String value,
//                     ) {
//                       return DropdownMenuItem(value: value, child: Text(value));
//                     }).toList(),
//                     onChanged: (value) {
//                       setState(() {
//                         dropdownSelect = value;
//                       });
//                     },
//                     isExpanded: true,
//                     icon: const Icon(Icons.arrow_drop_down),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   dropdownSelect == null
//                       ? "Anda belum memilih produk"
//                       : "Produk yang dipilih: $dropdownSelect",
//                   style: const TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//                 const SizedBox(height: 20),
//                 // Tampilkan gambar produk dengan lebar penuh
//                 if (dropdownSelect != null)
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(
//                         15,
//                       ), // sudut melengkung
//                       child: Image.asset(
//                         productImages[dropdownSelect]!,
//                         width: double.infinity, // lebar penuh
//                         height: 250, // tinggi tetap
//                         fit: BoxFit.cover, // menyesuaikan proporsi
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
