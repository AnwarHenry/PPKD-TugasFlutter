import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ppkdb3/extension/navigation.dart';
import 'package:ppkdb3/tugas7/drawer.dart';

class Tugas6 extends StatefulWidget {
  const Tugas6({super.key});
  static const id = "/main";

  @override
  State<Tugas6> createState() => _Tugas6();
}

class _Tugas6 extends State<Tugas6> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // Initialize any controllers or variables here if needed
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // Dispose of any controllers or resources here if needed
    super.dispose();
  }

  // void handleLogin() {
  //   if (_formKey.currentState!.validate()) {
  //     final email = emailController.text.trim();
  //     final password = passwordController.text.trim();

  //     if (validUsers.containsKey(email) && validUsers[email] == password) {
  //       final Map<String, String> userData = {
  //         'email': email,
  //         'password': password,
  //       };

  //       Navigator.pushNamed(context, '/dashboard', arguments: userData);
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text('Email atau password salah'),
  //           backgroundColor: Colors.red,
  //         ),
  //       );
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00224F),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF00224F),
        title: Text(
          "Login",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Icon(Icons.arrow_back_ios, size: 24, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Center(),
                  Padding(padding: const EdgeInsets.all(8)),
                  SizedBox(height: 40),
                  Text(
                    'Hello Welcome Back',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Welcome back please\nsign in again',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email tidak boleh kosong";
                        }
                        if (!value.contains("@")) {
                          return "Email tidak valid";
                        }
                        return null;
                      },
                      // onTap: () {
                      //   // Trigger validation when field is tapped
                      //   if (_formKey.currentState != null) {
                      //     _formKey.currentState!.validate();
                      //   }
                      // },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: passwordController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock, color: Colors.white),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password tidak boleh kosong";
                        }
                        if (value.length < 6) {
                          return 'Password terlalu pendek (minimal 6 karakter)';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        //Error dan sukses menggunakan ScaffoldMessenger dan formKey
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Berhasil Masuk"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    //Text("Berhasil Masuk"),
                                    SizedBox(height: 20),
                                    Lottie.asset(
                                      'assets/animations/success.json',
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    child: Text("Batal"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: Text("Lanjutkan"),
                                    onPressed: () {
                                      // context.pushNamed(MyDrawer.id);
                                      context.pushNamedAndRemoveUntil(
                                        MyDrawer.id,
                                        (Route<dynamic> route) => false,
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          // showDialog(
                          //   context: context,
                          //   builder: (BuildContext context) {
                          //     return AlertDialog(
                          //       title: Text("Berhasil Masuk"),
                          //       content: Column(
                          //         mainAxisSize: MainAxisSize.min,
                          //         children: [
                          //           Text("Berhasil Masuk"),
                          //            SizedBox(height: 20),
                          //           Lottie.asset(
                          //             'assets/animations/success.json',
                          //             width: 200,
                          //             height: 200,
                          //             fit: BoxFit.cover,
                          //           ),
                          //         ],
                          //       ),
                          //       actions: [
                          //         TextButton(
                          //           child: Text("Batal"),
                          //           onPressed: () {
                          //             Navigator.of(context).pop();
                          //           },
                          //         ),
                          //         TextButton(
                          //           child: Text("Lanjutkan"),
                          //           onPressed: () {
                          //             Navigator.of(context).pop();
                          //           },
                          //         ),
                          //       ],
                          //     );
                          //   },
                          // );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Login gagal!"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(600, 100),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00224F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              Row(
                children: [
                  Expanded(child: Divider(thickness: 0.5)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "or",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  Expanded(child: Divider(thickness: 0.5)),
                ],
              ),
              const SizedBox(height: 24),
              // Center(),
              Column(
                children: [
                  Center(),
                  // Tombol login with Facebook
                  ElevatedButton.icon(
                    onPressed: () {
                      print("Login with Facebook");
                    },
                    icon: Icon(Icons.facebook, color: Colors.white),
                    label: Text(
                      "Facebook",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF11325C),
                      minimumSize: Size(700, 100),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Tombol Login with Gmail
                  ElevatedButton.icon(
                    onPressed: () {
                      print("Login with Gmail");
                    },
                    icon: Image.asset(
                      "assets/images/Google.png",
                      height: 16,
                      width: 16,
                    ),
                    label: Text(
                      "Gmail",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF11325C),
                      minimumSize: Size(700, 100),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Center(
                child: GestureDetector(
                  onTap: () {
                    print('Navigasi ke halaman daftar');
                  },
                  child: const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
