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
      // Tambahan: dua tombol FAB di kanan bawah (tambah & kurang)
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btnKurang",
            child: const Icon(Icons.remove),
            //backgroundColor: Colors.red,
            onPressed: () {
              setState(() {
                if (counter > 0) counter--;
              });
              print("Counter dikurangi: $counter");
            },
          ),
          const SizedBox(width: 12),
          FloatingActionButton(
            heroTag: "btnTambah",
            child: const Icon(Icons.add),
            
            //backgroundColor: Colors.green,
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
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Tampilkan Nama
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      "Tampilkan Nama",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showName = !showName;
                        });
                      },
                      child: Text(showName ? "Sembunyikan" : "Tampilkan"),
                    ),
                    const SizedBox(height: 10),
                    if (showName)
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 40,
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      "Icon Button",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.deepPurpleAccent,
                        size: 40,
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
                      child: Text(showText ? "Sembunyikan" : "Tampilkan"),
                    ),
                    if (showText)
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(
                          text,
                          style: const TextStyle(fontSize: 16),
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Counter: $counter',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // InkWell dengan Gambar
            Card(
              elevation: 4,
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
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(16),
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

            const SizedBox(height: 20),

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
                    color: Colors.blue,
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