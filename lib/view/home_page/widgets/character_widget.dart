import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rick_and_morty/models/charachter.dart';
import 'package:rick_and_morty/utils/text_style.dart';
import 'package:rick_and_morty/view/home_page/widgets/character_detail_widget.dart';
import 'package:rick_and_morty/view/home_page/widgets/dialogs.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;
  const CharacterWidget({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => characterDetailsDialog(context, character));
      },
      child: Container(
        width: double.maxFinite,
        height: size.height * 0.2,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: character.id,
              child: ClipRRect(
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
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(character.name, style: CustomTextStyle.dp16BoldBlack),
                  const SizedBox(height: 4),
                  CharacterDetailsWidget(
                      detail: character.status, icon: Ionicons.skull_outline),
                  CharacterDetailsWidget(
                      detail: character.gender,
                      icon: Ionicons.male_female_outline),
                  CharacterDetailsWidget(
                      detail: character.location.name,
                      icon: Ionicons.planet_outline),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
