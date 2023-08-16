// ignore_for_file: unnecessary_null_comparison, avoid_dynamic_calls

import 'dart:convert';
import 'dart:developer';

import 'package:connection_status_bar/connection_status_bar.dart';
import 'package:dio/dio.dart';
import 'package:evaluacion_flutter/app/modules/cubit/home_cubit.dart';
import 'package:evaluacion_flutter/app/modules/view/home_page.dart';
import 'package:evaluacion_flutter/data/model/subordinados_model_ob.dart';
import 'package:evaluacion_flutter/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  List<dynamic> list = [];
  bool isConnection = true;

  @override
  void initState() {
    super.initState();
    getAll();
  }

  void getAll() async{
    try{
      final responseData = await Dio().post(
        'https://www.webteam.mx/ServiceNewTeam/Tracker.Procesos.svc/GetSubordinadosGestor',
        data: json.encode({
          'Usuario': {
            'Id': 18654,
          }
        }),
      );
      if(responseData.statusCode == 200){
        setState(() {
          list = responseData.data['GetSubordinadosGestorResult'] as List;
        });
      }
      print(responseData);
      
      
    } catch (e) {
      log('#################### $e');

    }
  }

  
  @override
  Widget build(BuildContext context) {
    late HomeCubit cubit;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ConnectionStatusBar(
              height: 35,
              width: double.infinity,
              color: Colors.red,
              title: const Text(
                'Por favor, resvisa tu conexión a internet',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index){
                final nombre = list[index]['Nombre'] as String;
                final apat = list[index]['Apat'] as String;
                final amat = list[index]['Amat'] as String;
                final idUserSeg = list[index]['idUsuarioSeg'] as int;
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15,),
                      Text('Nombre: $nombre'),
                      Text('Apellido Paterno: $apat'),
                      Text('Apellido Materno: $amat'),
                      Text('IdUsuarioSeg: $idUserSeg'),
                      const SizedBox(height: 15,),
                    ],
                  ),
                  // ListTile(
                  //   title: Text(list[index]['Nombre'] as String ),
                  //   subtitle: Text(list[index]['Apat'] as String),
                  // ),
                );
              },
              itemCount: list == null
              ? 0
              : list.length,
            ),
          ),
        ],
      ),
      floatingActionButton: TextButton(
        onPressed: () async{
          await Navigator.push(
            context, 
            MaterialPageRoute<void>(
              builder: (context) => const HomePage(),
            ),
          );
        },
        child: const Text('Subornidados'),
      ),
        
    );
  }
}
