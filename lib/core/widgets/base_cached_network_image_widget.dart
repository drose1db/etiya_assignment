import 'package:cached_network_image/cached_network_image.dart';
import 'package:etiya_assignment/network/endpoints.dart';
import 'package:flutter/material.dart';

class BaseCachedNetworkImageWidget extends StatelessWidget {
  final int id;

  const BaseCachedNetworkImageWidget({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Hero(
        tag: id,
        child: CachedNetworkImage(
          placeholder: (context, url) => const SizedBox(),
          errorWidget: (context, url, error) => const Icon(Icons.broken_image),
          imageUrl: Endpoints.getPokemonImageUrl(id),
        ),
      ),
    );
  }
}
