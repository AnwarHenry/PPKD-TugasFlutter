// lib/pages/list_peserta.dart
// lib/pages/list_peserta.dart
import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas11/model/user.dart';
import 'package:ppkdb3/tugas11/sqflite/db_helper.dart';
import 'package:ppkdb3/tugas7-8/drawer.dart';

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
    _loadPeserta();
  }

  void _loadPeserta() {
    setState(() {
      pesertaList = DBHelper.instance.getAllUsers();
    });
  }

  void _showForm({User? user}) {
    final nameController = TextEditingController(text: user?.name ?? '');
    final emailController = TextEditingController(text: user?.email ?? '');
    final eventController = TextEditingController(text: user?.namaEvent ?? '');
    final kotaController = TextEditingController(text: user?.asalKota ?? '');

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(user == null ? "Tambah Peserta" : "Edit Peserta"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Nama"),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              TextField(
                controller: eventController,
                decoration: const InputDecoration(labelText: "Nama Event"),
              ),
              TextField(
                controller: kotaController,
                decoration: const InputDecoration(labelText: "Asal Kota"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text("Batal"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: Text(user == null ? "Simpan" : "Update"),
            onPressed: () async {
              if (nameController.text.isEmpty ||
                  emailController.text.isEmpty ||
                  eventController.text.isEmpty ||
                  kotaController.text.isEmpty) {
                return;
              }

              if (user == null) {
                await DBHelper.instance.insertUser(
                  User(
                    name: nameController.text,
                    email: emailController.text,
                    namaEvent: eventController.text,
                    asalKota: kotaController.text,
                  ),
                );
              } else {
                await DBHelper.instance.updateUser(
                  User(
                    id: user.id,
                    name: nameController.text,
                    email: emailController.text,
                    namaEvent: eventController.text,
                    asalKota: kotaController.text,
                  ),
                );
              }

              Navigator.pop(context);
              _loadPeserta();
            },
          ),
        ],
      ),
    );
  }

  void _deletePeserta(int id) async {
    await DBHelper.instance.deleteUser(id);
    _loadPeserta();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Peserta Event"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: "Kembali ke Drawer",
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const MyDrawer()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(),
        child: const Icon(Icons.add),
      ),
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
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  title: Text(p.name),
                  subtitle: Text("${p.email} • ${p.namaEvent} • ${p.asalKota}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => _showForm(user: p),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deletePeserta(p.id!),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}






// // lib/pages/list_peserta.dart
// import 'package:flutter/material.dart';
// import 'package:ppkdb3/tugas11/model/user.dart';
// import 'package:ppkdb3/tugas11/sqflite/db_helper.dart';
// import 'package:ppkdb3/tugas7-8/drawer.dart';

// class ListPesertaPage extends StatefulWidget {
//   const ListPesertaPage({super.key});

//   @override
//   State<ListPesertaPage> createState() => _ListPesertaPageState();
// }

// class _ListPesertaPageState extends State<ListPesertaPage> {
//   late Future<List<User>> pesertaList;

//   @override
//   void initState() {
//     super.initState();
//     pesertaList = DBHelper.instance.getAllUsers();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Daftar Peserta Event"),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.home),
//             tooltip: "Kembali ke Drawer",
//             onPressed: () {
//               Navigator.pushAndRemoveUntil(
//                 context,
//                 MaterialPageRoute(builder: (context) => const MyDrawer()),
//                 (route) => false, // Menghapus semua halaman sebelumnya
//               );
//             },
//           ),
//         ],
//       ),
//       body: FutureBuilder<List<User>>(
//         future: pesertaList,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text("Belum ada peserta"));
//           }

//           final data = snapshot.data!;
//           return ListView.builder(
//             itemCount: data.length,
//             itemBuilder: (context, index) {
//               final p = data[index];
//               return ListTile(
//                 title: Text(p.name),
//                 subtitle: Text("${p.email} • ${p.namaEvent} • ${p.asalKota}"),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }




// class ListPesertaPage extends StatefulWidget {
//   const ListPesertaPage({super.key});

//   @override
//   State<ListPesertaPage> createState() => _ListPesertaPageState();
// }

// class _ListPesertaPageState extends State<ListPesertaPage> {
//   late Future<List<User>> pesertaList;

//   @override
//   void initState() {
//     super.initState();
//     pesertaList = DBHelper.instance.getAllUsers();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Daftar Peserta Event"),
//         centerTitle: true,
//       ),
//       body: FutureBuilder<List<User>>(
//         future: pesertaList,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text("Belum ada peserta"));
//           }

//           final data = snapshot.data!;
//           return ListView.builder(
//             itemCount: data.length,
//             itemBuilder: (context, index) {
//               final p = data[index];
//               return ListTile(
//                 title: Text(p.name),
//                 subtitle: Text("${p.email} • ${p.namaEvent} • ${p.asalKota}"),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }



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
