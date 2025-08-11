import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ppkdb3/tugas6/tugas6.dart';
import 'package:ppkdb3/tugas7/drawer.dart';
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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
      ),
      initialRoute: "/login",
      routes: {
        "/login": (context) => Tugas6(),
        MyDrawer.id: (context) => MyDrawer(),
      },

      // initialRoute: "/",
      // routes: {
      //   "/": (context) => Tugas6(),
      //   // Day7GridView.id: (context) => Day7GridView(),
      //   MyDrawer.id: (context) => MyDrawer(),
      // },
      // home: LoginScreen(),

      ///TEST
      // debugShowCheckedModeBanner: false,
      // title: 'Profile Saya',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(
      //     seedColor: const Color.fromARGB(255, 255, 230, 0),
      //   ),
      // ),
      // home: Tugas6(),
      // // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // // debugShowCheckedModeBanner: false,
      // routes: {
      //   '/dashboard': (context) =>
      //       Dashboard(userData: {'email': '', 'password': ''}),
      //   '/tugas6': (context) => const Tugas6(),
      // },
    );
  }
}
