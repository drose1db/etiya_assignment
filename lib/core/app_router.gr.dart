// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    PokemonRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PokemonPage());
    },
    PokemonDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PokemonDetailsRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: PokemonDetailsPage(key: args.key, id: args.id));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/pokemon', fullMatch: true),
        RouteConfig(PokemonRoute.name, path: '/pokemon'),
        RouteConfig(PokemonDetailsRoute.name, path: ':id')
      ];
}

/// generated route for
/// [PokemonPage]
class PokemonRoute extends PageRouteInfo<void> {
  const PokemonRoute() : super(PokemonRoute.name, path: '/pokemon');

  static const String name = 'PokemonRoute';
}

/// generated route for
/// [PokemonDetailsPage]
class PokemonDetailsRoute extends PageRouteInfo<PokemonDetailsRouteArgs> {
  PokemonDetailsRoute({Key? key, required int id})
      : super(PokemonDetailsRoute.name,
            path: ':id', args: PokemonDetailsRouteArgs(key: key, id: id));

  static const String name = 'PokemonDetailsRoute';
}

class PokemonDetailsRouteArgs {
  const PokemonDetailsRouteArgs({this.key, required this.id});

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'PokemonDetailsRouteArgs{key: $key, id: $id}';
  }
}
