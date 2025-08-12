import 'package:flutter/material.dart';

class ListmapPakaian extends StatefulWidget {
  const ListmapPakaian({super.key});

  @override
  State<ListmapPakaian> createState() => _ListmapPakaianState();
}

class _ListmapPakaianState extends State<ListmapPakaian> {
  final List<Map<String, dynamic>> produkPakaianPria = [
    {"nama": "Jas", "price": 150000, "gambar": "assets/images/jas.png"},
    {"nama": "Kaos", "price": 8000, "gambar": "assets/images/kaos.png"},
    {"nama": "Rompi", "price": 9000, "gambar": "assets/images//."},
    {"nama": "Jaket", "price": 10000, "gambar": "assets/images//."},
    {"nama": "Hoodie", "price": 9000, "gambar": "assets/images//."},
    {"nama": "Kemeja", "price": 12000, "gambar": "assets/images//."},
    {"nama": "Sweater", "price": 9000, "gambar": "assets/images//."},
    {"nama": "Baju Koko", "price": 15000, "gambar": "assets/images//."},
    {"nama": "Celana Panjang", "price": 9000, "gambar": "assets/images//."},
    {"nama": "Setelan Olahraga", "price": 12000, "gambar": "assets/images//."},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          // physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: produkPakaianPria.length,
          itemBuilder: (BuildContext context, int index) {
            final dataProduk = produkPakaianPria[index];
            return
            // ListTile(
            //   title: Text(dataProduk["nama"]),
            //   subtitle: Text(dataProduk["price"].toString()),
            //   trailing: CircleAvatar(backgroundColor: dataProduk["warna"]),
            //   leading: CircleAvatar(
            //     backgroundColor: Colors.amber,
            //     child: Text("${index + 1}"),
            //   ),
            // );
            ListTile(
              title: Text(dataProduk["nama"]),
              subtitle: Text(dataProduk["price"].toString()),
              trailing: dataProduk["gambar"] == null
                  ? null
                  : CircleAvatar(child: Image.asset(dataProduk["gambar"])),
              leading: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text("${index + 1}"),
              ),
            );
          },
        ),
      ],
    );
  }
}
