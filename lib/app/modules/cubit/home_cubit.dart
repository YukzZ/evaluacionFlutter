import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evaluacion_flutter/data/model/subordinados_model_ob.dart';
import 'package:evaluacion_flutter/data/provider/controller/subordinados_controller.dart'
          as subordinadosController;
import 'package:evaluacion_flutter/data/provider/i_subordinados_data_source.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this.iSubordinadosDataSource,
  ) : super(const HomeState());

  final ISubordinadosDataSource iSubordinadosDataSource;

  Future<void> getAll()async{
    
    emit(state.copyWith(
      status: HomeEstatus.loading,
    ));
    final responseSubordinados = await iSubordinadosDataSource.getSubordinados(
      idUsuario: 18654,
    );

    await responseSubordinados.fold((error) => null, (lsSubordinados)async{
      for(final subordinado in lsSubordinados){
        await subordinadosController.SubordinadosController()
          .insert(subordinadosGestorModelOb: subordinado);
      }
    });

    // print(subordinados);
  }
}
