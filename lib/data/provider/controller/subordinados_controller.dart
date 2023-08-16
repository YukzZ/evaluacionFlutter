import 'package:evaluacion_flutter/data/model/subordinados_model_ob.dart';
import 'package:evaluacion_flutter/data/provider/controller/database_controller.dart';

class SubordinadosController {
  Future<List<SubordinadosGestorModelOb>> getAll() async {
    final box = DataBaseController.store.box<SubordinadosGestorModelOb>();
    final lsSubordinados = box.getAll();
    return lsSubordinados;
  }

  Future<bool> insert({
    required SubordinadosGestorModelOb subordinadosGestorModelOb,
  })async{
    final box = DataBaseController.store.box<SubordinadosGestorModelOb>();
    final id = box.put(subordinadosGestorModelOb);
    return id > 0;
  }
}
