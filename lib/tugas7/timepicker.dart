import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

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
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final timeFormat = selectedTime != null
        ? DateFormat('hh:mm ').format(
            DateTime(
              now.year,
              now.month,
              now.day,
              selectedTime!.hour,
              selectedTime!.minute,
            ),
          )
        : null;

    return Scaffold(
      appBar: AppBar(title: const Text('Atur Pengingat')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _pickTime,
              child: const Text("Pilih Waktu Pengingat"),
            ),
            const SizedBox(height: 20),
            Text(
              timeFormat != null
                  ? "Pengingat diatur pukul: $timeFormat"
                  : "Belum memilih waktu",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
