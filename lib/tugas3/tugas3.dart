import 'package:flutter/material.dart';

class Tugas3 extends StatelessWidget {
  const Tugas3({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulir & Galeri"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // FORMULIR
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              
              child: Column(
                children: [
                  Text(
                "Isi Formulir",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.blue
                      ),
                      border: OutlineInputBorder(),
                      labelText: "Nama", )
                    ),
                  //Icon(Icons.favorite, color: Colors.red),
                  SizedBox(height: 12),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Colors.grey
                      ),
                      border: OutlineInputBorder(),
                      labelText: "Email"),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 12),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone, color: Colors.green
                      ),
                      border: OutlineInputBorder(),
                      labelText: "No. HP"),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 12),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.description, color: Colors.black
                      ),
                      border: OutlineInputBorder(),
                      labelText: "Deskripsi"),
                    maxLines: 3,
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // GALERI
            Text(
              "Galeri",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 3, // atau 2 sesuai kebutuhan
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: List.generate(6, (index) {
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color:
                             Colors.primaries[index % Colors.primaries.length],
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Text(
                        'Gambar ${index + 1}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [Shadow(color: Colors.black, blurRadius: 2)],
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}