import 'package:auto_route/auto_route.dart';
import 'package:etiya_assignment/features/pokemon/presentation/page/pokemon_page.dart';
import 'package:etiya_assignment/features/pokemon_details/presentation/page/pokemon_details_page.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: PokemonPage, path: '/pokemon', initial: true),
    AutoRoute(page: PokemonDetailsPage, path: ':id'),
  ],
)
class AppRouter extends _$AppRouter {}
