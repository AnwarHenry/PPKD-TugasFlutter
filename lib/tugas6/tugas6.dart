import 'package:flutter/material.dart';

class Tugas6 extends StatefulWidget {
  const Tugas6({super.key});

  @override
  State<Tugas6> createState() => _Tugas6();
}

class _Tugas6 extends State<Tugas6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: const Color(0xFF002366),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text('Login', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            const Text(
              "Hello Welcome Back",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),
            const Text(
              "Welcome back please\nsign in again",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),

            const SizedBox(height: 80),
            const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email, color: Colors.white),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Color(0xFF001f4d),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, color: Colors.white),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Color(0xFF001f4d),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 60),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Aksi saat login ditekan
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 70),
            const Row(
              children: [
                Expanded(child: Divider(color: Colors.white)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("or", style: TextStyle(color: Colors.white)),
                ),
                Expanded(child: Divider(color: Colors.white)),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.facebook, color: Colors.white),
                label: const Text("Facebook"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF001f4d),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Image.asset('assets/images/Google.png', height: 20),
                label: const Text("Gmail"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF001f4d),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: RichText(
                text: const TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(color: Colors.white),
                  children: [
                    TextSpan(
                      text: "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
