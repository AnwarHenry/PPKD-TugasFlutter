import 'package:flutter/material.dart';

class ListmapPakaian extends StatefulWidget {
  const ListmapPakaian({super.key});

  @override
  State<ListmapPakaian> createState() => _ListmapPakaianState();
}

class _ListmapPakaianState extends State<ListmapPakaian> {
  final List<Map<String, dynamic>> produkPakaianPria = [
    {"nama": "Jas", "price": 150000, "gambar": "assets/images/jas.png"},
    {"nama": "Kaos", "price": 50000, "gambar": "assets/images/kaos.png"},
    {"nama": "Rompi", "price": 40000, "gambar": "assets/images/rompi.png"},
    {"nama": "Jaket", "price": 150000, "gambar": "assets/images/jaket.png"},
    {"nama": "Hoodie", "price": 200000, "gambar": "assets/images/hoodie.png"},
    {"nama": "Kemeja", "price": 90000, "gambar": "assets/images/kemeja.png"},
    {"nama": "Sweater", "price": 140000, "gambar": "assets/images/sweater.png"},
    {
      "nama": "Baju Koko",
      "price": 150000,
      "gambar": "assets/images/bajukoko.png",
    },
    {
      "nama": "Celana Panjang",
      "price": 60000,
      "gambar": "assets/images/celanapanjang.png",
    },
    {
      "nama": "Setelan Olahraga",
      "price": 120000,
      "gambar": "assets/images/setelanolahraga.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
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
        ),
      ],
    );
  }
}
