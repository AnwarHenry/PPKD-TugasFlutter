import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ppkdb3/preference/shared_preference.dart';
import 'package:ppkdb3/tugas15/api/endpoint/endpoint.dart';
import 'package:ppkdb3/tugas15/model/get_user_model.dart';
import 'package:ppkdb3/tugas15/model/register_model.dart';
import 'package:ppkdb3/tugas15/model/update_model.dart';

class AuthenticationAPI {
  static Future<RegisterUserModel> registerUser({
    required String email,
    required String password,
    required String name,
  }) async {
    final url = Uri.parse(Endpoint.register);
    final response = await http.post(
      url,
      body: {"name": name, "email": email, "password": password},
    );
    if (response.statusCode == 200) {
      return RegisterUserModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"] ?? "Register gagal");
    }
  }

  static Future<RegisterUserModel> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(Endpoint.login);
    final response = await http.post(
      url,
      body: {"email": email, "password": password},
    );

    if (response.statusCode == 200) {
      return RegisterUserModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"] ?? "Login gagal");
    }
  }

  static Future<GetUserModel> getProfile() async {
    final url = Uri.parse(Endpoint.profile);
    final token = await PreferenceHandler.getToken();
    if (token == null) {
      throw Exception("Token tidak tersedia. Silakan login kembali.");
    }

    final response = await http.get(
      url,
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200) {
      return GetUserModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"] ?? "Register gagal");
    }
  }

  static Future<UpdateProfileModel> updateProfile({
    required String name,
    required String email,
  }) async {
    final url = Uri.parse(Endpoint.profile);
    final token = await PreferenceHandler.getToken();

    if (token == null) {
      throw Exception("Token tidak tersedia. Silakan login kembali.");
    }

    final response = await http.put(
      url,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: {"name": name, "email": email},
    );

    if (response.statusCode == 200) {
      return UpdateProfileModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"] ?? "Update profile gagal");
    }
  }
}
