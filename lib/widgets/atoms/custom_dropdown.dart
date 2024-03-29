// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_portal/flutter_portal.dart';
// Project imports:
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/styles.dart';

/// A custom drop down widget.
///
/// The [flutter_portal] library is leveraged to develop a custom drop down.
///
/// Note: In the build method, the outer [PortalTarget] is added to handle dismissing the dropdown menu, in case
/// the user clicks elsewhere on the screen, hence the usage of [GestureDetector] and [onDismissed].
//ignore: must_be_immutable
class CustomDropDown extends StatefulWidget {
  /// The widget that's displayed upon the [dropdownButton] being pressed.
  final Widget dropdownChild;

  /// Alignment of the [dropdownButton] with respect to the [dropdownChild].
  final Alignment childAlignment;

  /// Alignment of the [dropdownChild] with respect to the [dropdownButton].
  final Alignment dropDownAlignment;

  /// True if [dropdownChild] is currently visible.
  bool visible;

  /// Callback function to handle dismiss event.
  final Function()? onDismissed;

  /// Chevron icon to display at the end of the input field
  final Image? chevronIcon;

  /// The selected dropdown item
  final dynamic selectedItem;

  /// Displays this hint text when no item is selected
  final String hintText;

  final Widget? customDropdownButton;

  CustomDropDown({
    Key? key,
    required this.dropdownChild,
    required this.childAlignment,
    required this.dropDownAlignment,
    required this.visible,
    required this.onDismissed,
    required this.chevronIcon,
    required this.selectedItem,
    required this.hintText,
    this.customDropdownButton,
  }) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  final double _fieldHeight = 36;

  Widget _buildIconDropdownButton() {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(horizontal: kIsWeb ? 14 : 8),
      minWidth: 0,
      onPressed: () {
        setState(() {
          widget.visible = true;
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 4, bottom: 4),
            padding: const EdgeInsets.all(2),
            width: 92,
            height: _fieldHeight - 10,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(1),
                bottomRight: Radius.circular(1),
                bottomLeft: Radius.circular(5),
              ),
              color: RibnColors.lightGrey,
            ),
            child: Center(
              child: widget.selectedItem ??
                  Text(
                    widget.hintText,
                    style: RibnToolkitTextStyles.dropdownButtonStyle,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Container(
              width: 25,
              height: _fieldHeight - 10,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(1),
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                  bottomLeft: Radius.circular(1),
                ),
                color: RibnColors.lightGrey,
              ),
              child: widget.chevronIcon,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PortalTarget(
      visible: widget.visible,
      portalFollower: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onDismissed,
      ),
      child: PortalTarget(
        visible: widget.visible,
        portalFollower: widget.dropdownChild,
        anchor: Aligned(follower: widget.childAlignment, target: widget.dropDownAlignment),
        child: widget.customDropdownButton ?? _buildIconDropdownButton(),
      ),
    );
  }
}
