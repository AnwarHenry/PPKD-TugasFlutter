import 'package:flutter/material.dart';
// import 'package:ppkd_b_3/day_14/model/produk_model.dart';

class ListPakaian extends StatefulWidget {
  const ListPakaian({super.key});

  @override
  State<ListPakaian> createState() => _ListPakaianState();
}

class _ListPakaianState extends State<ListPakaian> {
  final List<String> pakaianPria = [
    "Jas",
    "Kaos",
    "Rompi",
    "Jaket",
    "Hoodie",
    "Kemeja",
    "Sweater",
    "Baju Koko",
    "Celana Panjang",
    "Setelan Olahraga",
  ];
  // final List<ProdukModel> produkModel = [
  //   ProdukModel(nama: "Baju", price: 50000, warna: Colors.blue),
  //   ProdukModel(nama: "Celana", price: 60000, warna: Colors.red),
  //   ProdukModel(nama: "Topi", price: 70000, warna: Colors.yellow),
  //   ProdukModel(nama: "Sepatu", price: 80000, warna: Colors.indigoAccent),
  // ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //List
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),

            shrinkWrap: true,
            itemCount: pakaianPria.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(pakaianPria[index]),
                leading: CircleAvatar(child: Text("${index + 1}")),
              );
            },
          ),
          // Divider(),
          // //List of Map
          // ListView.builder(
          //   physics: NeverScrollableScrollPhysics(),

          //   shrinkWrap: true,
          //   // itemCount: produk.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     // final dataProduk = produk[index];
          //     return ListTile(
          //       // title: Text(dataProduk["nama"]),
          //       // subtitle: Text(dataProduk["price"].toString()),
          //       // trailing: CircleAvatar(backgroundColor: dataProduk["warna"]),
          //       leading: CircleAvatar(
          //         backgroundColor: Colors.amber,
          //         child: Text("${index + 1}"),
          //       ),
          //     );
          //   },
          // ),
          //Model
          // Divider(),

          // ListView.builder(
          //   physics: NeverScrollableScrollPhysics(),
          //   shrinkWrap: true,
          //   itemCount: .length,
          //   itemBuilder: (BuildContext context, int index) {
          //     final dataProdukModel = produkModel[index];
          //     return ListTile(
          //       title: Text(dataProdukModel.nama),
          //       subtitle: Text(dataProdukModel.price.toString()),
          //       trailing: CircleAvatar(backgroundColor: dataProdukModel.warna),
          //       leading: CircleAvatar(
          //         backgroundColor: Colors.amber,
          //         child: Text("${index + 1}"),
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
