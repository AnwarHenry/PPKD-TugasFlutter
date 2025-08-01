import 'package:flutter/material.dart';

// void main() {
//   runApp(const ProfilApp());
// }

// class ProfilApp extends StatelessWidget {
//   const ProfilApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const ProfilLengkapPage(),
//     );
//   }
// }

class ProfilLengkapPage extends StatelessWidget {
  const ProfilLengkapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil Lengkap"),
        backgroundColor: const Color.fromARGB(255, 0, 105, 150),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Foto profil lingkaran
          const SizedBox(height: 30),
          const Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),
          ),

          // Baris 1 - Nama lengkap
          const SizedBox(height: 10),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Anwar Hidayat",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          // Baris 2 - Email
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: 
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: const [
                  Icon(Icons.email, color: Colors.blue),
                  SizedBox(width: 10),
                  Text(
                    "Anwarhidayat@email.com",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),

          // Baris 3 - No. Telepon
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: 
            Row(
              children: const [
                Icon(Icons.phone, color: Colors.red),
                SizedBox(width: 10),
                Text(
                  "0812-3456-7890",
                  style: TextStyle(fontSize: 16),
                ),
                Spacer(),
              ],
            ),
          ),

          // Baris 4 - Postingan & Followers
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: Container(
          //           padding: const EdgeInsets.all(16),
          //           color: Colors.teal.shade100,
          //           child: const Column(
          //             children: [
          //               Text("Postingan",
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.bold, fontSize: 16)),
          //               SizedBox(height: 5),
          //               Text("120"),
          //             ],
          //           ),
          //         ),
          //       ),
          //       const SizedBox(width: 10),
          //       Expanded(
          //         child: Container(
          //           padding: const EdgeInsets.all(16),
          //           color: Colors.teal.shade200,
          //           child: const Column(
          //             children: [
          //               Text("Followers",
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.bold, fontSize: 16)),
          //               SizedBox(height: 5),
          //               Text("3.5K"),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          // // Baris 5 - Deskripsi
          // const SizedBox(height: 20),
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 20),
          //   child: Text(
          //     "Halo! .",
          //     style: TextStyle(fontSize: 16),
          //     textAlign: TextAlign.justify,
          //   ),
          // ),

          // // Baris 6 - Shortcut ala WhatsApp
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       Expanded(
          //         child: Column(
          //           children: const [
          //             Icon(Icons.camera_alt, color: Colors.teal),
          //             SizedBox(height: 5),
          //             Text("Status", style: TextStyle(fontSize: 14)),
          //           ],
          //         ),
          //       ),
          //       Expanded(
          //         child: Column(
          //           children: const [
          //             Icon(Icons.call, color: Colors.teal),
          //             SizedBox(height: 5),
          //             Text("Panggilan", style: TextStyle(fontSize: 14)),
          //           ],
          //         ),
          //       ),
          //       Expanded(
          //         child: Column(
          //           children: const [
          //             Icon(Icons.chat, color: Colors.teal),
          //             SizedBox(height: 5),
          //             Text("Chat", style: TextStyle(fontSize: 14)),
          //           ],
          //         ),
          //       ),
          //       Expanded(
          //         child: Column(
          //           children: const [
          //             Icon(Icons.settings, color: Colors.teal),
          //             SizedBox(height: 5),
          //             Text("Pengaturan", style: TextStyle(fontSize: 14)),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          // Baris 7 - Hiasan Visual
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          ),
          Container(
            height: 40,
            color: const Color.fromARGB(255, 77, 133, 182),
            alignment: Alignment.center,
            child: const Text(
              "Terima kasih sudah mengunjungi profil saya!",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}