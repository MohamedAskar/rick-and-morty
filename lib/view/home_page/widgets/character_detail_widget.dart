
import 'package:flutter/material.dart';
import 'package:rick_and_morty/utils/text_style.dart';


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