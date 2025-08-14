// lib/pages/list_peserta.dart
import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas11/model/user.dart';
import 'package:ppkdb3/tugas11/sqflite/db_helper.dart';

class ListPesertaPage extends StatefulWidget {
  const ListPesertaPage({super.key});

  @override
  State<ListPesertaPage> createState() => _ListPesertaPageState();
}

class _ListPesertaPageState extends State<ListPesertaPage> {
  late Future<List<User>> pesertaList;

  @override
  void initState() {
    super.initState();
    pesertaList = DBHelper.instance.getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Peserta Event")),
      body: FutureBuilder<List<User>>(
        future: pesertaList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Belum ada peserta"));
          }

          final data = snapshot.data!;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final p = data[index];
              return ListTile(
                title: Text(p.name),
                subtitle: Text("${p.email} • ${p.namaEvent} • ${p.asalKota}"),
              );
            },
          );
        },
      ),
    );
  }
}



// 2)
// import 'package:flutter/material.dart';
// import 'package:ppkdb3/tugas11/model/user.dart';
// import 'package:ppkdb3/tugas11/sqflite/db_helper.dart';

// class ListPeserta extends StatefulWidget {
//   const ListPeserta({super.key});

//   @override
//   State<ListPeserta> createState() => _ListPesertaState();
// }

// class _ListPesertaState extends State<ListPeserta> {
//   List<User> listPeserta = [];
//   Future<void> _loadData() async {
//     final data = await DBHelper.instance.getAllUsers();
//     setState(() {
//       listPeserta = data;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _loadData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Daftar Peserta')),
//       body: listPeserta.isEmpty
//           ? const Center(child: Text('Belum ada peserta'))
//           : ListView.builder(
//               itemCount: listPeserta.length,
//               itemBuilder: (context, index) {
//                 final peserta = listPeserta[index];
//                 return ListTile(
//                   leading: const Icon(Icons.person),
//                   title: Text(peserta.name),
//                   subtitle: Text(
//                     '${peserta.email} - ${peserta.namaEvent} (${peserta.asalKota})',
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }




// 1)
//   void _loadData() async {
//     final data = await DBHelper().getUsers();
//     setState(() {
//       users = data;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _loadData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Daftar Peserta")),
//       body: ListView.builder(
//         itemCount: users.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(users[index].name),
//             subtitle: Text(
//               "${users[index].email} • ${users[index].namaEvent} • ${users[index].asalKota}",
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
