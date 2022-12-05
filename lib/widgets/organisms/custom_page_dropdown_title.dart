import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/styles.dart';
import 'package:ribn_toolkit/widgets/molecules/input_dropdown.dart';
import 'package:ribn_toolkit/widgets/molecules/wave_container.dart';

/// A widget to display the title and a dropdown filter on top of the page.
class CustomPageDropdownTitle extends StatelessWidget {
  CustomPageDropdownTitle(
      {required this.title,
      required this.chevronIconLink,
      this.hideWaveAnimation = false,
      required this.currentSelectedItem,
      required this.itemsToSelectFrom,
      required this.updateSelectedItem,
      Key? key})
      : super(key: key);
  final String title;
  final String chevronIconLink;
  final bool hideWaveAnimation;
  String currentSelectedItem;
  final List<String> itemsToSelectFrom;
  final Function(String) updateSelectedItem;

  @override
  Widget build(BuildContext context) {
    if (hideWaveAnimation == true) {
      return SizedBox(
        height: 73,
        width: double.infinity,
        child: TitleBody(
          title: title,
          chevronIconLink: chevronIconLink,
          currentSelectedItem: currentSelectedItem,
          itemsToSelectFrom: itemsToSelectFrom,
          updateSelectedItem: updateSelectedItem,
        ),
      );
    }

    return WaveContainer(
      containerHeight: 73,
      containerWidth: double.infinity,
      waveAmplitude: 0,
      containerChild: Padding(
        // padding to account for device notches etc
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: TitleBody(
          title: title,
          chevronIconLink: chevronIconLink,
          currentSelectedItem: currentSelectedItem,
          itemsToSelectFrom: itemsToSelectFrom,
          updateSelectedItem: updateSelectedItem,
        ),
      ),
    );
  }
}

class TitleBody extends StatefulWidget {
  TitleBody({
    Key? key,
    required this.title,
    required this.chevronIconLink,
    required this.currentSelectedItem,
    required this.itemsToSelectFrom,
    required this.updateSelectedItem,
  }) : super(key: key);

  final String title;
  final String chevronIconLink;
  String currentSelectedItem;
  final List<String> itemsToSelectFrom;
  final Function(String) updateSelectedItem;

  @override
  State<TitleBody> createState() => _TitleBodyState();
}

class _TitleBodyState extends State<TitleBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Positioned.fill(
          left: 20,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.title,
              style: RibnToolkitTextStyles.largeh3.copyWith(
                color: RibnColors.lightGreyTitle,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Positioned.fill(
          right: 20,
          child: Align(
            alignment: Alignment.centerRight,
            child: InputDropdown(
              selectedItem: widget.currentSelectedItem,
              items: widget.itemsToSelectFrom,
              onChange: (String item) {
                widget.updateSelectedItem(item);
              },
              chevronIconLink: widget.chevronIconLink,
              hideCircleAvatar: true,
            ),
          ),
        ),
      ],
    );
  }
}
