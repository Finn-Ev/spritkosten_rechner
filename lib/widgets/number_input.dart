import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInput extends StatelessWidget {
  const NumberInput({
    Key? key,
    required this.labelText,
    required this.onChanged,
    required this.maxLength,
    this.canBeNull = false,
    this.isInt = false,
    this.isLastField = false,
  }) : super(key: key);

  final String labelText;
  final Function(String) onChanged;
  final bool canBeNull;
  final bool isInt;
  final int maxLength;
  final bool isLastField;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: <TextInputFormatter>[
        LengthLimitingTextInputFormatter(maxLength),
        FilteringTextInputFormatter.allow(
          isInt ? RegExp(r'[0-9]') : RegExp(r'[0-9]+[.,]?[0-9]*'),
        ),
      ],
      validator: (value) => value!.isEmpty && !canBeNull ? "Bitte Wert eingeben" : null,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      onChanged: onChanged,
      textInputAction: isLastField ? TextInputAction.done : TextInputAction.next,
      // onEditingComplete:   widget.isLastField ? onEditingComplete : (){},
    );
  }
}
