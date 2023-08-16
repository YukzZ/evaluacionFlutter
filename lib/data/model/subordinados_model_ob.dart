// To parse this JSON data, do
//
//     final subordinadosGestorModelOb = 
//          subordinadosGestorModelObFromJson(jsonString);

import 'dart:convert';

import 'package:objectbox/objectbox.dart';

SubordinadosGestorModelOb subordinadosGestorModelObFromJson(String str) => 
  SubordinadosGestorModelOb.fromJson(json.decode(str) as Map<String, dynamic>);

String subordinadosGestorModelObToJson(SubordinadosGestorModelOb data) => 
  json.encode(data.toJson());

// class SubordinadosGestorModelOb {
//     List<GetSubordinadosGestorResult> getSubordinadosGestorResult;

//     SubordinadosGestorModelOb({
//         required this.getSubordinadosGestorResult,
//     });

//     factory SubordinadosGestorModelOb.fromJson(Map<String, dynamic> json) =>  
//              SubordinadosGestorModelOb(
//         getSubordinadosGestorResult: List<GetSubordinadosGestorResult>.from(
//            json["GetSubordinadosGestorResult"].map((x) => 
//                    GetSubordinadosGestorResult.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "GetSubordinadosGestorResult": List<dynamic>.from(
//              getSubordinadosGestorResult.map((x) => x.toJson())),
//     };
// }
@Entity()
class SubordinadosGestorModelOb {

    SubordinadosGestorModelOb({
        required this.amat,
        required this.apat,
        this.id=0,
        required this.nombre,
        required this.idUsuarioSeg,
        required this.idTeam,
    });

    factory SubordinadosGestorModelOb.fromJson(Map<String, dynamic> json) => SubordinadosGestorModelOb(
        amat: json['Amat'] as String,
        apat: json['Apat'] as String,
        idTeam: json['Id'] as int,
        nombre: json['Nombre'] as String ,
        idUsuarioSeg: json['idUsuarioSeg'] as int,
    );

    @Id(assignable: true)
    final int id;
    final String amat;
    final String apat;
    final String nombre;
    final int idTeam;
    final int idUsuarioSeg;

    SubordinadosGestorModelOb copyWith({
      String? amat,
      String? apat,
      int? id,
      String? nombre,
      int? idUsuarioSeg,
      int? idTeam,
    }) => SubordinadosGestorModelOb(
      amat: amat ?? this.amat, 
      apat: apat ?? this.apat, 
      idTeam: idTeam ?? this.idTeam, 
      nombre: nombre ?? this.nombre, 
      idUsuarioSeg: idUsuarioSeg ?? this.idUsuarioSeg,
      id: id ?? this.id,
    );

    Map<String, dynamic> toJson() => {
        'Amat': amat,
        'Apat': apat,
        'Id': id,
        'Nombre': nombre,
        'idUsuarioSeg': idUsuarioSeg,
    };

    Map<String, dynamic> toMap() => {
      'Amat': amat,
      'Apat': apat,
      'Id': id,
      'Nombre': nombre,
      'idUsuarioSeg': idUsuarioSeg,
    };
}
