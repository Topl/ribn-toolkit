import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/styles.dart';

class CustomTextField extends StatelessWidget {
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

  final int hintMaxLines;

  const CustomTextField({
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
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.hintMaxLines = 2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        controller: controller,
        style: RibnToolkitTextStyles.h3,
        textAlignVertical: textAlignVertical,
        onChanged: onChanged,
        expands: true,
        maxLines: null,
        maxLength: maxLength,
        showCursor: showCursor,
        keyboardType: keyboardType,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          isDense: true,
          counterText: '',
          hintText: hintText,
          hintMaxLines: hintMaxLines,
          hintStyle: RibnToolkitTextStyles.h3.copyWith(color: const Color(0xff4C838D)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: hasError ? Colors.red : enabledBorderColor ?? Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: hasError ? Colors.red : focusedBorderColor ?? Colors.transparent),
          ),
          filled: true,
          contentPadding: const EdgeInsets.all(5),
          fillColor: fillColor ?? RibnColors.whiteBackground.withOpacity(0.36),
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ),
    );
  }
}
