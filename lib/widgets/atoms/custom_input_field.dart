import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/assets.dart';
import 'package:ribn_toolkit/constants/styles.dart';
import 'package:ribn_toolkit/widgets/molecules/custom_tooltip.dart';

/// A wrapper widget used for custom input fields on transfer input pages.
class CustomInputField extends StatelessWidget {
  /// Label for the input field.
  final String itemLabel;

  /// Custom widget for the input field.
  final Widget item;

  /// Padding between [itemLabel] and [item].
  final double inbetweenPadding;

  /// Bottom padding applied to this widget.
  final double bottomPadding;

  /// Optional information text used in a [CustomToolTip].
  final String? informationText;

  // tooltipIcon
  final Image tooltipIcon;

  const CustomInputField({
    Key? key,
    required this.itemLabel,
    required this.item,
    this.inbetweenPadding = 8,
    this.bottomPadding = 8,
    this.informationText,
    required this.tooltipIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                itemLabel,
                style: RibnToolkitTextStyles.h4,
              ),
              informationText != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: CustomToolTip(
                        toolTipChild: Text(
                          informationText!,
                          style: RibnToolkitTextStyles.toolTipTextStyle,
                        ),
                        offsetPositionLeftValue: 100,
                        toolTipIcon: tooltipIcon,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          SizedBox(height: inbetweenPadding),
          item,
        ],
      ),
    );
  }
}
