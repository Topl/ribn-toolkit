import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ribn_toolkit/constants/colors.dart';
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

  /// The text icon for clickable obscure text ability
  final SvgPicture icon;

  /// True if the password is being obscured
  bool obscurePassword;

  PasswordTextField({
    required this.controller,
    required this.hintText,
    this.hasError = false,
    this.width = 310,
    this.height = 35,
    required this.icon,
    required this.obscurePassword,
    Key? key,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder textFieldBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: RibnColors.lightGrey),
      borderRadius: BorderRadius.circular(5),
    );
    final OutlineInputBorder textFieldFocusBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: RibnColors.active),
      borderRadius: BorderRadius.circular(5),
    );

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextField(
        obscureText: widget.obscurePassword,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: CustomIconButton(
            icon: widget.icon,
            onPressed: () {
              setState(() {
                widget.obscurePassword = !widget.obscurePassword;
              });
            },
          ),
          labelText: widget.hintText,
          labelStyle: RibnToolkitTextStyles.hintStyle,
          isDense: true,
          fillColor: Colors.white,
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
