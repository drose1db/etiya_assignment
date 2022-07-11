import 'package:auto_route/auto_route.dart';
import 'package:etiya_assignment/core/app_theme.dart';
import 'package:etiya_assignment/core/widgets/base_cached_network_image_widget.dart';
import 'package:etiya_assignment/core/widgets/base_error_widget.dart';
import 'package:etiya_assignment/features/pokemon_details/presentation/cubit/pokemon_details_cubit.dart';
import 'package:etiya_assignment/features/pokemon_details/presentation/cubit/pokemon_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonDetailsPage extends StatefulWidget {
  final int id;

  const PokemonDetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  @override
  void initState() {
    _initCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<PokemonDetailsCubit>(context);
        return Scaffold(
          backgroundColor: Colors.grey.shade200,
          resizeToAvoidBottomInset: false,
          body: cubit.state.mode == PokemonDetailsMode.error ? _buildError(cubit) : _buildLoaded(cubit),
        );
      },
    );
  }

  _buildError(PokemonDetailsCubit cubit) {
    return BaseErrorWidget(onPressed: () => cubit.init(widget.id));
  }

  _buildLoaded(PokemonDetailsCubit cubit) {
    final pokemonDetails = cubit.state.pokemonDetails;
    return Column(
      children: [
        const SizedBox(height: 50),
        Expanded(
          flex: 2,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    BaseCachedNetworkImageWidget(id: widget.id),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      context.router.pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new)),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  _buildPokemonInfoText("Pokemon name", pokemonDetails?.name, cubit.state),
                  _buildPokemonInfoText("Happiness", pokemonDetails?.baseHappiness.toString(), cubit.state),
                  _buildPokemonInfoText("Capture rate", pokemonDetails?.captureRate.toString(), cubit.state),
                  _buildPokemonInfoText("Habitat", pokemonDetails?.habitat?.name, cubit.state),
                  _buildPokemonInfoText("Color", pokemonDetails?.color?.name, cubit.state),
                  _buildPokemonInfoText("Shape", pokemonDetails?.shape?.name, cubit.state),
                  _buildPokemonInfoText(
                      "Description", pokemonDetails?.flavorTextEntries?.first.flavorText, cubit.state),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildPokemonInfoText(String? title, String? value, PokemonDetailsState state) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.cyan.shade800, Colors.purple]),
                borderRadius: BorderRadius.circular(15)),
            child: Text(
              title?.toUpperCase() ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
        const Icon(Icons.arrow_forward_outlined, color: Colors.black),
        const SizedBox(width: 5),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: state.mode == PokemonDetailsMode.loading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Text(
                    value?.toUpperCase() ?? "",
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
          ),
        ),
      ],
    );
  }

  _initCubit() async {
    final cubit = BlocProvider.of<PokemonDetailsCubit>(context);
    cubit.init(widget.id);
  }
}
