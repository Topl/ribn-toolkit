import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_icon_button.dart';

class CustomModal {
  static AlertDialog renderCustomModal({
    required BuildContext context,
    required Text title,
    required Widget body,
    double elevation = 0,
    List<Widget>? actions,
    MainAxisAlignment? actionsAlignment,
  }) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(10),
      actionsPadding:
          actions != null ? const EdgeInsets.only(bottom: 40) : EdgeInsets.zero,
      contentPadding: const EdgeInsets.only(left: 40, right: 40, bottom: 40),
      insetPadding: const EdgeInsets.symmetric(horizontal: 4),
      backgroundColor: RibnColors.background,
      elevation: elevation,
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
      content: SingleChildScrollView(
        child: Column(
          children: [
            title,
            const SizedBox(height: 30),
            body,
          ],
        ),
      ),
      actions: actions ?? [],
      actionsAlignment: actionsAlignment,
    );
  }
}
