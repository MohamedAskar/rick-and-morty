import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/charachter.dart';
import 'package:rick_and_morty/utils/colors.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;
  const CharacterWidget({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: ColorUtils.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: character.image,
            fit: BoxFit.cover,
            height: 200,
          ),
        ],
      ),
    );
  }
}
