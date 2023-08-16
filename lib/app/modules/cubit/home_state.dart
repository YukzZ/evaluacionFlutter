part of 'home_cubit.dart';


class HomeState extends Equatable{
  const HomeState({
    this.status = HomeEstatus.none,
    this.lsSubordinados = const <SubordinadosGestorModelOb>[],
  });

  final HomeEstatus status;
  final List<SubordinadosGestorModelOb> lsSubordinados;

  HomeState copyWith({
    HomeEstatus? status,
    List<SubordinadosGestorModelOb>? lsSubordinados,
  }){
    return HomeState(
      status: status ?? this.status,
      lsSubordinados: lsSubordinados ?? this.lsSubordinados,
    );
  }

  @override
  List<Object> get props => [status];

}

enum HomeEstatus { none, loading, success, failure, saveOk, saveError, }
