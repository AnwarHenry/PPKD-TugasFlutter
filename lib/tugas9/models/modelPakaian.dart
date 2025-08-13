import 'dart:convert';

import 'package:flutter/material.dart';

class ModelPakaianPria {
  final String namaPakaian;
  final int hargaPakaian;
  final Color warnaPakaian;
  final String gambarProduk;

  ModelPakaianPria({
    required this.namaPakaian,
    required this.hargaPakaian,
    required this.warnaPakaian,
    required this.gambarProduk,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'namaPakaian': namaPakaian,
      'hargaPakaian': hargaPakaian,
      'warnaPakaian': warnaPakaian.value,
      'gambarProduk': gambarProduk,
    };
  }

  factory ModelPakaianPria.fromMap(Map<String, dynamic> map) {
    return ModelPakaianPria(
      namaPakaian: map['Nama Pakaian'] as String,
      hargaPakaian: map['Harga Pakaian'] as int,
      warnaPakaian: Color(map['Warna Pakaian'] as int),
      gambarProduk: map['gambarProduk'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelPakaianPria.fromJson(String source) =>
      ModelPakaianPria.fromMap(json.decode(source) as Map<String, dynamic>);
}
