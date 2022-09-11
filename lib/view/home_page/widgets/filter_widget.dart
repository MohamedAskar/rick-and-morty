import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/utils/colors.dart';
import 'package:rick_and_morty/utils/text_style.dart';
import 'package:rick_and_morty/view_model/providers.dart';

class FilterWidget extends ConsumerStatefulWidget {
  const FilterWidget({
    Key? key,
    required this.characteristic,
  }) : super(key: key);

  final String characteristic;

  @override
  FilterWidgetState createState() => FilterWidgetState();
}

class FilterWidgetState extends ConsumerState<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    final filter = ref.watch(filterProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        onTap: () {
          ref.read(filterProvider.notifier).state[widget.characteristic] = null;
          ref.watch(charachterProvider).getCharachter();
        },
        child: Chip(
          backgroundColor: ColorUtils.blue,
          label: Text(
            filter[widget.characteristic] ?? '',
            style: CustomTextStyle.dp14MedWhite,
          ),
          avatar: const Icon(
            Icons.close,
            color: ColorUtils.white,
          ),
        ),
      ),
    );
  }
}
