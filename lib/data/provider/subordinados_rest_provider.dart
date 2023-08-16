import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:evaluacion_flutter/data/model/subordinados_model_ob.dart';
import 'package:evaluacion_flutter/data/provider/i_subordinados_data_source.dart';
import 'package:evaluacion_flutter/utils/utils.dart';
import 'package:flutter/foundation.dart';

class SubordinadosProvider implements ISubordinadosDataSource{
  @override
  Future<Either<Exception, List<SubordinadosGestorModelOb>>> getSubordinados({
    required int idUsuario,
  }) async {
    try{
      final responseData = await Dio().post(
        'https://www.webteam.mx/ServiceNewTeam/Tracker.Procesos.svc/GetSubordinadosGestor',
        data: json.encode({
          'Usuario': {
            'Id': idUsuario,
          }
        }),
      );
      final response = List<SubordinadosGestorModelOb>.from(
        Utils.getArguments(
          responseData.data!['GetSubordinadosGestor']
            .map(SubordinadosGestorModelOb.fromJson),
        ),
      );
      print(response);
      return Right(response);
      
    } catch (e) {
      log(e.toString());
      return Left(Exception(e.toString()));
    }
    

  }
  
}
