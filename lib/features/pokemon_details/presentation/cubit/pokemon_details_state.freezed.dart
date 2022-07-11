// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pokemon_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PokemonDetailsState {
  PokemonDetailsMode get mode => throw _privateConstructorUsedError;
  PokemonDetails? get pokemonDetails => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PokemonDetailsStateCopyWith<PokemonDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonDetailsStateCopyWith<$Res> {
  factory $PokemonDetailsStateCopyWith(
          PokemonDetailsState value, $Res Function(PokemonDetailsState) then) =
      _$PokemonDetailsStateCopyWithImpl<$Res>;
  $Res call({PokemonDetailsMode mode, PokemonDetails? pokemonDetails});
}

/// @nodoc
class _$PokemonDetailsStateCopyWithImpl<$Res>
    implements $PokemonDetailsStateCopyWith<$Res> {
  _$PokemonDetailsStateCopyWithImpl(this._value, this._then);

  final PokemonDetailsState _value;
  // ignore: unused_field
  final $Res Function(PokemonDetailsState) _then;

  @override
  $Res call({
    Object? mode = freezed,
    Object? pokemonDetails = freezed,
  }) {
    return _then(_value.copyWith(
      mode: mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as PokemonDetailsMode,
      pokemonDetails: pokemonDetails == freezed
          ? _value.pokemonDetails
          : pokemonDetails // ignore: cast_nullable_to_non_nullable
              as PokemonDetails?,
    ));
  }
}

/// @nodoc
abstract class _$$_PokemonDetailsStateCopyWith<$Res>
    implements $PokemonDetailsStateCopyWith<$Res> {
  factory _$$_PokemonDetailsStateCopyWith(_$_PokemonDetailsState value,
          $Res Function(_$_PokemonDetailsState) then) =
      __$$_PokemonDetailsStateCopyWithImpl<$Res>;
  @override
  $Res call({PokemonDetailsMode mode, PokemonDetails? pokemonDetails});
}

/// @nodoc
class __$$_PokemonDetailsStateCopyWithImpl<$Res>
    extends _$PokemonDetailsStateCopyWithImpl<$Res>
    implements _$$_PokemonDetailsStateCopyWith<$Res> {
  __$$_PokemonDetailsStateCopyWithImpl(_$_PokemonDetailsState _value,
      $Res Function(_$_PokemonDetailsState) _then)
      : super(_value, (v) => _then(v as _$_PokemonDetailsState));

  @override
  _$_PokemonDetailsState get _value => super._value as _$_PokemonDetailsState;

  @override
  $Res call({
    Object? mode = freezed,
    Object? pokemonDetails = freezed,
  }) {
    return _then(_$_PokemonDetailsState(
      mode: mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as PokemonDetailsMode,
      pokemonDetails: pokemonDetails == freezed
          ? _value.pokemonDetails
          : pokemonDetails // ignore: cast_nullable_to_non_nullable
              as PokemonDetails?,
    ));
  }
}

/// @nodoc

class _$_PokemonDetailsState implements _PokemonDetailsState {
  const _$_PokemonDetailsState({required this.mode, this.pokemonDetails});

  @override
  final PokemonDetailsMode mode;
  @override
  final PokemonDetails? pokemonDetails;

  @override
  String toString() {
    return 'PokemonDetailsState(mode: $mode, pokemonDetails: $pokemonDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PokemonDetailsState &&
            const DeepCollectionEquality().equals(other.mode, mode) &&
            const DeepCollectionEquality()
                .equals(other.pokemonDetails, pokemonDetails));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(mode),
      const DeepCollectionEquality().hash(pokemonDetails));

  @JsonKey(ignore: true)
  @override
  _$$_PokemonDetailsStateCopyWith<_$_PokemonDetailsState> get copyWith =>
      __$$_PokemonDetailsStateCopyWithImpl<_$_PokemonDetailsState>(
          this, _$identity);
}

abstract class _PokemonDetailsState implements PokemonDetailsState {
  const factory _PokemonDetailsState(
      {required final PokemonDetailsMode mode,
      final PokemonDetails? pokemonDetails}) = _$_PokemonDetailsState;

  @override
  PokemonDetailsMode get mode;
  @override
  PokemonDetails? get pokemonDetails;
  @override
  @JsonKey(ignore: true)
  _$$_PokemonDetailsStateCopyWith<_$_PokemonDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
