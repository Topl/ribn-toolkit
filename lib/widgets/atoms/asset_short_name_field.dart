import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/assets.dart';
import 'package:ribn_toolkit/constants/strings.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_input_field.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_text_field.dart';

/// An input field used on the [MintInputPage].
///
/// Allows the user to define the asset short name.
class AssetShortNameField extends StatefulWidget {
  /// Controller for the asset short name.
  final TextEditingController controller;

  /// Renders tooltip icon
  final Image tooltipIcon;

  const AssetShortNameField({Key? key, required this.controller, required this.tooltipIcon}) : super(key: key);

  @override
  _AssetShortNameFieldState createState() => _AssetShortNameFieldState();
}

class _AssetShortNameFieldState extends State<AssetShortNameField> {
  /// Max length of the asset short name.
  final int maxLength = 8;
  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      informationText: Strings.assetCodeShortInfo,
      itemLabel: Strings.assetShortName,
      item: CustomTextField(
        width: 186,
        maxLength: 8,
        controller: widget.controller,
        hintText: Strings.assetShortNameHint,
      ),
      tooltipIcon: widget.tooltipIcon,
    );
  }
}
