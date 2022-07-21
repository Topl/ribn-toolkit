import 'package:flutter/cupertino.dart';
import 'package:ribn_toolkit/constants/colors.dart';

class CustomToggle extends StatelessWidget {
  final void Function(bool)? onChanged;
  final bool value;

  const CustomToggle({
    required this.onChanged,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      onChanged: onChanged,
      value: value,
      activeColor: RibnColors.primary,
    );
  }
}
