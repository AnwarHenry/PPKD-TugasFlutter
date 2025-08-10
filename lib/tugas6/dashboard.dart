// import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas6/aboutme.dart';
import 'package:ppkdb3/tugas6/checkbox.dart';
import 'package:ppkdb3/tugas6/tugas6.dart';
// import 'package:ppkdb3/tugas6/datepicker.dart';
// import 'package:ppkdb3/tugas6/dropdown.dart';
// import 'package:ppkdb3/tugas6/switch.dart';
// import 'package:ppkdb3/tugas6/timepacker.dart';

enum _SelectedTab { Home, Search, Add, Likes, Profile }

class Dashboard extends StatefulWidget {
  final Map<String, String> userData;

  const Dashboard({super.key, required this.userData});

  @override
  State<Dashboard> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  _SelectedTab _selectedTab = _SelectedTab.Home;

  void _handleIndexChanged(int index) {
    setState(() {
      _selectedTab = _SelectedTab.values[index];
    });

    if (_SelectedTab.values[index] == _SelectedTab.Profile) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AboutMe()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 47, 33, 243),
              ),
              child: const Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Dashboard(userData: widget.userData),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Me'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutMe()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.check_box),
              title: const Text('CheckBox'),
              onTap: () {
                // Implement settings functionality here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CheckBox()),
                );
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.switch_left),
            //   title: const Text('Switch'),
            //   onTap: () {
            //     // Implement settings functionality here
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const Switch(),
            //       ),
            //     );
            //   },
            // ),
            // ListTile(
            //   leading: const Icon(Icons.expand_more),
            //   title: const Text('Dropdown'),
            //   onTap: () {
            //     // Implement settings functionality here
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const Dropdown(),
            //       ),
            //     );
            //   },
            // ),
            // ListTile(
            //   leading: const Icon(Icons.date_range),
            //   title: const Text('DatePicker'),
            //   onTap: () {
            //     // Implement settings functionality here
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const DatePicker(),
            //       ),
            //     );
            //   },
            // ),
            // ListTile(
            //   leading: const Icon(Icons.timelapse),
            //   title: const Text('TimePicker'),
            //   onTap: () {
            //     // Implement settings functionality here
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const TimePacker(),
            //       ),
            //     );
            //   },
            // ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/tugas6',
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      extendBody: true,
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
        backgroundColor: Colors.transparent, // transparan
        elevation: 0, // hilangkan shadow
      ),
      body: Stack(
        children: [
          // background image
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "assets/images/backgrounds/download.jpg",
              fit: BoxFit.fitHeight,
            ),
          ),

          // content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Selamat Datang di Dashboard!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  "Email: ${widget.userData['email']}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                Text(
                  "Password: ${widget.userData['password']}",
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const AboutMe()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: const Text('Logout'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CrystalNavigationBar(
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          unselectedItemColor: Colors.white70,
          backgroundColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
          borderWidth: 2,
          outlineBorderColor: Colors.white,
          onTap: _handleIndexChanged,
          items: [
            // NOTE: pass IconData (Icons.*), not Icon(...)
            CrystalNavigationBarItem(
              icon: Icons.home,
              unselectedIcon: Icons.home_outlined,
              selectedColor: const Color.fromARGB(255, 255, 255, 255),
              badge: Badge(
                label: Text("9+", style: TextStyle(color: Colors.white)),
              ),
            ),
            CrystalNavigationBarItem(
              icon: Icons.favorite,
              unselectedIcon: Icons.favorite_border,
              selectedColor: Colors.red,
            ),
            CrystalNavigationBarItem(
              icon: Icons.add,
              unselectedIcon: Icons.add_circle_outline,
              selectedColor: Colors.white,
            ),
            CrystalNavigationBarItem(
              icon: Icons.search,
              unselectedIcon: Icons.search_outlined,
              selectedColor: Colors.white,
            ),
            CrystalNavigationBarItem(
              icon: Icons.person,
              unselectedIcon: Icons.person_outline,
              selectedColor: const Color.fromARGB(255, 255, 0, 0),
            ),
          ],
        ),
      ),
    );
  }
}
