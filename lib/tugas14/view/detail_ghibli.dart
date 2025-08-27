import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas14/model/user_model.dart';

class DetailGhibli extends StatelessWidget {
  final Welcome welcome;
  const DetailGhibli({super.key, required this.welcome});

  /// Mapping rating IMDb berdasarkan judul film dari list:
  /// https://www.imdb.com/list/ls022178941/
  String? _getImdbRating(String? title) {
    final Map<String, String> ratingMap = {
      'Spirited Away': '8.6',
      'Porco Rosso': '7.7',
      'Princess Mononoke': '8.3',
      'My Neighbor Totoro': '8.1',
      'Grave of the Fireflies': '8.5',
      'Howl\'s Moving Castle': '8.2',
      'Kiki\'s Delivery Service': '7.8',
      'Ponyo': '7.6',
      'The Wind Rises': '7.7',
      'Castle in the Sky': '8.0',
      'Nausicaä of the Valley of the Wind': '8.0',
      'The Tale of the Princess Kaguya': '8.0',
      'The Cat Returns': '7.1',
      'When Marnie Was There': '7.6',
      'Only Yesterday': '7.6',
      'From Up on Poppy Hill': '7.4',
      'Pom Poko': '7.3',
      'Whisper of the Heart': '7.9',
      'My Neighbors the Yamadas': '7.2',
      'Tales from Earthsea': '6.3',
      'Earwig and the Witch': '4.8',
      'Arrietty': '',
      'The Red Turtle': '',
    };
    return ratingMap[title];
  }

  Widget _buildInfoTile(String label, String? value, IconData icon) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF0B3866)),
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
    final String? ratingText = _getImdbRating(welcome.title);
    final double ratingValue = double.tryParse(ratingText ?? "") ?? 0.0;

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

            // Judul utama
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

            // Judul asli
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
            const SizedBox(height: 10),

            // ⭐ Rating IMDb (letaknya di bawah judul asli)
            if (ratingText != null)
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...List.generate(
                      5,
                      (i) => Icon(
                        i < (ratingValue / 2).round()
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.amber,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "$ratingText / 10",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 20),

            // Deskripsi
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
