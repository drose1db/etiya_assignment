import 'package:etiya_assignment/core/app_router.dart';
import 'package:etiya_assignment/core/app_theme.dart';
import 'package:etiya_assignment/core/injection_container.dart';
import 'package:etiya_assignment/features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:etiya_assignment/features/pokemon_details/presentation/cubit/pokemon_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  _setupLogging();
  runApp(MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print("${record.level.name}: ${record.time}: ${record.message}");
  });
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonListBloc>(create: (context) => PokemonListBloc()),
        BlocProvider<PokemonDetailsCubit>(create: (context) => PokemonDetailsCubit()),
      ],
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        title: 'Pokemon App',
        theme: ThemeData(
          primaryColor: AppTheme.primaryColor,
          primarySwatch: AppTheme.primarySwatchColor,
          fontFamily: 'Quicksand',
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
