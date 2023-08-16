import 'package:dartz/dartz.dart';
import 'package:evaluacion_flutter/data/model/subordinados_model_ob.dart';

abstract class ISubordinadosDataSource{
  Future<Either<Exception, List<SubordinadosGestorModelOb>>> getSubordinados({
    required int idUsuario,
  });
}
