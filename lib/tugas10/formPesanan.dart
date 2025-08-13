import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas10/formBukti.dart';

class FormPesananPage extends StatefulWidget {
  const FormPesananPage({super.key});

  @override
  State<FormPesananPage> createState() => _FormPesananPageState();
}

class _FormPesananPageState extends State<FormPesananPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nomorHpController = TextEditingController();
  final TextEditingController domisiliController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Masukkan email yang valid';
    }
    return null;
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama tidak boleh kosong';
    }
    if (value.length < 3) {
      return 'Nama terlalu pendek';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nomor HP tidak boleh kosong';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Hanya angka yang diperbolehkan';
    }
    return null;
  }

  String? _validateDomisili(String? value) {
    if (value == null || value.isEmpty) {
      return 'Domisili tidak boleh kosong';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Formulir Pemesanan"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Nama
                const Text("Nama Lengkap:"),
                TextFormField(
                  controller: namaController,
                  decoration: const InputDecoration(
                    hintText: "Masukkan Nama Lengkap Anda",
                    border: OutlineInputBorder(),
                  ),
                  validator: _validateName,
                ),
                const SizedBox(height: 12),

                // Email
                const Text("Email:"),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: "Masukkan Email",
                    border: OutlineInputBorder(),
                  ),
                  validator: _validateEmail,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 12),

                // No HP
                const Text("No HP:"),
                TextFormField(
                  controller: nomorHpController,
                  decoration: const InputDecoration(
                    hintText: "Masukkan No HP",
                    border: OutlineInputBorder(),
                  ),
                  validator: _validatePhone,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 12),

                // Domisili
                const Text("Domisili Kota:"),
                TextFormField(
                  controller: domisiliController,
                  decoration: const InputDecoration(
                    hintText: "Masukkan Domisili Kota Anda",
                    border: OutlineInputBorder(),
                  ),
                  validator: _validateDomisili,
                ),
                const SizedBox(height: 20),

                // Tombol Submit
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // SnackBar sukses
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Terima kasih, ${namaController.text} dari ${domisiliController.text} telah mendaftar.',
                              style: const TextStyle(fontSize: 16),
                            ),
                            duration: const Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );

                        // Navigasi setelah delay
                        Future.delayed(const Duration(milliseconds: 1000), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FormBukti(
                                email: emailController.text,
                                name: namaController.text,
                                phone: nomorHpController.text,
                                domisili: domisiliController.text,
                              ),
                            ),
                          );
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      "Daftar",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true, // biar layout naik saat keyboard muncul
//       appBar: AppBar(
//         title: const Text("Form Pesanan"),
//         backgroundColor: const Color.fromARGB(255, 238, 133, 12),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextFormField(
//                   controller: namaController,
//                   decoration: const InputDecoration(
//                     labelText: "Nama Lengkap",
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) =>
//                       value!.isEmpty ? "Nama tidak boleh kosong" : null,
//                 ),

//                 const SizedBox(height: 16),
//                 TextFormField(
//                   controller: emailController,
//                   decoration: const InputDecoration(
//                     labelText: "E-mail",
//                     border: OutlineInputBorder(),
//                   ),
//                   // maxLines: 2,
//                   validator: (value) =>
//                       value!.isEmpty ? "Email tidak boleh kosong" : null,
//                 ),

//                 const SizedBox(height: 16),
//                 TextFormField(
//                   controller: nomorHpController,
//                   decoration: const InputDecoration(
//                     labelText: "Nomor HP",
//                     border: OutlineInputBorder(),
//                   ),
//                   // maxLines: 2,
//                   validator: (value) =>
//                       value!.isEmpty ? "Nomor tidak boleh kosong" : null,
//                 ),

//                 const SizedBox(height: 16),
//                 TextFormField(
//                   controller: domisiliController,
//                   decoration: const InputDecoration(
//                     labelText: "Domisili",
//                     border: OutlineInputBorder(),
//                   ),
//                   // maxLines: 2,
//                   validator: (value) =>
//                       value!.isEmpty ? "Domisili tidak boleh kosong" : null,
//                 ),

//                 const SizedBox(height: 16),
//                 TextFormField(
//                   controller: jumlahController,
//                   decoration: const InputDecoration(
//                     labelText: "Jumlah Pesanan",
//                     border: OutlineInputBorder(),
//                   ),
//                   keyboardType: TextInputType.number,
//                   validator: (value) =>
//                       value!.isEmpty ? "Jumlah tidak boleh kosong" : null,
//                 ),

//                 const SizedBox(height: 16),
//                 TextFormField(
//                   controller: catatanController,
//                   decoration: const InputDecoration(
//                     labelText: "Catatan Tambahan",
//                     border: OutlineInputBorder(),
//                   ),
//                   maxLines: 3,
//                 ),

//                 const SizedBox(height: 30),
//                 Center(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text("Pesanan berhasil dikirim!"),
//                           ),
//                         );
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.orange,
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 50,
//                         vertical: 15,
//                       ),
//                     ),
//                     child: const Text(
//                       "Kirim Pesanan",
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
