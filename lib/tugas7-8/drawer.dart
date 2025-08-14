import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas10/formPendaftaran.dart';
import 'package:ppkdb3/tugas2/profile.dart';
import 'package:ppkdb3/tugas7-8/checkbox.dart';
import 'package:ppkdb3/tugas7-8/dashboard.dart';
import 'package:ppkdb3/tugas7-8/datepickerpage.dart';
import 'package:ppkdb3/tugas7-8/dropdownpage.dart';
import 'package:ppkdb3/tugas7-8/switchpage.dart';
import 'package:ppkdb3/tugas7-8/timepickerpage.dart';
import 'package:ppkdb3/tugas9/listPakaian.dart';
import 'package:ppkdb3/tugas9/listmapPakaian.dart';
import 'package:ppkdb3/tugas9/listmodel.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key, required});
  static const id = "/drawer";

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    DashboardPage(), //index 0
    Profile(), //index 1
    CheckBoxPage(), //index 2
    SwitchPage(), //index 3
    DropdownPage(), //index 4
    DatePickerPage(), //index 5
    TimePickerPage(), //index 6
    ListPakaian(), //index 7
    ListmapPakaian(), //index 8
    Listmodel(), // index9
    FormPendaftaranPage(), // index 10
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onDrawerTapped(int index) {
    Navigator.pop(context); // Tutup drawer
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Tugas 7 dan 8")),

      // body: Center(child: _widgetOptions[_selectedIndexDrawer]),
      appBar: AppBar(title: const Text("Tugas Flutter")),
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
            // Divider(),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: const Text("Dashboard"),
              onTap: () => _onDrawerTapped(0),
            ),
            ListTile(
              leading: Icon(Icons.person_3_sharp),
              title: const Text("Profile"),
              onTap: () => _onDrawerTapped(1),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.check_box),
              title: const Text("Syarat & Ketentuan"),
              onTap: () => _onDrawerTapped(2),
            ),
            ListTile(
              leading: const Icon(Icons.dark_mode),
              title: const Text("Switch Mode Gelap"),
              onTap: () => _onDrawerTapped(3),
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text("Pilih Kategori Produk"),
              onTap: () => _onDrawerTapped(4),
            ),
            ListTile(
              leading: const Icon(Icons.date_range),
              title: const Text("Pilih Tanggal Lahir"),
              onTap: () => _onDrawerTapped(5),
            ),
            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text("Atur Pengingat"),
              onTap: () => _onDrawerTapped(6),
            ),
            Divider(),
            ListTile(
              leading: const Icon(Icons.list_sharp),
              title: const Text("List Pakaian"),
              onTap: () => _onDrawerTapped(7),
            ),
            ListTile(
              leading: const Icon(Icons.list_sharp),
              title: const Text("List Map Pakaian"),
              onTap: () => _onDrawerTapped(8),
            ),
            ListTile(
              leading: const Icon(Icons.list_sharp),
              title: const Text("List Model Pakaian"),
              onTap: () => _onDrawerTapped(9),
            ),
            ListTile(
              leading: const Icon(Icons.list_sharp),
              title: const Text("Form Pendaftaran"),
              onTap: () => _onDrawerTapped(10),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex > 1 ? 0 : _selectedIndex,
        // Kalau lagi buka drawer menu, bottomnav tetap highlight dashboard
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          // BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
      ),
    );
  }
}
