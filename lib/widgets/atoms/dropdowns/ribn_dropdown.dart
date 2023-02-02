import 'package:flutter/material.dart';
import 'package:ribn_toolkit/widgets/atoms/text/ribn_bodyfont12_text_widget.dart';

class RibnDropdown extends StatelessWidget {
  final String title;
  final String dropDownValue;
  final String dropDownIcon;
  final Color titleColor;
  final Color dropDownIconColor;
  final FontWeight titleWeight;
  final List<String> dropDownItems;
  final void Function(String?) onChanged;
  const RibnDropdown(
      {Key? key,
      required this.title,
      required this.titleColor,
      required this.titleWeight,
      required this.dropDownItems,
      required this.dropDownValue,
      required this.onChanged,
      required this.dropDownIcon,
      required this.dropDownIconColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              children: [
                RibnBodyFont12TextWidget(
                  text: title,
                  textAlign: TextAlign.justify,
                  textColor: titleColor,
                  fontWeight: titleWeight,
                )
              ],
            ),
          ),
          DropdownButton<String>(
            value: dropDownValue,
            icon: Image.asset(
              dropDownIcon,
              color: dropDownIconColor,
              scale: 2,
            ),
            onChanged: onChanged,
            items: dropDownItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                alignment: FractionalOffset.centerLeft,
                child: Text(value),
              );
            }).toList(),
          )
        ],
      ),
      width: MediaQuery.of(context).size.width,
    );
  }
}
