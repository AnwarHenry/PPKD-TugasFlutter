// import 'package:flutter/material.dart';
// import 'package:ppkdb3/tugas7/datepicker.dart';
// import 'package:ppkdb3/tugas7/dropdown.dart';
// import 'package:ppkdb3/tugas7/switch.dart';

// class Dashboard extends StatefulWidget {
//   const Dashboard({super.key});

//   @override
//   State<Dashboard> createState() => _Dashboard();
// }

// class _Dashboard extends State<Dashboard> {
//   bool isChecked = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Dashboard')),
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             const DrawerHeader(
//               decoration: BoxDecoration(color: Colors.blue),
//               child: Center(
//                 child: Text(
//                   'Menu Tugas 7',
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: const Icon(Icons.check_box),
//               title: const Text('Syarat & Ketentuan'),
//               onTap: () {},
//             ),
//             ListTile(
//               leading: const Icon(Icons.dark_mode),
//               title: const Text('Mode Gelap'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const SwitchPage()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.list),
//               title: const Text('Pilih Kategori Produk'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const Dropdown()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.date_range),
//               title: const Text('Pilih Tanggal Lahir'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const DatePicker()),
//                 );
//               },
//             ),
//             // ListTile(
//             //   leading: const Icon(Icons.access_time),
//             //   title: const Text('Atur Pengingat'),
//             //   onTap: () {
//             //     Navigator.push(
//             //       context,
//             //       MaterialPageRoute(builder: (context) => const TimePicker()),
//             //     );
//             //   },
//             // ),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CheckboxListTile(
//               title: const Text(
//                 "Saya menyetujui semua persyaratan yang berlaku",
//               ),
//               value: isChecked,
//               onChanged: (value) {
//                 setState(() {
//                   isChecked = value!;
//                 });
//               },
//             ),
//             Text(
//               isChecked
//                   ? "Lanjutkan pendaftaran diperbolehkan"
//                   : "Anda belum bisa melanjutkan",
//               style: const TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';

// // class Dashboard extends StatefulWidget {
// //   const Dashboard({super.key});

// //   @override
// //   State<Dashboard> createState() => _Dashboard();
// // }

// // class _Dashboard extends State<Dashboard> {
// //   bool _isChecked = false;
// //   bool _isSwitchOn = false;
// //   String _dropdownValue = 'Pilihan 1';
// //   DateTime? _selectedDate;
// //   TimeOfDay? _selectedTime;

// //   Future<void> _pickDate(BuildContext context) async {
// //     final DateTime? picked = await showDatePicker(
// //       context: context,
// //       initialDate: DateTime.now(),
// //       firstDate: DateTime(2000),
// //       lastDate: DateTime(2101),
// //     );
// //     if (picked != null) {
// //       setState(() {
// //         _selectedDate = picked;
// //       });
// //     }
// //   }

// //   Future<void> _pickTime(BuildContext context) async {
// //     final TimeOfDay? picked = await showTimePicker(
// //       context: context,
// //       initialTime: TimeOfDay.now(),
// //     );
// //     if (picked != null) {
// //       setState(() {
// //         _selectedTime = picked;
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Drawer(
// //       child: ListView(
// //         padding: EdgeInsets.zero,
// //         children: [
// //           const DrawerHeader(
// //             decoration: BoxDecoration(color: Colors.blue),
// //             child: Text(
// //               'Menu Drawer',
// //               style: TextStyle(color: Colors.white, fontSize: 20),
// //             ),
// //           ),
// //           // Checkbox
// //           ListTile(
// //             leading: Checkbox(
// //               value: _isChecked,
// //               onChanged: (bool? value) {
// //                 setState(() {
// //                   _isChecked = value ?? false;
// //                 });
// //               },
// //             ),
// //             title: const Text('Checkbox'),
// //           ),
// //           // Switch
// //           ListTile(
// //             leading: Switch(
// //               value: _isSwitchOn,
// //               onChanged: (bool value) {
// //                 setState(() {
// //                   _isSwitchOn = value;
// //                 });
// //               },
// //             ),
// //             title: const Text('Switch'),
// //           ),
// //           // Dropdown
// //           ListTile(
// //             title: DropdownButton<String>(
// //               value: _dropdownValue,
// //               onChanged: (String? newValue) {
// //                 setState(() {
// //                   _dropdownValue = newValue!;
// //                 });
// //               },
// //               items: <String>['Elektronik', 'Pakaian', 'Makanan', 'Lainnya']
// //                   .map(
// //                     (String value) => DropdownMenuItem<String>(
// //                       value: value,
// //                       child: Text(value),
// //                     ),
// //                   )
// //                   .toList(),
// //             ),
// //           ),
// //           // Pilih Tanggal
// //           ListTile(
// //             leading: const Icon(Icons.calendar_today),
// //             title: Text(
// //               _selectedDate == null
// //                   ? 'Pilih Tanggal'
// //                   : 'Tanggal: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
// //             ),
// //             onTap: () => _pickDate(context),
// //           ),
// //           // Pilih Jam
// //           ListTile(
// //             leading: const Icon(Icons.access_time),
// //             title: Text(
// //               _selectedTime == null
// //                   ? 'Pilih Jam'
// //                   : 'Jam: ${_selectedTime!.hour}:${_selectedTime!.minute.toString().padLeft(2, '0')}',
// //             ),
// //             onTap: () => _pickTime(context),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class Tugas7 extends StatelessWidget {
// //   const Tugas7({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Drawer(
// //       child: ListView(
// //         padding: EdgeInsets.zero,
// //         children: [
// //           const DrawerHeader(
// //             decoration: BoxDecoration(color: Colors.blue),
// //             child: Text('Menu Tugas 7', style: TextStyle(color: Colors.white)),
// //           ),
// //           ListTile(
// //             leading: const Icon(Icons.check_box),
// //             title: const Text('Syarat & Ketentuan'),
// //             onTap: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(builder: (_) => const CheckboxPage()),
// //               );
// //             },
// //           ),
// //           ListTile(
// //             leading: const Icon(Icons.dark_mode),
// //             title: const Text('Mode Gelap'),
// //             onTap: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(builder: (_) => const SwitchPage()),
// //               );
// //             },
// //           ),
// //           ListTile(
// //             leading: const Icon(Icons.category),
// //             title: const Text('Pilih Kategori Produk'),
// //             onTap: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(builder: (_) => const DropdownPage()),
// //               );
// //             },
// //           ),
// //           ListTile(
// //             leading: const Icon(Icons.date_range),
// //             title: const Text('Pilih Tanggal Lahir'),
// //             onTap: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(builder: (_) => const DatePickerPage()),
// //               );
// //             },
// //           ),
// //           ListTile(
// //             leading: const Icon(Icons.access_time),
// //             title: const Text('Atur Pengingat'),
// //             onTap: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(builder: (_) => const TimePickerPage()),
// //               );
// //             },
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
