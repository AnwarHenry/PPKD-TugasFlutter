import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePicker();
}

class _DatePicker extends State<DatePicker> {
  DateTime? selectedDate;

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pilih Tanggal Lahir')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _pickDate,
              child: const Text("Pilih Tanggal Lahir"),
            ),
            const SizedBox(height: 20),
            // Text(
            // selectedDate != null
            // ? "Tanggal Lahir: ${DateFormat('dd MMMM yyyy').format(selectedDate!)}"
            //     : "Belum memilih tanggal",
            // style: const TextStyle(fontSize: 16),
            // ),
          ],
        ),
      ),
    );
  }
}
