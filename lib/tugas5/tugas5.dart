import 'package:flutter/material.dart';

class Tugas5 extends StatefulWidget {
  const Tugas5({super.key});
  @override
  State<Tugas5> createState() => _Tugas5State();
}

class _Tugas5State extends State<Tugas5> {
  int counter = 0;
  String icon = "SUKA!!!!!";
  String name = "Anwar";
  String text = "Ciluk BAAAA!!!!!!";
  bool showIcon = true;
  bool showName = true;
  bool showText = true;
  bool showGambar = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // FloatingActionButtons: Kurang, Reset, Tambah
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Tombol Tambah Count
          FloatingActionButton(
            heroTag: "btnTambah",
            child: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                counter++;
              });
              print("Counter ditambah: $counter");
            },
          ),
        ],
      ),

      appBar: AppBar(
        title: const Text("Tugas 5"),
        backgroundColor: const Color.fromARGB(206, 37, 33, 243),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Tampilkan Nama
            Card(
              color: Colors.lightBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text(
                      "Elevated Button",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showName = !showName;
                        });
                      },
                      child: Text(showName ? "Sembunyikan" : "Tampilkan Nama"),
                    ),

                    const SizedBox(height: 5),
                    if (showName)
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Icon Button
            Card(
              color: Colors.lightBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text(
                      "Icon Button",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.favorite,
                        color: Color.fromRGBO(255, 77, 77, 1),
                        size: 50,
                      ),
                      onPressed: () {
                        setState(() {
                          showIcon = !showIcon;
                        });
                      },
                    ),
                    if (showIcon)
                      Text(icon, style: const TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Text Button
            Card(
              color: Colors.lightBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      "Text Button",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          showText = !showText;
                        });
                      },
                      child: Text(
                        showText ? "Sembunyikan" : "Lihat Selengkapnya",
                      ),
                    ),
                    if (showText)
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          text,
                          style: const TextStyle(fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Counter Display
            Card(
              elevation: 4,
              color: Colors.lightBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Counter: $counter',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // InkWell dengan Gambar
            Card(
              elevation: 4,
              color: Colors.lightBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: () {
                  print("Kotak disentuh");
                  setState(() {
                    showGambar = !showGambar;
                  });
                },
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: showGambar
                      ? Image.asset(
                          "assets/images/cake1.jpg",
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        )
                      : const SizedBox(height: 200),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Gesture Detector
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: GestureDetector(
                onTap: () => print("Single Kill"),
                onDoubleTap: () => print("Double Kill"),
                onLongPress: () => print("Lama-lama Kill"),
                child: Container(
                  height: 48,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 33, 37, 243),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Tekan Aku",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
