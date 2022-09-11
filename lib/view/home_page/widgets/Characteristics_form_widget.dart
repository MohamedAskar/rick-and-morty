import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rick_and_morty/utils/text_style.dart';

@immutable
class CharacteristicsForm extends StatelessWidget {
  CharacteristicsForm({
    Key? key,
    required this.status,
    required this.name,
    this.initialValue,
  }) : super(key: key);

  final List<String> status;
  final String name;
  String? initialValue;

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown<String>(
      name: name,
      initialValue: initialValue,
      style: CustomTextStyle.dp14MedBlack,
      allowClear: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
        border: const OutlineInputBorder(
            gapPadding: 0, borderRadius: BorderRadius.all(Radius.circular(8))),
        fillColor: Colors.black,
        label: Text(name, style: CustomTextStyle.dp14MedGrey),
      ),
      items: status.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
