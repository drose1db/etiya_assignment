import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;

  const Failure(this.message);

  @override
  List<Object> get props => [message ?? ""];

  @override
  String toString() {
    return message ?? "<<< No message provided for this Failure: $runtimeType >>>";
  }
}

class NoInternetConnectionFailure extends Failure {
  const NoInternetConnectionFailure() : super("NO INTERNET");
}

class PokemonServerExceptionFailure extends Failure {
  const PokemonServerExceptionFailure() : super('POKEMON SERVER EXCEPTION');
}
