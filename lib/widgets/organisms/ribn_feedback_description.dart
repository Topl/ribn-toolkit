import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors.dart';
import '../../constants/styles.dart';

class RibnFeedbackDescription extends StatefulWidget {
  final double width;

  /// Controller for the asset short name.
  final TextEditingController controller;

  /// Length of the note text entered.
  final int textLength;

  /// Max length of the note.
  final int maxTextLength;

  final Image tooltipIcon;
  final String hintText;
  final String hintTitle;

  /// Controller for the textfield.

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
  const RibnFeedbackDescription({
    Key? key,
    this.width = 350,
    this.height = 130,
    required this.controller,
    required this.textLength,
    required this.maxTextLength,
    required this.tooltipIcon,
    required this.hintText,
    required this.hintTitle,
    this.maxLength,
    this.textAlignVertical,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.showCursor = true,
    this.hasError = false,
    this.inputFormatters = const [],
    this.fillColor,
    this.hintMaxLines = 15,
    this.textInputAction = TextInputAction.next,
    this.enabledBorderColor = const Color(0xffE9E9E9),
    this.focusedBorderColor = const Color(0xffE9E9E9),
    this.hintColor = const Color(0xff4C838D),
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RibnFeedbackDescriptionState();
  }
}

class _RibnFeedbackDescriptionState extends State<RibnFeedbackDescription> {
  final ScrollController _controllerVertical =
      ScrollController(initialScrollOffset: 0);

  @override
  Widget build(BuildContext context) {
    final bool maxLimitReached = widget.textLength >= widget.maxTextLength;
    ;
    final Color counterBoxColor =
        maxLimitReached ? const Color(0xFFFFE5E5) : const Color(0xffefefef);
    final Color counterBorderColor = maxLimitReached
        ? const Color(0xffE80E00).withOpacity(0.7)
        : Colors.transparent;
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 8, bottom: 12, right: 14),
      width: double.infinity,
      child: Stack(
        children: [
          // text field for the note
          SizedBox(
            width: widget.width,
            height: 130,
            child: TextField(
              scrollController: _controllerVertical,
              controller: widget.controller,
              style: RibnToolkitTextStyles.hintStyle,
              textAlignVertical: widget.textAlignVertical,
              onChanged: widget.onChanged,
              //expands: true,
              minLines: null,
              maxLines: 15,
              maxLength: widget.maxLength,
              showCursor: widget.showCursor,
              keyboardType: widget.keyboardType,
              inputFormatters: widget.inputFormatters,
              textInputAction: widget.textInputAction,
              decoration: InputDecoration(
                isDense: true,
                counterText: '',
                hintText: widget.hintText,
                hintStyle: RibnToolkitTextStyles.hintStyle
                    .copyWith(color: widget.hintColor),
                hintMaxLines: widget.hintMaxLines,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xffE9E9E9)),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: widget.hasError
                          ? Colors.red
                          : widget.enabledBorderColor ?? Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: widget.hasError
                          ? Colors.red
                          : widget.focusedBorderColor ?? Colors.transparent),
                ),
                filled: true,
                contentPadding: const EdgeInsets.all(5),
                fillColor: widget.fillColor ?? RibnColors.whiteBackground,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
          ),
          // character count indicator
          Positioned(
            right: 50,
            bottom: 5,
            child: Container(
              child: Center(
                child: Text(
                  (widget.maxTextLength - widget.textLength).toString(),
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
