import 'package:flutter/material.dart';

class Tugas4 extends StatelessWidget {
  const Tugas4({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cakeList = [
      {
        'name': 'Kue Tart 1',
        'price': 'Rp 180.000',
        'image': 'assets/images/cake1.jpg',
      },
      {
        'name': 'Kue Tart 2',
        'price': 'Rp 150.000',
        'image': 'assets/images/cake2.jpg',
      },
      {
        'name': 'Kue Tart 3',
        'price': 'Rp 250.000',
        'image': 'assets/images/cake3.jpg',
      },
      {
        'name': 'Kue Tart 4',
        'price': 'Rp 150.000',
        'image': 'assets/images/cake4.jpg',
      },
      {
        'name': 'Kue Tart 5',
        'price': 'Rp 220.000',
        'image': 'assets/images/cake5.jpg',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulir & Galeri'),
        backgroundColor: Colors.deepOrangeAccent,
        leading: Icon(Icons.menu), // 🔹 Ikon di kiri atas (biasanya menu)
        actions: [                 // 🔸 Ikon di kanan atas
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // aksi saat tombol kanan ditekan
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // aksi keluar
            },
          ),
        ],
        //centerTitle: true,
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Formulir Pesanan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Nama',
                        prefixIcon: Icon(Icons.person, color: Colors.blue),
                        fillColor: Colors.grey[300],
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email, color: Colors.black),
                        fillColor: Colors.grey[300],
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'No. HP',
                        prefixIcon: Icon(Icons.phone, color: Colors.green),
                        fillColor: Colors.grey[300],
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Deskripsi Pesanan',
                        prefixIcon: Icon(
                          Icons.description,
                          color: Colors.black,
                        ),
                        fillColor: Colors.grey[300],
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                    SizedBox(height: 1),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...cakeList.map((cake) {
                  return ListTile(
                    leading: Image.asset(
                      cake['image'],
                      width: 80,
                      height: 80,  
                      fit: BoxFit.cover,
                    ),
                    title: Text(cake['name']),
                    subtitle: Text(cake['price']),
                    trailing: Icon(Icons.add_shopping_cart),
                  );
                })//.toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
