import 'package:flutter/material.dart';
import 'package:ppkdb3/extension/navigation.dart';
import 'package:ppkdb3/tugas7/checkbox.dart';
import 'package:ppkdb3/tugas7/datepicker.dart';
import 'package:ppkdb3/tugas7/dropdown.dart';
import 'package:ppkdb3/tugas7/switch.dart';
import 'package:ppkdb3/tugas7/timepicker.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});
  static const id = "/drawer";

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int _selectedIndexDrawer = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    CheckBoxPage(),
    SwitchPage(),
    DropdownPage(),
    DatePickerPage(),
    TimePickerPage(),
  ];

  void onItemTap(int index) {
    setState(() {
      _selectedIndexDrawer = index;
    });
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions[_selectedIndexDrawer]),
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 57, 119, 155),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Lingkaran dengan border
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromARGB(172, 0, 0, 0),
                        width: 3,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/profile1.jpg'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Anwar H",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.check_box),
              title: const Text("Syarat & Ketentuan"),
              onTap: () => onItemTap(0),
            ),
            ListTile(
              leading: const Icon(Icons.dark_mode),
              title: const Text("Mode Gelap"),
              onTap: () => onItemTap(1),
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text("Pilih Kategori Produk"),
              onTap: () => onItemTap(2),
            ),
            ListTile(
              leading: const Icon(Icons.date_range),
              title: const Text("Pilih Tanggal Lahir"),
              onTap: () => onItemTap(3),
            ),
            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text("Atur Pengingat"),
              onTap: () => onItemTap(4),
            ),
          ],
        ),
      ),
    );
  }
}
