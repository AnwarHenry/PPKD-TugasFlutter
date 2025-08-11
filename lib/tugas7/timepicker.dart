import 'package:flutter/material.dart';

class TimePickerPage extends StatefulWidget {
  const TimePickerPage({super.key});

  @override
  State<TimePickerPage> createState() => _TimePickerPageState();
}

class _TimePickerPageState extends State<TimePickerPage> {
  TimeOfDay? selectedTime;

  Future<void> _pickTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 7, minute: 30),
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Atur Pengingat")),
      drawer: const Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Atur Pengingat", style: TextStyle(fontSize: 20)),
            ElevatedButton(
              onPressed: _pickTime,
              child: const Text("Pilih Waktu Pengingat"),
            ),
            const SizedBox(height: 20),
            Text(
              selectedTime != null
                  ? "Pengingat diatur pukul: ${selectedTime!.format(context)}"
                  : "Belum memilih waktu",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
