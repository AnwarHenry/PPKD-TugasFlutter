import 'package:flutter/material.dart';
import 'package:ppkdb3/preference/shared_preference.dart';
import 'package:ppkdb3/tugas15/view/login_api_screen.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.logout, color: Colors.red),
      tooltip: "Logout", // ini opsional, kalau tidak mau tooltip bisa hapus
      onPressed: () async {
        await PreferenceHandler.removeLogin();
        await PreferenceHandler.removeToken();

        // langsung keluar ke login, hapus semua route sebelumnya
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const LoginAPIScreen()),
          (Route<dynamic> route) => false,
        );
      },
    );
  }
}
