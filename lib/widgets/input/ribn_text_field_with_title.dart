// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Project imports:
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/styles.dart';

import '../atoms/text/ribn_font13_text_widget.dart';

class RibnTextFieldWithTitle extends StatelessWidget {
  /// Controller for the textfield.
  final TextEditingController controller;

  /// Hint text to display when text is empty
  final String hintText;

  /// Width of the textfield box
  final double width;

  /// Height of the textfield box
  final double height;

  /// Max length of text allowed in the textfield
  final int? maxLength;

  /// True if cursor should be displayed
  final bool? showCursor;

  /// Vertical alignment of the text inside the textfield
  final TextAlignVertical? textAlignVertical;

  /// CallBack function for whenever the text changes
  final Function(String)? onChanged;

  /// True if the textfield has an error
  final bool hasError;

  /// Define input type for the textfield.
  /// This also affects the keyboard type on mobile.
  final TextInputType keyboardType;

  /// Allows formatting text input in a custom manner.
  final List<TextInputFormatter> inputFormatters;

  final Color? fillColor;

  final Color? enabledBorderColor;

  final Color? focusedBorderColor;

  final Color? hintColor;

  final int hintMaxLines;

  final TextInputAction textInputAction;

  final String title;
  final Color titleColor;
  final FontWeight titleFontWeight;
  const RibnTextFieldWithTitle({
    required this.controller,
    required this.hintText,
    this.width = 350,
    this.height = 40,
    this.maxLength,
    this.textAlignVertical,
    this.onChanged,
    this.showCursor = true,
    this.hasError = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters = const [],
    this.fillColor,
    this.enabledBorderColor = const Color(0xffE9E9E9),
    this.focusedBorderColor = const Color(0xffE9E9E9),
    this.hintColor = const Color(0xff4C838D),
    this.hintMaxLines = 2,
    this.textInputAction = TextInputAction.next,
    Key? key,
    required this.title,
    required this.titleColor,
    required this.titleFontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: RibnFont13TextWidget(
              text: title,
              textAlign: TextAlign.justify,
              textColor: titleColor,
              fontWeight: titleFontWeight),
        ),
        SizedBox(
          width: width,
          height: height,
          child: TextField(
            controller: controller,
            style: RibnToolkitTextStyles.hintStyle,
            textAlignVertical: textAlignVertical,
            onChanged: onChanged,
            expands: true,
            maxLines: null,
            maxLength: maxLength,
            showCursor: showCursor,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            textInputAction: textInputAction,
            decoration: InputDecoration(
              isDense: true,
              counterText: '',
              hintText: hintText,
              hintStyle:
                  RibnToolkitTextStyles.hintStyle.copyWith(color: hintColor),
              hintMaxLines: hintMaxLines,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xffE9E9E9)),
                borderRadius: BorderRadius.circular(5),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: hasError
                        ? Colors.red
                        : enabledBorderColor ?? Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: hasError
                        ? Colors.red
                        : focusedBorderColor ?? Colors.transparent),
              ),
              filled: true,
              contentPadding: const EdgeInsets.all(5),
              fillColor: fillColor ?? RibnColors.whiteBackground,
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
          ),
        )
      ],
    );
  }
}
