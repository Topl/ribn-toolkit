import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox(
      {required this.fillColor,
      required this.checkColor,
      required this.borderColor,
      required this.value,
      required this.onChanged,
      required this.label,
      Key? key})
      : super(key: key);

  final MaterialStateProperty<Color?> fillColor;
  final Color checkColor;
  final Color borderColor;
  final dynamic value;
  final dynamic onChanged;
  final dynamic label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(color: borderColor),
            ),
            constraints: const BoxConstraints(maxHeight: 20, maxWidth: 20),
            child: Checkbox(
              fillColor: fillColor,
              checkColor: checkColor,
              value: value,
              onChanged: onChanged,
            ),
          ),
        ),
        label,
      ],
    );
  }
}
