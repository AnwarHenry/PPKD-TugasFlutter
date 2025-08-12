import 'dart:convert';

import 'package:flutter/material.dart';

class PakaianPriaModel {
  final String namaPakaian;
  final int hargaPakaian;
  final Color warnaPakaiann;
  final String gambarProduk;

  MakananRinganModel({
    required this.namaPakaian,
    required this.hargaPakaian,
    required this.warnaPakaian,
    required this.gambarPakaian,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'namaMakanan': namaPakaian,
      'hargaMakanan': hargaPakain,
      'warnaMakanan': warnaPakaian.value,
      'gambarProduk': gambarProduk,
    };
  }

  factory PakaianPriaModel.fromMap(Map<String, dynamic> map) {
    return PakaianPriaModel(
      namaPakaian: map['Nama Pakaian'] as String,
      hargaPakaian: map['Harga Pakaian'] as int,
      warnaPakaian: Color(map['Warna'] as int),
      gambarProduk: map['gambarProduk'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PakaianPriaModel.fromJson(String source) =>
      PakaianPriaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
