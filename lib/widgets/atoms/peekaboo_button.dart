import 'package:flutter/material.dart';

/// The peekaboobutton shows/hides a button child element onpress
class PeekabooButton extends StatefulWidget {
  final Text buttonText;
  final Widget buttonChild;
  const PeekabooButton({required this.buttonText, required this.buttonChild, Key? key}) : super(key: key);

  @override
  State<PeekabooButton> createState() => _PeekabooButtonState();
}

class _PeekabooButtonState extends State<PeekabooButton> {
  var showingChild = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MaterialButton(
          onPressed: () {
            setState(() {
              showingChild = !showingChild;
            });
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.buttonText,
              Icon(
                showingChild ? Icons.keyboard_arrow_down_outlined : Icons.keyboard_arrow_up_outlined,
              ),
            ],
          ),
        ),
        showingChild ? widget.buttonChild : const SizedBox(),
      ],
    );
  }
}
