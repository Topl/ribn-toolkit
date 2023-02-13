// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/strings.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_input_field.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_text_field.dart';

/// An input field used on transfer input pages.
///
/// Allows the user to add a note to the transaction.
class NoteField extends StatelessWidget {
  /// Controller for the asset short name.
  final TextEditingController controller;

  /// Length of the note text entered.
  final int noteLength;

  /// Max length of the note.
  final int maxNoteLength;

  final Image tooltipIcon;
  final String hintText;
  final String hintTitle;
  final double height;
  final double width;
  final bool hasError;
  final dynamic Function(String)? onChanged;
  const NoteField(
      {required this.controller,
      required this.noteLength,
      required this.tooltipIcon,
      Key? key,
      this.hintText = Strings.noteHint,
      this.hintTitle = Strings.note,
      this.maxNoteLength = 127,
      this.height = 80,
      this.width = 350,
      this.hasError = false,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool maxLimitReached = noteLength >= maxNoteLength;
    final Color counterBoxColor =
        maxLimitReached ? const Color(0xFFFFE5E5) : const Color(0xffefefef);
    final Color counterBorderColor =
        maxLimitReached ? const Color(0xffE80E00) : Colors.transparent;

    return CustomInputField(
      itemLabel: hintTitle,
      tooltipIcon: tooltipIcon,
      item: Stack(
        children: [
          // text field for the note
          CustomTextField(
            onChanged: onChanged,
            hasError: hasError,
            width: width,
            textInputAction: TextInputAction.done,
            controller: controller,
            hintText: hintText,
            height: height,
            maxLength: maxNoteLength,
            textAlignVertical: TextAlignVertical.top,
            hintColor: RibnColors.hintTextColor,
          ),
          // character count indicator
          Positioned(
            right: 5,
            bottom: 10,
            child: Container(
              child: Center(
                child: Text(
                  (maxNoteLength - noteLength).toString(),
                  style: const TextStyle(
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              width: 37,
              height: 25,
              decoration: BoxDecoration(
                color: counterBoxColor,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: counterBorderColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
