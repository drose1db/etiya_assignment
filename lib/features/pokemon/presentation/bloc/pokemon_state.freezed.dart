// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pokemon_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PokemonListState {
  PokemonListStatus get status => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  List<Pokemon>? get pokemonList => throw _privateConstructorUsedError;
  List<Pokemon> get searchResults => throw _privateConstructorUsedError;
  bool get isLoadingNewPage => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  dynamic get isSearchOpened => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PokemonListStateCopyWith<PokemonListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonListStateCopyWith<$Res> {
  factory $PokemonListStateCopyWith(
          PokemonListState value, $Res Function(PokemonListState) then) =
      _$PokemonListStateCopyWithImpl<$Res>;
  $Res call(
      {PokemonListStatus status,
      String searchQuery,
      List<Pokemon>? pokemonList,
      List<Pokemon> searchResults,
      bool isLoadingNewPage,
      int limit,
      dynamic isSearchOpened});
}

/// @nodoc
class _$PokemonListStateCopyWithImpl<$Res>
    implements $PokemonListStateCopyWith<$Res> {
  _$PokemonListStateCopyWithImpl(this._value, this._then);

  final PokemonListState _value;
  // ignore: unused_field
  final $Res Function(PokemonListState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? searchQuery = freezed,
    Object? pokemonList = freezed,
    Object? searchResults = freezed,
    Object? isLoadingNewPage = freezed,
    Object? limit = freezed,
    Object? isSearchOpened = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PokemonListStatus,
      searchQuery: searchQuery == freezed
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      pokemonList: pokemonList == freezed
          ? _value.pokemonList
          : pokemonList // ignore: cast_nullable_to_non_nullable
              as List<Pokemon>?,
      searchResults: searchResults == freezed
          ? _value.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<Pokemon>,
      isLoadingNewPage: isLoadingNewPage == freezed
          ? _value.isLoadingNewPage
          : isLoadingNewPage // ignore: cast_nullable_to_non_nullable
              as bool,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      isSearchOpened: isSearchOpened == freezed
          ? _value.isSearchOpened
          : isSearchOpened // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_PokemonListStateCopyWith<$Res>
    implements $PokemonListStateCopyWith<$Res> {
  factory _$$_PokemonListStateCopyWith(
          _$_PokemonListState value, $Res Function(_$_PokemonListState) then) =
      __$$_PokemonListStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {PokemonListStatus status,
      String searchQuery,
      List<Pokemon>? pokemonList,
      List<Pokemon> searchResults,
      bool isLoadingNewPage,
      int limit,
      dynamic isSearchOpened});
}

/// @nodoc
class __$$_PokemonListStateCopyWithImpl<$Res>
    extends _$PokemonListStateCopyWithImpl<$Res>
    implements _$$_PokemonListStateCopyWith<$Res> {
  __$$_PokemonListStateCopyWithImpl(
      _$_PokemonListState _value, $Res Function(_$_PokemonListState) _then)
      : super(_value, (v) => _then(v as _$_PokemonListState));

  @override
  _$_PokemonListState get _value => super._value as _$_PokemonListState;

  @override
  $Res call({
    Object? status = freezed,
    Object? searchQuery = freezed,
    Object? pokemonList = freezed,
    Object? searchResults = freezed,
    Object? isLoadingNewPage = freezed,
    Object? limit = freezed,
    Object? isSearchOpened = freezed,
  }) {
    return _then(_$_PokemonListState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PokemonListStatus,
      searchQuery: searchQuery == freezed
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      pokemonList: pokemonList == freezed
          ? _value._pokemonList
          : pokemonList // ignore: cast_nullable_to_non_nullable
              as List<Pokemon>?,
      searchResults: searchResults == freezed
          ? _value._searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<Pokemon>,
      isLoadingNewPage: isLoadingNewPage == freezed
          ? _value.isLoadingNewPage
          : isLoadingNewPage // ignore: cast_nullable_to_non_nullable
              as bool,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      isSearchOpened:
          isSearchOpened == freezed ? _value.isSearchOpened : isSearchOpened,
    ));
  }
}

/// @nodoc

class _$_PokemonListState implements _PokemonListState {
  const _$_PokemonListState(
      {required this.status,
      required this.searchQuery,
      final List<Pokemon>? pokemonList,
      final List<Pokemon> searchResults = const [],
      this.isLoadingNewPage = false,
      this.limit = 20,
      this.isSearchOpened = false})
      : _pokemonList = pokemonList,
        _searchResults = searchResults;

  @override
  final PokemonListStatus status;
  @override
  final String searchQuery;
  final List<Pokemon>? _pokemonList;
  @override
  List<Pokemon>? get pokemonList {
    final value = _pokemonList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Pokemon> _searchResults;
  @override
  @JsonKey()
  List<Pokemon> get searchResults {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResults);
  }

  @override
  @JsonKey()
  final bool isLoadingNewPage;
  @override
  @JsonKey()
  final int limit;
  @override
  @JsonKey()
  final dynamic isSearchOpened;

  @override
  String toString() {
    return 'PokemonListState(status: $status, searchQuery: $searchQuery, pokemonList: $pokemonList, searchResults: $searchResults, isLoadingNewPage: $isLoadingNewPage, limit: $limit, isSearchOpened: $isSearchOpened)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PokemonListState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.searchQuery, searchQuery) &&
            const DeepCollectionEquality()
                .equals(other._pokemonList, _pokemonList) &&
            const DeepCollectionEquality()
                .equals(other._searchResults, _searchResults) &&
            const DeepCollectionEquality()
                .equals(other.isLoadingNewPage, isLoadingNewPage) &&
            const DeepCollectionEquality().equals(other.limit, limit) &&
            const DeepCollectionEquality()
                .equals(other.isSearchOpened, isSearchOpened));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(searchQuery),
      const DeepCollectionEquality().hash(_pokemonList),
      const DeepCollectionEquality().hash(_searchResults),
      const DeepCollectionEquality().hash(isLoadingNewPage),
      const DeepCollectionEquality().hash(limit),
      const DeepCollectionEquality().hash(isSearchOpened));

  @JsonKey(ignore: true)
  @override
  _$$_PokemonListStateCopyWith<_$_PokemonListState> get copyWith =>
      __$$_PokemonListStateCopyWithImpl<_$_PokemonListState>(this, _$identity);
}

abstract class _PokemonListState implements PokemonListState {
  const factory _PokemonListState(
      {required final PokemonListStatus status,
      required final String searchQuery,
      final List<Pokemon>? pokemonList,
      final List<Pokemon> searchResults,
      final bool isLoadingNewPage,
      final int limit,
      final dynamic isSearchOpened}) = _$_PokemonListState;

  @override
  PokemonListStatus get status;
  @override
  String get searchQuery;
  @override
  List<Pokemon>? get pokemonList;
  @override
  List<Pokemon> get searchResults;
  @override
  bool get isLoadingNewPage;
  @override
  int get limit;
  @override
  dynamic get isSearchOpened;
  @override
  @JsonKey(ignore: true)
  _$$_PokemonListStateCopyWith<_$_PokemonListState> get copyWith =>
      throw _privateConstructorUsedError;
}
