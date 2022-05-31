import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/styles.dart';

class Accordion extends StatefulWidget {
  final String header;
  final String description;
  final double width;
  final Color backgroundColor;
  final Color collapsedBackgroundColor;
  final Color textColor;
  final Color iconColor;

  const Accordion({
    required this.header,
    required this.description,
    required this.width,
    required this.backgroundColor,
    required this.collapsedBackgroundColor,
    required this.textColor,
    required this.iconColor,
    Key? key,
  }) : super(key: key);

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  @override
  Widget build(BuildContext context) {
    bool isExpanded = false;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        width: widget.width,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: RibnColors.assetCardShadow,
              spreadRadius: 0,
              blurRadius: 37,
              offset: Offset(0, 6),
            ),
          ],
          border: Border.all(color: RibnColors.lightGrey, width: 1),
          borderRadius: BorderRadius.circular(
            4,
          ),
        ),
        child: Theme(
          data: ThemeData().copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 30),
            trailing: isExpanded == true ? const Icon(Icons.remove) : const Icon(Icons.add),
            iconColor: widget.iconColor,
            onExpansionChanged: (bool val) {
              setState(() {
                isExpanded = true;
              });
            },
            backgroundColor: widget.backgroundColor,
            collapsedBackgroundColor: widget.collapsedBackgroundColor,
            title: Text(
              widget.header,
              style: RibnToolkitTextStyles.body1Bold.copyWith(
                color: widget.textColor,
              ),
              textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false),
            ),
            children: [
              Container(
                color: RibnColors.lightGrey,
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 30, bottom: 30),
                child: SizedBox(
                  width: 500,
                  child: Text(
                    widget.description,
                    style: RibnToolkitTextStyles.body1.copyWith(
                      color: widget.textColor,
                    ),
                    textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false),
                  ),
                ),
              ),
            ],
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}
