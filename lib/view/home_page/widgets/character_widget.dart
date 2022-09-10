import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rick_and_morty/models/charachter.dart';
import 'package:rick_and_morty/utils/text_style.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;
  const CharacterWidget({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.maxFinite,
      height: size.height * 0.2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            child: CachedNetworkImage(
              imageUrl: character.image,
              width: size.width * 0.45,
              height: size.height * 0.2,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(character.name, style: CustomTextStyle.dp16BoldBlack),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Ionicons.skull_outline),
                    const SizedBox(width: 8),
                    Flexible(
                        child: Text(character.status,
                            style: CustomTextStyle.dp14MedBlack)),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Ionicons.person_outline),
                    const SizedBox(width: 8),
                    Flexible(
                        child: Text(character.species,
                            style: CustomTextStyle.dp14MedBlack)),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Ionicons.planet_outline),
                    const SizedBox(width: 8),
                    Flexible(
                        child: Text(
                      character.origin.name,
                      style: CustomTextStyle.dp14MedBlack,
                      overflow: TextOverflow.clip,
                    )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
