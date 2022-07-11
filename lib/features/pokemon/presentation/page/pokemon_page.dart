import 'package:auto_route/auto_route.dart';
import 'package:etiya_assignment/core/app_router.dart';
import 'package:etiya_assignment/core/app_theme.dart';
import 'package:etiya_assignment/core/widgets/base_cached_network_image_widget.dart';
import 'package:etiya_assignment/core/widgets/base_error_widget.dart';
import 'package:etiya_assignment/features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:etiya_assignment/features/pokemon/presentation/bloc/pokemon_event.dart';
import 'package:etiya_assignment/features/pokemon/presentation/bloc/pokemon_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  @override
  void initState() {
    super.initState();
    _loadPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonListBloc, PokemonListState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<PokemonListBloc>(context);
        return Scaffold(
          appBar: _buildAppBar(bloc, state),
          body: (state.status == PokemonListStatus.loading)
              ? _buildLoadingIndicator()
              : state.searchQuery.isNotEmpty
                  ? _buildSearchResults(bloc, state)
                  : (state.status == PokemonListStatus.loaded)
                      ? _buildLoaded(bloc, state)
                      : _buildError(bloc),
        );
      },
    );
  }

  _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _buildAppBar(PokemonListBloc bloc, PokemonListState state) {
    return AppBar(
      centerTitle: true,
      title: bloc.state.isSearchOpened == false
          ? const Text("Pokemon App",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic))
          : _buildSearchBar(bloc),
      backgroundColor: Colors.orange.shade200,
      actions: [
        state.isSearchOpened
            ? const SizedBox()
            : IconButton(
                onPressed: () {
                  bloc.add(SearchIconTappedEvent());
                },
                icon: const Icon(Icons.search)),
      ],
    );
  }

  _buildSearchBar(PokemonListBloc bloc) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: TextField(
          onChanged: (searchQuery) {
            bloc.add(SearchQueryChangedEvent(searchQuery));
          },
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  bloc.add(SearchClosedTappedEvent());
                },
              ),
              hintText: 'Search...',
              border: InputBorder.none),
        ),
      ),
    );
  }

  _buildEmptySearchList() {
    return Center(
      child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            "Sorry, no pokemon found in the current list. Please try with a different keyword :( ",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 18),
          )),
    );
  }

  _buildError(PokemonListBloc bloc) {
    return BaseErrorWidget(
      onPressed: () => bloc.add(RefreshPokemonList()),
    );
  }

  _buildSearchResults(PokemonListBloc bloc, PokemonListState state) {
    return state.searchResults.isEmpty
        ? _buildEmptySearchList()
        : Container(
            color: Colors.white,
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Container(
                          height: 150,
                          color: AppTheme.primaryColor,
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(children: [
                            BaseCachedNetworkImageWidget(id: state.searchResults[index].id ?? 0),
                            const SizedBox(height: 5),
                            Text(
                              state.searchResults[index].name?.toUpperCase() ?? "",
                              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ]),
                        ),
                        onTap: () {
                          context.router.push(PokemonDetailsRoute(id: state.searchResults[index].id!));
                        },
                      );
                    },
                    itemCount: state.searchResults.length,
                  ),
                ),
              ],
            ),
          );
  }

  _buildLoaded(PokemonListBloc bloc, PokemonListState state) {
    return Container(
      color: Colors.grey.shade100,
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 10),
              Expanded(
                child: LazyLoadScrollView(
                  onEndOfPage: () {
                    bloc.add(LoadNextPage());
                  },
                  isLoading: state.isLoadingNewPage,
                  child: RefreshIndicator(
                    child: GridView.builder(
                      itemBuilder: (context, index) {
                        if ((index > (state.pokemonList?.length ?? 0) - 2)) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        return GestureDetector(
                          child: Card(
                            color: AppTheme.cardColor,
                            elevation: 5,
                            margin: const EdgeInsets.all(8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  BaseCachedNetworkImageWidget(id: state.pokemonList?[index].id ?? 0),
                                  const SizedBox(height: 5),
                                  Text(
                                    state.pokemonList![index].name?.toUpperCase() ?? "",
                                    style:
                                        const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            context.router.push(PokemonDetailsRoute(id: state.pokemonList![index].id!));
                          },
                        );
                      },
                      itemCount: (state.pokemonList?.length ?? 0) + (state.isLoadingNewPage ? 2 : 0),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    ),
                    onRefresh: () async {
                      bloc.add(RefreshPokemonList());
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _loadPokemonList() async {
    final bloc = BlocProvider.of<PokemonListBloc>(context);
    bloc.add(GetPokemonListInitialDataEvent());
  }
}
