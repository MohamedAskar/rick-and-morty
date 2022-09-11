import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rick_and_morty/models/charachter.dart';
import 'package:rick_and_morty/utils/text_style.dart';
import 'package:rick_and_morty/view/home_page/widgets/Characteristics_form_widget.dart';
import 'package:rick_and_morty/view/home_page/widgets/character_detail_widget.dart';
import 'package:rick_and_morty/view_model/providers.dart';

filterDialog({required BuildContext context}) {
  final formKey = GlobalKey<FormBuilderState>();
  final size = MediaQuery.of(context).size;
  const List<String> status = ['Alive', 'Dead', 'unknown'];
  const List<String> gender = ['Male', 'Female', 'Genderless', 'unknown'];
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Consumer(builder: (context, ref, child) {
            final filter = ref.watch(filterProvider);
            return Container(
              padding: const EdgeInsets.all(16),
              width: size.width * 0.8,
              child: FormBuilder(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Filters', style: CustomTextStyle.dp14MedBlack),
                    const SizedBox(height: 16),
                    CharacteristicsForm(
                      status: status,
                      name: 'Status',
                      initialValue: filter['Status'],
                    ),
                    const SizedBox(height: 16),
                    CharacteristicsForm(
                      status: gender,
                      name: 'Gender',
                      initialValue: filter['Gender'],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel',
                                style: CustomTextStyle.dp14MedRed)),
                        const SizedBox(width: 12),
                        TextButton(
                            onPressed: () {
                              if (formKey.currentState!.saveAndValidate()) {
                                final data = formKey.currentState!.value;
                                ref.read(filterProvider.notifier).state = {
                                  'Gender': data['Gender'],
                                  'Status': data['Status']
                                };
                                ref.watch(charachterProvider).getCharachter();

                                Navigator.pop(context);
                              }
                            },
                            child: Text('Apply',
                                style: CustomTextStyle.dp14MedBlack)),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      });
}

characterDetailsDialog(BuildContext context, Character character) {
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
                    detail: 'Gender: ${character.gender}',
                    icon: Ionicons.male_female_outline),
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
