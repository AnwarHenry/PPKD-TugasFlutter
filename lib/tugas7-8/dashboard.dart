import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background gambar
        SizedBox.expand(
          child: Image.asset("assets/images/nature2.png", fit: BoxFit.cover),
        ),

        // Konten di tengah
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                    255,
                    70,
                    0,
                    79,
                  ).withOpacity(0.8), // sedikit transparan
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.dashboard,
                  size: 124,
                  color: Color.fromARGB(240, 4, 182, 206),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '✨ Selamat Datang ✨\nDi Halaman Dashboard',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      blurRadius: 8,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
