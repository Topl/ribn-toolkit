import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/colors.dart';

class Accordion extends StatefulWidget {
  final Text header;
  final Text description;
  final double width;
  final Color backgroundColor;
  final Color collapsedBackgroundColor;
  final Color iconColor;
  final Color dividerColor;

  const Accordion({
    required this.header,
    required this.description,
    required this.width,
    this.backgroundColor = RibnColors.primary,
    this.collapsedBackgroundColor = RibnColors.primary,
    this.iconColor = Colors.white,
    this.dividerColor = Colors.transparent,
    Key? key,
  }) : super(key: key);

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Theme(
          data: ThemeData().copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            trailing: Icon(
              isExpanded ? Icons.remove : Icons.add,
              size: 20,
            ),
            iconColor: widget.iconColor,
            collapsedIconColor: widget.iconColor,
            onExpansionChanged: (bool val) {
              setState(() {
                isExpanded = val;
              });
            },
            backgroundColor: widget.backgroundColor,
            collapsedBackgroundColor: widget.collapsedBackgroundColor,
            title: widget.header,
            children: [
              Container(
                color: widget.dividerColor,
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 5, bottom: 15, right: 50),
                child: widget.description,
              ),
            ],
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}
