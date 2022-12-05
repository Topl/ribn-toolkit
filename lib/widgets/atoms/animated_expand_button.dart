import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/styles.dart';

class AnimatedExpandButton extends StatefulWidget {
  const AnimatedExpandButton({
    required this.backgroundColor,
    required this.title,
    required this.onPressed,
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  /// Background color of the container
  final Color backgroundColor;

  /// Title shown next to the icon
  final String title;

  /// Callback for when button is pressed
  final VoidCallback onPressed;

  /// Height of the container
  final double height;

  /// Width of the container
  final double width;

  @override
  State<AnimatedExpandButton> createState() => _AnimatedExpandButtonState();
}

class _AnimatedExpandButtonState extends State<AnimatedExpandButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  bool _expanded = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      upperBound: 0.5,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: MaterialButton(
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        color: widget.backgroundColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Text(
                widget.title,
                textHeightBehavior:
                    const TextHeightBehavior(applyHeightToFirstAscent: false),
                style: RibnToolkitTextStyles.smallBody.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                child: const Icon(Icons.expand_more)),
          ],
        ),
        onPressed: () {
          widget.onPressed();

          setState(() {
            if (_expanded) {
              _controller.reverse(from: 0.5);
            } else {
              _controller.forward(from: 0.0);
            }
            _expanded = !_expanded;
          });
        },
      ),
    );
  }
}
