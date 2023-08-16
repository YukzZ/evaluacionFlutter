import 'package:evaluacion_flutter/app/modules/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    late HomeCubit cubit;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: BlocProvider(
        create: (_) => GetIt.I.get<HomeCubit>(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            cubit = context.read<HomeCubit>();
            return Column(
              children: [
                const Center(
                  child: Text('Hola mundo'),
                ),
                TextButton(
                  onPressed: () {
                    cubit.getAll();
                  },
                  child: const Text('Subornidados'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
