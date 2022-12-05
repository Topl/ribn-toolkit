import 'package:flutter/material.dart';

/// The edit button used for asset detail items that can be edited.
class HoverIconButton extends StatefulWidget {
  /// The text for the button.
  final Text buttonText;

  /// The icon which appears upon hovering the button.
  final Image buttonIcon;

  /// A callback function to handle onPressed events.
  final VoidCallback onPressed;

  const HoverIconButton({
    Key? key,
    required this.buttonText,
    required this.buttonIcon,
    required this.onPressed,
  }) : super(key: key);

  @override
  _HoverIconButtonState createState() => _HoverIconButtonState();
}

class _HoverIconButtonState extends State<HoverIconButton> {
  bool showHoverIcon = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (pointerEvent) {
        setState(() {
          showHoverIcon = true;
        });
      },
      onExit: (pointerEvent) {
        setState(() {
          showHoverIcon = false;
        });
      },
      child: TextButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
        ),
        onPressed: widget.onPressed,
        child: SizedBox(
          width: 35,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              showHoverIcon ? widget.buttonIcon : const SizedBox(),
              const Spacer(),
              widget.buttonText
            ],
          ),
        ),
      ),
    );
  }
}
