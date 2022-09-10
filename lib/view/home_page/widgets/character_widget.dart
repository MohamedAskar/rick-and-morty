import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rick_and_morty/models/charachter.dart';
import 'package:rick_and_morty/utils/text_style.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;
  const CharacterWidget({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        showDialog(context: context, builder: (context) => _dialog(context));
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
                      detail: character.species, icon: Ionicons.person_outline),
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

  _dialog(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: size.width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: character.id,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: character.image,
                      width: double.maxFinite,
                      height: size.height * 0.4,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 22),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(character.name, style: CustomTextStyle.blackTitle),
                  const SizedBox(height: 3),
                  CharacterDetailsWidget(
                      detail: 'Status: ${character.status}',
                      icon: Ionicons.skull_outline),
                  CharacterDetailsWidget(
                      detail: 'Species: ${character.species}',
                      icon: Ionicons.person_outline),
                  CharacterDetailsWidget(
                      detail: 'No. Episode: ${character.episode.length}',
                      icon: Ionicons.tv_outline),
                  CharacterDetailsWidget(
                      detail:
                          'Creation Date: ${DateFormat('MMM dd, yyyy').format(character.created)}',
                      icon: Ionicons.today_outline),
                  CharacterDetailsWidget(
                      detail: (character.type.isEmpty)
                          ? 'Type: Unknown'
                          : 'Type: ${character.type}',
                      icon: Ionicons.analytics_outline),
                  CharacterDetailsWidget(
                      detail: 'Origin: ${character.origin.name}',
                      icon: Ionicons.planet_outline),
                  CharacterDetailsWidget(
                      detail: 'Current Location: ${character.location.name}',
                      icon: Ionicons.location_outline),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CharacterDetailsWidget extends StatelessWidget {
  const CharacterDetailsWidget({
    Key? key,
    required this.detail,
    required this.icon,
  }) : super(key: key);

  final String detail;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Flexible(
              child: Text(
            detail,
            style: CustomTextStyle.dp14MedBlack,
            overflow: TextOverflow.clip,
          )),
        ],
      ),
    );
  }
}
