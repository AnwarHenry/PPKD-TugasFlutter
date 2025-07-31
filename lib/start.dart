import 'package:flutter/material.dart';

class StartWidget extends StatelessWidget {
  const StartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil Saya', 
          style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold 
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 40, 98, 104),
        actions: [
          Icon(Icons.favorite, color: Colors.red),
          Icon(Icons.message, color: Colors.white),
        ],
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Anwar Hidayat',
            style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Icon(Icons.location_on, color: const Color.fromARGB(255, 243, 33, 33)),
              Text(
                'DKI Jakarta, Indonesia',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          Column(
            children: [
              Text(
                "Man Jadda Wa Jadda - Siapa yang Bersungguh Sungguh pasti akan berhasil.",
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}