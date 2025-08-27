import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas14/api/get_user.dart';
import 'package:ppkdb3/tugas14/model/user_model.dart';
import 'package:ppkdb3/tugas14/view/detail_ghibli.dart';

class GetAPIScren extends StatefulWidget {
  const GetAPIScren({super.key});
  static const id = "/get_api_screen";

  @override
  State<GetAPIScren> createState() => _GetAPIScreenState();
}

class _GetAPIScreenState extends State<GetAPIScren> {
  // Variabel untuk menyimpan semua data dari API
  List<Welcome> _allUsers = [];
  // Variabel untuk data hasil filter / pencarian
  List<Welcome> _filteredUsers = [];
  // Query pencarian yang diketik user
  String _searchQuery = "";
  // Kategori pencarian yang dipilih user
  String _selectedCategory = "Title";

  final List<String> _categories = [
    "Title",
    "Director",
    "Producer",
    "Release Year",
  ];

  @override
  void initState() {
    // Saat halaman pertama kali dibuka, ambil data dari API
    super.initState();
    _loadUsers();
  }

  // Ambil data film dari API
  Future<void> _loadUsers() async {
    final users = await getUser();
    setState(() {
      _allUsers = users;
      _filteredUsers = users;
    });
  }

  void _filterUsers() {
    List<Welcome> results = _allUsers;
    // Fungsi Kalau user mengetik sesuatu
    if (_searchQuery.isNotEmpty) {
      results = results.where((user) {
        switch (_selectedCategory) {
          case "Title":
            return (user.title ?? "").toLowerCase().contains(
              _searchQuery.toLowerCase(),
            );
          case "Director":
            return (user.director ?? "").toLowerCase().contains(
              _searchQuery.toLowerCase(),
            );
          case "Producer":
            return (user.producer ?? "").toLowerCase().contains(
              _searchQuery.toLowerCase(),
            );
          case "Release Year":
            return (user.releaseDate ?? "").toLowerCase().contains(
              _searchQuery.toLowerCase(),
            );
          default:
            return false;
        }
      }).toList();
    }

    // Update data yang akan ditampilkan
    setState(() {
      _filteredUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Ghibli Films")),
      body: SafeArea(
        child: Column(
          children: [
            // 🔍 Search Bar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search by $_selectedCategory...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: (value) {
                  _searchQuery = value;
                  _filterUsers();
                },
              ),
            ),

            // ⬇️ Dropdown Filter (kategori search)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: DropdownButtonFormField<String>(
                initialValue: _selectedCategory,
                items: _categories
                    .map(
                      (cat) => DropdownMenuItem(value: cat, child: Text(cat)),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                  _filterUsers();
                },
                decoration: InputDecoration(
                  labelText: "Search Category",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // 📃 List data
            Expanded(
              child: _filteredUsers.isEmpty
                  ? const Center(child: Text("No data found"))
                  : ListView.builder(
                      itemCount: _filteredUsers.length,
                      itemBuilder: (context, index) {
                        final dataUser = _filteredUsers[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          child: ListTile(
                            leading: Image.network(
                              dataUser.image ?? "",
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(dataUser.title ?? ""),
                            subtitle: Text(
                              "Director: ${dataUser.director ?? '-'}\n"
                              "Producer: ${dataUser.producer ?? '-'}\n"
                              "Year: ${dataUser.releaseDate ?? '-'}",
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailUser(welcome: dataUser),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
