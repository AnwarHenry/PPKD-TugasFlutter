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
  List<Welcome> _allUsers = [];
  List<Welcome> _filteredUsers = [];
  String _searchQuery = "";
  String _selectedCategory = "Title";
  final String _sortOption = "A-Z";

  final List<String> _categories = [
    "Title",
    "Director",
    "Producer",
    "Release Year",
  ];

  final List<String> _sortOptions = ["A-Z", "Z-A"];

  @override
  void initState() {
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

    // Sorting data
    results.sort((a, b) {
      final titleA = (a.title ?? "").toLowerCase();
      final titleB = (b.title ?? "").toLowerCase();

      if (_sortOption == "A-Z") {
        return titleA.compareTo(titleB);
      } else {
        return titleB.compareTo(titleA);
      }
    });

    setState(() {
      _filteredUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

            // 📃 List data + RefreshIndicator
            Expanded(
              child: RefreshIndicator(
                onRefresh: _loadUsers,
                child: _filteredUsers.isEmpty
                    ? const Center(child: Text("No data found"))
                    : ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: _filteredUsers.length,
                        itemBuilder: (context, index) {
                          final dataUser = _filteredUsers[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  dataUser.image ?? "",
                                  width: 100,
                                  height: 140,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                dataUser.title ?? "",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                                        DetailGhibli(welcome: dataUser),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
