import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_icon_button.dart';

class CustomModal {
  static AlertDialog renderCustomModal({
    required BuildContext context,
    required Text title,
    required Widget body,
  }) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(10),
      insetPadding: const EdgeInsets.symmetric(horizontal: 4),
      backgroundColor: RibnColors.background,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomIconButton(
            icon: const Icon(
              Icons.close,
              size: 24,
              color: RibnColors.greyText,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      content: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 310,
          maxWidth: MediaQuery.of(context).size.width,
        ),
        child: Column(
          children: [
            title,
            const SizedBox(height: 30),
            body,
          ],
        ),
      ),
    );
  }
}
