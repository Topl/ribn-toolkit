import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/assets.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/strings.dart';
import 'package:ribn_toolkit/constants/styles.dart';
import 'package:ribn_toolkit/widgets/molecules/custom_tooltip.dart';

/// A custom checkbox widget that shows a checkbox and an associated [label] or [wrappableText] next to it.
///
/// [wrapText] indicates whether text next to the checkbox should be wrapped.
/// A value for [wrappableText] must be provided if [wrapText] is true.
class CheckboxWrappableText extends StatelessWidget {
  const CheckboxWrappableText({
    this.fillColor = Colors.transparent,
    this.checkColor = const Color(0xff80FF00),
    this.borderColor = const Color(0xff80FF00),
    this.value = false,
    this.wrappableText,
    this.activeText = false,
    this.wrapText = false,
    this.label,
    required this.onChanged,
    this.checkboxTopPadding = kIsWeb ? 5 : 0,
    this.renderTooltipIcon = false,
    Key? key,
  })  : assert(wrapText ? wrappableText != null : label != null),
        super(key: key);

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

  /// Text that can be wrapped around the checkbox when [wrapText] is true.
  final String? wrappableText;

  /// True if checkbox text is currently active
  final bool activeText;

  /// True if text should be wrapped under the checkbox
  final bool wrapText;

  /// Label widget that is displayed next to the checkbox.
  final Widget? label;

  /// Top padding on the checkbox
  final double checkboxTopPadding;

  /// Should render the tooltip icon
  final bool renderTooltipIcon;

  @override
  Widget build(BuildContext context) {
    return wrapText
        ? RichText(
            textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false),
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: checkboxTopPadding),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        border: Border.all(color: borderColor),
                      ),
                      width: 20,
                      height: 20,
                      child: Checkbox(
                        fillColor: MaterialStateProperty.all(fillColor),
                        checkColor: checkColor,
                        value: value,
                        onChanged: onChanged,
                      ),
                    ),
                  ),
                ),
                const WidgetSpan(
                  child: SizedBox(
                    width: 10,
                  ),
                ),
                TextSpan(
                  text: wrappableText,
                  style: RibnToolkitTextStyles.onboardingH3.copyWith(
                    color: activeText ? RibnColors.lightGreyTitle : RibnColors.transparentAlternateGreyText,
                  ),
                ),
                if (renderTooltipIcon == true)
                  WidgetSpan(
                    alignment: kIsWeb ? PlaceholderAlignment.top : PlaceholderAlignment.bottom,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: CustomToolTip(
                        toolTipIcon: Image.asset(
                          RibnAssets.roundInfoCircle,
                          width: 24,
                          color: activeText ? RibnColors.lightGreyTitle : RibnColors.transparentAlternateGreyText,
                        ),
                        toolTipChild: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.howIsMySeedPhraseUnrecoverable,
                              style: RibnToolkitTextStyles.toolTipTextStyle.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              kIsWeb
                                  ? Strings.howIsMySeedPhraseUnrecoverableNewLine
                                  : Strings.howIsMySeedPhraseUnrecoverableMultipleLines,
                              style: RibnToolkitTextStyles.toolTipTextStyle.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        toolTipBackgroundColor: RibnColors.primary,
                      ),
                    ),
                  )
              ],
            ),
          )
        : Row(
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
                  constraints: const BoxConstraints(maxHeight: 20, maxWidth: 20),
                  child: Checkbox(
                    fillColor: MaterialStateProperty.all(fillColor),
                    checkColor: checkColor,
                    value: value,
                    onChanged: onChanged,
                  ),
                ),
              ),
              Flexible(child: label!),
            ],
          );
  }
}
