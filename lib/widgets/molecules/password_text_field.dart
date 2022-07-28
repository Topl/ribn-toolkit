import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ribn_toolkit/constants/assets.dart';
import 'package:ribn_toolkit/constants/styles.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_icon_button.dart';

/// Builds a custom [TextField] for inputting password.
///
/// Allows the user to toggle between showing & hiding text.
class PasswordTextField extends StatefulWidget {
  /// Controller for the [TextField].
  final TextEditingController controller;

  /// Hint text to be displayed in the [TextField].
  final String hintText;

  /// True if there is an error in the [TextField].
  final bool hasError;

  /// The width of the [TextField].
  final double width;

  /// The height of the [TextField].
  final double height;

  /// True if the password is being obscured
  final bool obscurePassword;

  /// Action for when enter key is hit
  final Function? onSubmitted;

  /// FocusNode that can be attached to the [TextField].
  final FocusNode? focusNode;

  final Color fillColor;

  const PasswordTextField({
    required this.controller,
    required this.hintText,
    this.hasError = false,
    this.width = 310,
    this.height = 36,
    this.obscurePassword = true,
    this.onSubmitted,
    this.focusNode,
    this.fillColor = Colors.white,
    Key? key,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  late bool obscurePassword;
  @override
  void initState() {
    obscurePassword = widget.obscurePassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder textFieldBorder = OutlineInputBorder(
      borderSide: BorderSide(color: widget.hasError ? Colors.red : Colors.transparent),
      borderRadius: BorderRadius.circular(5),
    );
    final OutlineInputBorder textFieldFocusBorder = OutlineInputBorder(
      borderSide: BorderSide(color: widget.hasError ? Colors.red : Colors.transparent),
      borderRadius: BorderRadius.circular(5),
    );

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextField(
        onSubmitted: widget.onSubmitted != null ? (_) => widget.onSubmitted!() : null,
        focusNode: widget.focusNode,
        textInputAction: TextInputAction.next,
        obscureText: obscurePassword,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: CustomIconButton(
            icon: Image.asset(
              obscurePassword ? RibnAssets.passwordVisiblePng : RibnAssets.passwordHiddenPng,
              width: 17,
            ),
            onPressed: () {
              setState(() {
                obscurePassword = !obscurePassword;
              });
            },
          ),
          labelText: widget.hintText,
          labelStyle: RibnToolkitTextStyles.hintStyle,
          isDense: true,
          fillColor: widget.fillColor,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          contentPadding: const EdgeInsets.all(10),
          enabledBorder: textFieldBorder,
          focusedBorder: textFieldFocusBorder,
        ),
      ),
    );
  }
}
