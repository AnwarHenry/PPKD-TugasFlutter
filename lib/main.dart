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
import 'package:ppkdb3/tugas7/dashboard.dart';

void main() {
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
      title: 'Tugas 7',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Dashboard(),
    );
  }
}
