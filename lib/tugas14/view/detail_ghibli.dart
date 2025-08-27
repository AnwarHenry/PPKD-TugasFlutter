import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas14/model/user_model.dart';

class DetailGhibli extends StatelessWidget {
  final Welcome welcome;
  const DetailGhibli({super.key, required this.welcome});

  Widget _buildInfoTile(String label, String? value, IconData icon) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        subtitle: Text(value ?? "-", style: const TextStyle(fontSize: 14)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(welcome.title ?? "Detail Movie"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Poster Film
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                welcome.image ?? "",
                height: 500,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // Judul
            Center(
              child: Text(
                welcome.title ?? "",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),

            // Original Title
            Center(
              child: Text(
                "${welcome.originalTitle ?? ''} (${welcome.originalTitleRomanised ?? ''})",
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),

            // Deskripsi (pakai Card biar rapi)
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  welcome.description ?? "-",
                  style: const TextStyle(fontSize: 14, height: 1.5),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Informasi Detail
            _buildInfoTile("Director", welcome.director, Icons.movie_creation),
            _buildInfoTile("Producer", welcome.producer, Icons.person),
            _buildInfoTile(
              "Release Year",
              welcome.releaseDate,
              Icons.calendar_today,
            ),
            _buildInfoTile(
              "Running Time",
              "${welcome.runningTime} min",
              Icons.timer,
            ),

            const SizedBox(height: 20),

            // Banner Movie
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(welcome.movieBanner, fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}
