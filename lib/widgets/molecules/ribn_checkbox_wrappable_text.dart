// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/strings.dart';
import 'package:ribn_toolkit/constants/styles.dart';

/// A custom checkbox widget that shows a checkbox and an associated [label] or [wrappableText] next to it.
///
/// [wrapText] indicates whether text next to the checkbox should be wrapped.
/// A value for [wrappableText] must be provided if [wrapText] is true.
class RibnCheckboxWrappableText extends StatelessWidget {
  const RibnCheckboxWrappableText({
    this.fillColor = Colors.transparent,
    this.checkColor = const Color(0xff80FF00),
    this.borderColor = const Color(0xff80FF00),
    this.value = false,
    required this.onChanged,
    this.checkboxTopPadding = kIsWeb ? 5 : 0,
    this.renderTooltipIcon = false,
    Key? key,
    required this.origin,
  }) : super(key: key);
  final String origin;

  /// Color that fills the checkbox.
  final Color fillColor;

  /// Color of the check mark.
  final Color checkColor;

  /// Color of the checkbox borders.
  final Color borderColor;

  /// Indicates if box is checked or not.
  final bool value;

  /// Callback for when checkbox is pressed.
  final Function(bool?)? onChanged;

  /// Top padding on the checkbox
  final double checkboxTopPadding;

  /// Should render the tooltip icon
  final bool renderTooltipIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 20, top: 8, bottom: 12, right: 14),
        width: 279,
        height: 105,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(11.6)),
          color: RibnColors.mediumGrey,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(color: borderColor),
                    ),
                    constraints:
                        const BoxConstraints(maxHeight: 20, maxWidth: 20),
                    child: Checkbox(
                      fillColor: MaterialStateProperty.all(fillColor),
                      checkColor: checkColor,
                      value: value,
                      onChanged: onChanged,
                    ),
                  ),
                ),
                Flexible(
                    child: RichText(
                  key: GlobalKey(),
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'I trust ',
                        style: RibnToolkitTextStyles.h3.copyWith(
                          color: RibnColors.defaultText,
                          fontSize: 11,
                          height: 2,
                        ),
                      ),
                      TextSpan(
                        text: origin,
                        style: RibnToolkitTextStyles.h3.copyWith(
                          color: RibnColors.defaultText,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          height: 2,
                        ),
                      ),
                      TextSpan(
                        text: ' and am',
                        style: RibnToolkitTextStyles.h3.copyWith(
                          color: RibnColors.defaultText,
                          fontSize: 11,
                          height: 2,
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
            Row(
              children: [
                RichText(
                    key: GlobalKey(),
                    text: TextSpan(children: [
                      TextSpan(
                        text: Strings.connectDApp,
                        style: RibnToolkitTextStyles.h3.copyWith(
                          color: RibnColors.defaultText,
                          fontSize: 11,
                          height: 2,
                        ),
                      )
                    ])),
              ],
            ),
            Row(
              children: [
                RichText(
                    key: GlobalKey(),
                    text: TextSpan(children: [
                      TextSpan(
                        text: Strings.connectDAppLastPart,
                        style: RibnToolkitTextStyles.h3.copyWith(
                          color: RibnColors.defaultText,
                          fontSize: 11,
                          height: 2,
                        ),
                      )
                    ])),
              ],
            )
          ],
        ));
  }
}
