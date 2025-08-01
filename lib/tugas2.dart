import 'package:flutter/material.dart';

class Tugas2 extends StatelessWidget {
  const Tugas2({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold (
      appBar: AppBar (
        title: Text (
          'Profile Saya', 
          style: TextStyle (
            fontSize: 25,
            fontWeight: FontWeight.bold,      
          ),
        ),
        centerTitle: true,
      ),
        body: Padding (
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [ 
              Center(
                child: Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/profile1.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Anwar Hidayat',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              SizedBox(height: 10),
              Text(
                'Data Analyst | Flutter Dev',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              
              SizedBox(height: 25),

              Row(
                children: [
                  Expanded (
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.email, color: Colors.white),
                          SizedBox(height: 10),
                          Text('anwarh@gmail.com'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Icon (Icons.phone, color: Colors.red),
                          SizedBox(height: 10),
                          Text('0812-3456-7890'),
                        ]
                    ),
                  ),
                ),
              ]
            ),
          ]
        ),
      ),
    );
  }
} 