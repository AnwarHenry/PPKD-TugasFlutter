import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 Background nature
          SizedBox.expand(
            child: Image.asset('assets/images/nature2.png', fit: BoxFit.cover),
          ),

          // 🔹 Overlay gelap agar teks lebih kontras
          Container(color: Colors.black.withOpacity(0.4)),

          // 🔹 Konten utama
          SingleChildScrollView(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                const SizedBox(height: 60),

                // Foto Profil
                Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/profile1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Nama
                const Text(
                  'Anwar Hidayat',
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

                const SizedBox(height: 8),

                // Profesi
                Text(
                  'Junior Data Analyst | Android Dev',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.tealAccent.shade100,
                  ),
                ),

                const SizedBox(height: 30),

                // 🔹 Card kontak
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: Colors.white.withOpacity(0.85),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: const [
                              Icon(Icons.email, color: Colors.blueAccent),
                              SizedBox(height: 8),
                              Text(
                                'anwarh@gmail.com',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Card(
                        color: Colors.white.withOpacity(0.85),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: const [
                              Icon(Icons.phone, color: Colors.green),
                              SizedBox(height: 8),
                              Text(
                                '0812-3456-7890',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // 🔹 Postingan & Followers
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: Colors.white.withOpacity(0.85),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Icon(Icons.article, color: Colors.indigo),
                              SizedBox(height: 8),
                              Text(
                                "Postingan",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Card(
                        color: Colors.white.withOpacity(0.85),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Icon(Icons.favorite, color: Colors.redAccent),
                              SizedBox(height: 8),
                              Text(
                                "Followers",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // 🔹 Tentang Saya
                Card(
                  color: Colors.white.withOpacity(0.85),
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Tentang Saya",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(),
                        SizedBox(height: 10),
                        Text(
                          "Halo! Welcome to My Profile. "
                          "Saya seorang Junior Data Analyst dan Android Developer "
                          "yang tertarik pada pengolahan data, visualisasi, dan pengembangan aplikasi mobile.",
                          style: TextStyle(fontSize: 15, height: 1.4),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
