// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_close_button.dart';

/// A custom widget for displaying tooltips.
///
/// Displays [toolTipIcon] which, when pressed, opens a draggable tooltip, i.e. [toolTipChild].
///
/// @TODO: We should look into passing a global [OverlayEntry] widget from Ribn here so that there is only ever 1
/// OverlayEntry on screen.
class CustomToolTip extends StatefulWidget {
  /// The icon associated with the tooltip.
  final Widget? toolTipIcon;

  /// The main tooltip widget that is displayed when [toolTipIcon] is pressed.
  final Widget toolTipChild;

  /// Integer to offset the tooltip on the x axis to fit on screen.
  final int offsetPositionLeftValue;

  /// A color value to change the background.
  final Color toolTipBackgroundColor;

  /// A color value to change the border.
  final Border? borderColor;

  /// A callback function to be called when the tooltip is opened.
  final Function(OverlayEntry)? onOpen;

  const CustomToolTip({
    Key? key,
    this.offsetPositionLeftValue = 150,
    this.toolTipBackgroundColor = RibnColors.background,
    this.borderColor,
    required this.toolTipIcon,
    required this.toolTipChild,
    this.onOpen,
  }) : super(key: key);

  @override
  _CustomToolTipState createState() => _CustomToolTipState();
}

class _CustomToolTipState extends State<CustomToolTip> {
  OverlayEntry overlayEntry = OverlayEntry(builder: (context) => const SizedBox());

  @override
  void didUpdateWidget(covariant CustomToolTip oldWidget) {
    // tooltip should be dismissed when the parent widget rebuilds
    if (overlayEntry.mounted) overlayEntry.remove();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    if (overlayEntry.mounted) overlayEntry.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 2),
      child: GestureDetector(
        child: widget.toolTipIcon,
        onTap: () {
          // build tooltip if it is not already being displayed
          if (!overlayEntry.mounted) _buildTooltip(context);
        },
      ),
    );
  }

  /// Builds the Tooltip with the provided tooltip text.
  ///
  /// [overlayEntry] is assigned a new widget, i.e. the tooltip bubble
  /// and inserted into the [overlayState].
  void _buildTooltip(BuildContext context) async {
    final OverlayState overlayState = Overlay.of(context);
    final RenderBox renderbox = context.findRenderObject() as RenderBox;
    // Position of the tooltip
    Offset offset = renderbox.localToGlobal(Offset.zero);

    overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: offset.dx - widget.offsetPositionLeftValue,
          top: offset.dy + 20,
          child: GestureDetector(
            onPanUpdate: (details) {
              // allow dragging the tooltip container
              offset += details.delta;
              overlayState.setState(() {});
            },
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  constraints: const BoxConstraints(),
                  decoration: BoxDecoration(
                    color: widget.toolTipBackgroundColor,
                    borderRadius: BorderRadius.circular(12),
                    border: widget.borderColor,
                    boxShadow: const [
                      BoxShadow(
                        color: RibnColors.blackShadow,
                        spreadRadius: 0,
                        blurRadius: 22,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: widget.toolTipChild,
                ),
                // close button for dismissing the tooltip
                Positioned(
                  right: 0,
                  top: 0,
                  child: CustomCloseButton(
                    iconSize: 16,
                    onPressed: () => overlayEntry.remove(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    if (widget.onOpen != null) widget.onOpen!(overlayEntry);

    overlayState.insert(overlayEntry);
  }
}
