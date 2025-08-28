import 'package:flutter/material.dart';
import 'package:ppkdb3/extension/navigation.dart';
import 'package:ppkdb3/preference/shared_preference.dart';
import 'package:ppkdb3/tugas15/view/login_api_screen.dart';
import 'package:ppkdb3/tugas7-8/drawer.dart';
import 'package:ppkdb3/utils/app_image.dart';

class SplashScreen01 extends StatefulWidget {
  const SplashScreen01({super.key});
  static const id = "/splash_screen";

  @override
  State<SplashScreen01> createState() => _SplashScreen01State();
}

class _SplashScreen01State extends State<SplashScreen01> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    bool? isLogin = await PreferenceHandler.getLogin();

    Future.delayed(Duration(seconds: 3)).then((value) async {
      print(isLogin);
      if (isLogin == true) {
        context.pushReplacementNamed(MyDrawer.id);
      } else {
        context.push(LoginAPIScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImage.iconGoogle),
            SizedBox(height: 20),
            Text("Welcome"),
          ],
        ),
      ),
    );
  }
}
