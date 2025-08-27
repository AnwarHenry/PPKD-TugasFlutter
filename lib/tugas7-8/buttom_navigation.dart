// import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
// import 'package:ppkdb3/tugas2/profile.dart';
// // Import halaman kamu
// import 'package:ppkdb3/tugas7-8/dashboard.dart';

// class BottomNavigation extends StatelessWidget {
//   const BottomNavigation({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return PersistentTabView(
//       // Daftar tab yang ditampilkan
//       tabs: [
//         PersistentTabConfig(
//           screen: const DashboardPage(),
//           item: ItemConfig(
//             icon: const Icon(Icons.dashboard),
//             title: "Dashboard",
//             activeForegroundColor: Colors.white,
//             inactiveForegroundColor: Colors.grey,
//           ),
//         ),
//         PersistentTabConfig(
//           screen: const Profile(),
//           item: ItemConfig(
//             icon: const Icon(Icons.person),
//             title: "Profile",
//             activeForegroundColor: Colors.white,
//             inactiveForegroundColor: Colors.grey,
//           ),
//         ),
//       ],

//       // Builder untuk style navbar
//       navBarBuilder: (navBarConfig) => Style1BottomNavBar(
//         navBarConfig: navBarConfig,
//         // backgroundColor: Colors.blue,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:ppkdb3/tugas2/profile.dart';
// Import halaman contoh
import 'package:ppkdb3/tugas7-8/dashboard.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: const DashboardPage(),
          item: ItemConfig(
            icon: const Icon(Icons.dashboard),
            title: "Dashboard",
            activeForegroundColor: Colors.blue, // Warna ketika aktif
            inactiveForegroundColor: Colors.grey, // Warna ketika non-aktif
          ),
        ),
        PersistentTabConfig(
          screen: const Profile(),
          item: ItemConfig(
            icon: const Icon(Icons.person),
            title: "Profile",
            activeForegroundColor: Colors.green, // Warna aktif
            inactiveForegroundColor: Colors.grey, // Warna non-aktif
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
        // backgroundColor: Colors.white, // Bisa custom warna background
      ),
    );
  }
}
