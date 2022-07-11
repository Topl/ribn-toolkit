import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/strings.dart';
import 'package:ribn_toolkit/constants/styles.dart';
import 'package:ribn_toolkit/constants/ui_constants.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_dropdown.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_input_field.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_text_field.dart';

/// An input field used on the [MintInputPage].
///
/// Allows the user to define an asset long name and select a icon for the asset.
class AssetLongNameField extends StatefulWidget {
  /// Controller for the asset long name.
  final TextEditingController controller;

  /// The selected icon for the asset to be minted.
  final String? selectedIcon;

  /// Handler for when an icon is selected.
  final Function(String) onIconSelected;

  /// Renders tooltip icon
  final Image tooltipIcon;

  /// Renders down chevron icon
  final Image chevronIcon;

  /// The list of icon strings to render in the custom dropdown child
  final List<String> assetsIconList;

  const AssetLongNameField({
    Key? key,
    required this.controller,
    required this.onIconSelected,
    this.selectedIcon,
    required this.tooltipIcon,
    required this.chevronIcon,
    required this.assetsIconList,
  }) : super(key: key);

  @override
  _AssetLongNameFieldState createState() => _AssetLongNameFieldState();
}

class _AssetLongNameFieldState extends State<AssetLongNameField> {
  /// Max length of the asset long name.
  final int maxLength = 16;

  /// True if icon dropdown needs to be displayed.
  bool showIconDropdown = false;

  /// True if dropdown arrow needs to be displayed, i.e. on hover.
  bool showDropdownArrow = false;

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      informationText: Strings.assetLongNameInfo,
      itemLabel: Strings.assetLongName,
      item: Stack(
        children: [
          // textfield for entering the asset long name
          CustomTextField(
            controller: widget.controller,
            hintText: Strings.assetLongNameHint,
            maxLength: maxLength,
            height: 36,
            hintColor: RibnColors.hintTextColor,
          ),
          // dropdown for selecting an asset icon
          Positioned(
            right: 0,
            child: SizedBox(
              height: 36,
              child: CustomDropDown(
                childAlignment: Alignment.bottomCenter,
                dropDownAlignment: Alignment.topCenter,
                visible: showIconDropdown,
                onDismissed: () {
                  setState(() {
                    showIconDropdown = false;
                  });
                },
                dropdownChild: _buildIconDropdownChild(),
                chevronIcon: widget.chevronIcon,
                selectedItem: widget.selectedIcon != null ? Image.asset(widget.selectedIcon!) : null,
                hintText: 'Select Icon',
              ),
            ),
          ),
        ],
      ),
      tooltipIcon: widget.tooltipIcon,
    );
  }

  /// Builds the icon dropdown widget.
  ///
  /// Allows user to select from a list of custom icons, i.e. [UIConstants.assetIconsList].
  Widget _buildIconDropdownChild() {
    return Container(
      width: 120,
      height: 68,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(3)),
        border: Border.all(color: const Color(0xffefefef)),
        color: Colors.white,
      ),
      child: GridView(
        padding: const EdgeInsets.all(5),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        children: widget.assetsIconList
            .map(
              (icon) => MaterialButton(
                padding: EdgeInsets.zero,
                minWidth: 0,
                onPressed: () {
                  widget.onIconSelected(icon);
                  setState(() {
                    showIconDropdown = false;
                  });
                },
                child: Image.asset(icon),
              ),
            )
            .toList(),
      ),
    );
  }
}
