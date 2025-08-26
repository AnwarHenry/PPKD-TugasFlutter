import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas14/api/get_user.dart';
import 'package:ppkdb3/tugas14/model/user_model.dart';

class GetApiScreen extends StatefulWidget {
  const GetApiScreen({super.key});
  static const id = "/get_api_screen";

  @override
  State<GetApiScreen> createState() => _GetApiScrenState();
}

class _GetApiScrenState extends State<GetApiScreen> {
  @override
  // void initState() {
  //   super.initState();
  //   getUser();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Ghibli")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder<List<Welcome>>(
                future: getUser(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    final users = snapshot.data as List<Welcome>;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: users.length,
                      itemBuilder: (BuildContext context, int index) {
                        final dataUser = users[index];
                        print(users);
                        return ListTile(
                          leading: Image.network(dataUser.image ?? ""),
                          title: Text(dataUser.title ?? ""),
                          subtitle: Text("${dataUser.description} " ?? ""),
                        );
                      },
                    );
                  } else {
                    return Text("Gagal Memuat data");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
