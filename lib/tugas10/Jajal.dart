// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/Tugas10Flutter/textform.dart';

// class Tugas10Flutter extends StatefulWidget {
//   const Tugas10Flutter({super.key});

//   @override
//   State<Tugas10Flutter> createState() => _Tugas10Flutter();
// }

// class _Tugas10Flutter extends State<Tugas10Flutter> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController cityController = TextEditingController();

//   void _showError(String message) {
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(SnackBar(content: Text(message)));
//   }

//   void _handleSubmit() {
//     String name = nameController.text.trim();
//     String email = emailController.text.trim();
//     String phone = phoneController.text.trim();
//     String city = cityController.text.trim();

//     if (name.isEmpty || email.isEmpty || city.isEmpty) {
//       _showError("Nama, Email, dan Kota wajib diisi!");
//       return;
//     }
//     if (!email.contains("@")) {
//       _showError("Email tidak valid. Harus mengandung '@'");
//       return;
//     }

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Konfirmasi Data"),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Nama: $name"),
//             Text("Email: $email"),
//             Text("Nomor HP: ${phone.isEmpty ? '-' : phone}"),
//             Text("Kota: $city"),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text("Batal"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => HalamanKonfirmasi(name: name, city: city),
//                 ),
//               );
//             },
//             child: Text("Lanjut"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.blueAccent),
//       body: Padding(
//         padding: const EdgeInsets.all(36.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(height: 50),
//               Row(
//                 children: [
//                   Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               SizedBox(height: 10),
//               TextFormConst(
//                 hintText: "Masukkan Nama",
//                 controller: nameController,
//                 onChanged: (p0) {
//                   setState(() {});
//                 },
//               ),
//               SizedBox(height: 15),
//               Row(
//                 children: [
//                   Text('Email', style: TextStyle(fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               SizedBox(height: 10),
//               TextFormConst(
//                 hintText: "Masukkan Email",
//                 controller: emailController,
//                 onChanged: (p0) {
//                   setState(() {});
//                 },
//               ),
//               SizedBox(height: 15),
//               Row(
//                 children: [
//                   Text('Phone', style: TextStyle(fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               SizedBox(height: 10),
//               TextFormConst(
//                 hintText: "Masukkan Nomor Telepon",
//                 controller: phoneController,
//                 onChanged: (p0) {
//                   setState(() {});
//                 },
//               ),
//               SizedBox(height: 15),
//               Row(
//                 children: [
//                   Text('City', style: TextStyle(fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               SizedBox(height: 10),
//               TextFormConst(
//                 hintText: "Masukkan Kota Anda",
//                 controller: cityController,
//                 onChanged: (p0) {
//                   setState(() {});
//                 },
//               ),
//               SizedBox(height: 30),
//               SizedBox(
//                 width: double.infinity,
//                 height: 60,
//                 child: ElevatedButton(
//                   onPressed: _handleSubmit,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromRGBO(40, 66, 177, 1),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                   ),
//                   child: Text("Simpan", style: TextStyle(color: Colors.white)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HalamanKonfirmasi extends StatelessWidget {
//   final String name;
//   final String city;

//   const HalamanKonfirmasi({super.key, required this.name, required this.city});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Konfirmasi")),
//       body: Center(
//         child: Text(
//           "Terima kasih, $name dari $city telah mendaftar.",
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }
