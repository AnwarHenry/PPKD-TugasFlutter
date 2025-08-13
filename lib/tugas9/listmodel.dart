import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ppkdb3/tugas9/models/modelPakaian.dart';

class Listmodel extends StatefulWidget {
  const Listmodel({super.key});

  @override
  State<Listmodel> createState() => _ListmodelState();
}

class _ListmodelState extends State<Listmodel> {
  final List<ModelPakaianPria> produkModel = [
    ModelPakaianPria(
      namaPakaian: "Jas",
      hargaPakaian: 250000,
      warnaPakaian: Colors.blue,
      gambarProduk: "assets/images/jas.png",
    ),
    ModelPakaianPria(
      namaPakaian: "Kaos",
      hargaPakaian: 50000,
      warnaPakaian: Colors.red,
      gambarProduk: "assets/images/kaos.png",
    ),
    ModelPakaianPria(
      namaPakaian: "Rompi",
      hargaPakaian: 40000,
      warnaPakaian: Colors.yellow,
      gambarProduk: "assets/images/rompi.png",
    ),
    ModelPakaianPria(
      namaPakaian: "Jaket",
      hargaPakaian: 150000,
      warnaPakaian: Colors.red,
      gambarProduk: "assets/images/jaket.png",
    ),
    ModelPakaianPria(
      namaPakaian: "Hoodie",
      hargaPakaian: 200000,
      warnaPakaian: Colors.blueAccent,
      gambarProduk: "assets/images/hoodie.png",
    ),
    ModelPakaianPria(
      namaPakaian: "Kemeja",
      hargaPakaian: 90000,
      warnaPakaian: Colors.deepPurpleAccent,
      gambarProduk: "assets/images/kemeja.png",
    ),
    ModelPakaianPria(
      namaPakaian: "Sweater",
      hargaPakaian: 140000,
      warnaPakaian: Colors.pink,
      gambarProduk: "assets/images/sweater.png",
    ),
    ModelPakaianPria(
      namaPakaian: "Baju Koko",
      hargaPakaian: 150000,
      warnaPakaian: Colors.purple,
      gambarProduk: "assets/images/bajukoko.png",
    ),
    ModelPakaianPria(
      namaPakaian: "Celana Panjang",
      hargaPakaian: 60000,
      warnaPakaian: Colors.cyanAccent,
      gambarProduk: "assets/images/celanapanjang.png",
    ),
    ModelPakaianPria(
      namaPakaian: "Setelan Olahraga",
      hargaPakaian: 120000,
      warnaPakaian: Colors.green,
      gambarProduk: "assets/images/setelanolahraga.png",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            // physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: produkModel.length,
            itemBuilder: (BuildContext context, int index) {
              final dataProdukModel = produkModel[index];
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(dataProdukModel.gambarProduk),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  dataProdukModel.namaPakaian,
                  // subtitle: Text("Rp ${dataProdukModel.hargaMakanan.toString()}"),
                ),
                subtitle: Text(
                  "Rp ${NumberFormat('#,###').format(dataProdukModel.hargaPakaian)}",
                ),
                trailing: ElevatedButton.icon(
                  icon: const Icon(Icons.shopping_cart, size: 16),
                  label: const Text("Beli"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 210, 84, 25),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  onPressed: () {
                    // Muncul snackbar Produk ditambahkan ke keranjang
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "${dataProdukModel.namaPakaian} ditambahkan ke keranjang",
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
