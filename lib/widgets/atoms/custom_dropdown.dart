import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/styles.dart';

/// A custom drop down widget.
///
/// The [flutter_portal] library is leveraged to develop a custom drop down.
///
/// Note: In the build method, the outer [PortalEntry] is added to handle dismissing the dropdown menu, in case
/// the user clicks elesewhere on the screen, hence the usage of [GestureDetector] and [onDismissed].
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
  _CustomDropDownState createState() => _CustomDropDownState();
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
              child: widget.chevronIcon,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(1),
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                  bottomLeft: Radius.circular(1),
                ),
                color: RibnColors.lightGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PortalEntry(
      visible: widget.visible,
      portal: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onDismissed,
      ),
      child: PortalEntry(
        visible: widget.visible,
        child: widget.customDropdownButton ?? _buildIconDropdownButton(),
        portal: widget.dropdownChild,
        childAnchor: widget.childAlignment,
        portalAnchor: widget.dropDownAlignment,
      ),
    );
  }
}
