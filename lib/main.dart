import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ppkdb3/tugas6/tugas6.dart';
import 'package:ppkdb3/tugas7-8/drawer.dart';

// import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
// import 'package:ppkdb3/tugas7/switch.dart';
// import 'package:ppkdb3/tugas6/aboutme.dart';
// import 'package:ppkdb3/tugas6/dashboard.dart';
// import 'package:ppkdb3/tugas6/tugas6.dart';

void main() {
  initializeDateFormatting("id_ID");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        datePickerTheme: DatePickerThemeData(
          backgroundColor: Colors.blue.shade100,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
      ),
      initialRoute: "/login",
      routes: {
        "/login": (context) => Tugas6(),
        MyDrawer.id: (context) => MyDrawer(),
      },
    );
  }
}
