// import 'package:flutter/material.dart';
// //import 'package:ppkdb3/tugas6/tugas6.dart';

// //import 'package:intl/date_symbol_data_local.dart';
// // import 'package:ppkdb3/tugas6/tugas6.dart';
// // import 'package:ppkdb3/day12/main_screen.dart';
// import 'package:ppkdb3/tugas7/tugas7.dart';
// //import 'package:ppkdb3/tugas7/checkbox.dart';
// // import 'package:ppkdb3/tugas6/tugas6.dart';
// // import 'package:ppkdb3/tugas7/tugas7.dart';

// // import 'package:ppkdb3/Jajal/navpop.dart';
// // import 'package:ppkdb3/Jajal/navpushRep.dart';
// // import 'package:ppkdb3/Jajal/navpushremove.dart';

// // import 'Jajal/login.dart';
// // import 'Jajal/register.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//   @override
//   State<MyApp> createState() => _MyApp();
// }

// class _MyApp extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Tugas 7 - Drawer Menu')),
//       drawer: const Tugas7(), // drawer dipanggil dari file tugas7.dart
//       body: const Center(
//         child: Text(
//           'Pilih menu dari Drawer untuk memulai',
//           style: TextStyle(fontSize: 16),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
//import 'package:ppkdb3/Jajal/login.dart';
import 'package:ppkdb3/tugas6/aboutme.dart';
import 'package:ppkdb3/tugas6/dashboard.dart';
import 'package:ppkdb3/tugas6/tugas6.dart';

void main() {
  initializeDateFormatting("id_ID");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Saya',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 255, 230, 0),
        ),
      ),
      home: Tugas6(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // debugShowCheckedModeBanner: false,
      routes: {
        '/dashboard': (context) =>
            Dashboard(userData: {'email': '', 'password': ''}),
        '/tugas6': (context) => const Tugas6(),
      },

      // home: const Tugas6(),
      // home: const SizeboxTesting(),
      // home: const DatePickerTest(),
      // home: const SwitchTesting(),
      // home: const DropdownTesting(),
      // home: const AboutMePage(),
      // home: const CheckboxTesting(),
      // debugShowCheckedModeBanner: false,
    );
  }
}
