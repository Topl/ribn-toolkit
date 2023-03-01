import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:ribn_toolkit/constants/assets.dart';
import 'package:ribn_toolkit/constants/strings.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_input_field.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_text_field.dart';
import 'package:ribn_toolkit/widgets/atoms/error_bubble.dart';

class AmountField extends StatelessWidget {
  final TextEditingController controller;
  final bool hasError;
  final Function(String) onChanged;
  const AmountField({
    required this.controller,
    required this.hasError,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PortalTarget(
      visible: hasError,
      portalFollower: const ErrorBubble(
        errorText: Strings.invalidRecipientAddressError,
      ),
      anchor: const Aligned(follower: Alignment.topLeft, target: Alignment.bottomLeft),
      child: CustomInputField(
        tooltipIcon: Image.asset(
          RibnAssets.greyHelpBubble,
          width: 18,
        ),
        itemLabel: Strings.amount,
        item: CustomTextField(
          width: 310,
          height: 36,
          controller: controller,
          hintText: Strings.amountHint,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          hasError: hasError,

          // QQQQ probably remove
          onChanged: (String amount) {
            onChanged(amount);
          },
        ),
      ),
    );
  }
}
