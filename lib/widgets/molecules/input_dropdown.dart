// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/styles.dart';
import 'package:ribn_toolkit/utils.dart';

class InputDropdown extends StatefulWidget {
  const InputDropdown({
    required this.selectedItem,
    required this.items,
    required this.onChange,
    required this.chevronIconLink,
    this.enabled = true,
    this.hideCircleAvatar = false,
    this.onOpen,
    Key? key,
  }) : super(key: key);

  final String selectedItem;
  final List<String> items;
  final Function(String) onChange;
  final String chevronIconLink;
  final bool hideCircleAvatar;
  final bool enabled;

  /// Callback when the dropdown is opened
  final Function? onOpen;

  @override
  State<InputDropdown> createState() => _InputDropdownState();
}

class _InputDropdownState extends State<InputDropdown> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 21,
      decoration: BoxDecoration(
        color: isHovered ? RibnColors.primaryButtonHover : RibnColors.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () {},
        onHover: (value) {
          setState(() {
            isHovered = value;
          });
        },
        child: PopupMenuButton<String>(
          enableFeedback: false,
          enabled: widget.enabled == true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.32),
          ),
          offset: const Offset(0, 25),
          padding: const EdgeInsets.all(0.0),
          elevation: 0,
          onOpened: () {
            if (widget.onOpen != null) {
              widget.onOpen!();
            }
          },
          itemBuilder: (context) {
            return widget.items.map(
              (String item) {
                return PopupMenuItem(
                  value: item,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: widget.hideCircleAvatar
                            ? const EdgeInsets.only(left: 5, right: 5)
                            : const EdgeInsets.only(left: 15, right: 5),
                        child: widget.hideCircleAvatar
                            ? item == widget.selectedItem
                                ? const Icon(
                                    Icons.check,
                                    size: 16,
                                  )
                                : const SizedBox()
                            : CircleAvatar(
                                backgroundColor:
                                    item == widget.selectedItem ? const Color(0xFF80FF00) : const Color(0xffbdbdbd),
                                radius: 3,
                              ),
                      ),
                      Text(
                        capitalize(item),
                        style: RibnToolkitTextStyles.dropdownButtonStyle.copyWith(
                          color: RibnColors.defaultText,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ).toList();
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              widget.hideCircleAvatar
                  ? const SizedBox()
                  : const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: CircleAvatar(backgroundColor: Color(0xFF80FF00), radius: 3),
                    ),
              SizedBox(
                height: 20,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      capitalize(widget.selectedItem),
                      style: RibnToolkitTextStyles.h3.copyWith(
                        color: Colors.white,
                        fontSize: 10,
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
              if (widget.enabled == true)
                Image.asset(
                  widget.chevronIconLink,
                  width: 10.0,
                ),
            ],
          ),
          onSelected: (String item) {
            widget.onChange(item);
          },
        ),
      ),
    );
  }
}
