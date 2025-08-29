import 'package:flutter/material.dart';
import 'package:ppkdb3/preference/shared_preference.dart';
import 'package:ppkdb3/tugas10/formPendaftaran.dart';
import 'package:ppkdb3/tugas11/listPeserta.dart';
import 'package:ppkdb3/tugas14/view/get_api.dart';
import 'package:ppkdb3/tugas15/view/login_api_screen.dart';
import 'package:ppkdb3/tugas15/view/profile.dart';
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
  const MyDrawer({super.key});
  static const id = "/drawer";

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  int _selectedIndex = 0;

  /// Halaman yang ditampilkan
  final List<Widget> _pages = [
    const DashboardPage(),
    const Profile(),
    const CheckBoxPage(),
    const SwitchPage(),
    const DropdownPage(),
    const DatePickerPage(),
    const TimePickerPage(),
    const ListPakaian(),
    const ListmapPakaian(),
    const Listmodel(),
    const FormPendaftaranPage(),
    const ListPesertaPage(),
    const GetAPIScren(),
    const ProfileScreen(),
  ];

  /// Judul untuk setiap halaman
  final List<String> _titles = [
    "Dashboard",
    "About Me",
    "Syarat & Ketentuan",
    "Switch Mode Gelap",
    "Pilih Kategori Produk",
    "Pilih Tanggal Lahir",
    "Atur Pengingat",
    "List Pakaian",
    "List Map Pakaian",
    "List Model Pakaian",
    "Form Pendaftaran",
    "List Peserta",
    "Get API",
    "Profile - Tugas 15",
  ];

  /// Icon untuk setiap menu drawer
  final List<IconData> _icons = [
    Icons.dashboard,
    Icons.person,
    Icons.assignment,
    Icons.light_mode,
    Icons.category,
    Icons.date_range,
    Icons.alarm,
    Icons.checkroom,
    Icons.map,
    Icons.view_list,
    Icons.app_registration,
    Icons.people,
    Icons.api,
    Icons.account_circle,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onDrawerTapped(int index) {
    Navigator.pop(context);
    setState(() {
      _selectedIndex = index;
    });
  }

  // Fungsi logout
  Future<void> _logout() async {
    await PreferenceHandler.removeLogin();
    await PreferenceHandler.removeToken();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginAPIScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// BACKGROUND nature2.png full
          SizedBox.expand(
            child: Image.asset("assets/images/nature2.png", fit: BoxFit.cover),
          ),

          /// KONTEN
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,

              /// 🔥 Semua ikon AppBar putih
              iconTheme: const IconThemeData(color: Colors.white),

              title: Text(
                _titles[_selectedIndex],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      blurRadius: 6,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  /// Drawer Header
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/nature2.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),
                          ),
                          child: const CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(
                              'assets/images/profile1.jpg',
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Anwar H",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                              tooltip: "Logout",
                              onPressed: _logout,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// === List Menu Drawer ===
                  for (int i = 0; i < _titles.length; i++)
                    ListTile(
                      leading: Icon(_icons[i]),
                      title: Text(_titles[i]),
                      onTap: () => _onDrawerTapped(i),
                    ),
                ],
              ),
            ),
            body: _pages[_selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.black54,
              selectedItemColor: Colors.cyanAccent,
              unselectedItemColor: Colors.white70,
              currentIndex: _selectedIndex > 1 ? 0 : _selectedIndex,
              onTap: _onItemTapped,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
