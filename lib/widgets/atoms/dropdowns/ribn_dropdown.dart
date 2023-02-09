import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/colors.dart';
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
  final GlobalKey _dropdownButtonKey = GlobalKey();

  RibnDropdown({
    Key? key,
    required this.title,
    required this.titleColor,
    required this.titleWeight,
    required this.dropDownItems,
    required this.dropDownValue,
    required this.onChanged,
    required this.dropDownIcon,
    required this.dropDownIconColor,
  }) : super(key: key);

  void openDropdown() {
    GestureDetector? detector;
    bool searchForGestureDetector(BuildContext element) {
      bool results = false;
      element.visitChildElements((element) {
        if (element.widget is GestureDetector) {
          detector = element.widget as GestureDetector;
          results = false;
        } else {
          searchForGestureDetector(element);
        }
        results = true;
      });
      return results;
    }

    searchForGestureDetector(_dropdownButtonKey.currentContext!);
    assert(detector != null);

    detector?.onTap!();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
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
          Container(
              height: 40,
              width: 330,
              decoration: BoxDecoration(
                  color:
                      Colors.transparent, //background color of dropdown button
                  border: Border.all(
                      color: RibnColors.greyText,
                      width: 0.3), //border of dropdown button
                  borderRadius: BorderRadius.circular(
                      11.4), //border raiuds of dropdown button
                  boxShadow: const <BoxShadow>[
                    //apply shadow on Dropdown button
                    BoxShadow(color: Colors.transparent) //blur radius of shadow
                  ]),
              child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[
                                300], //background color of dropdown button
                            border: Border.all(
                                color: Colors.grey.withOpacity(1),
                                width: 0.011), //border of dropdown button
                            borderRadius: BorderRadius.circular(
                                3), //border raiuds of dropdown button
                            boxShadow: const <BoxShadow>[
                              //apply shadow on Dropdown button
                              BoxShadow(
                                  color: Colors
                                      .transparent) //blur radius of shadow
                            ]),
                        width: 270,
                        height: 30,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 2),
                          child: DropdownButton(
                            key: _dropdownButtonKey,
                            selectedItemBuilder: (BuildContext context) =>
                                dropDownItems
                                    .map<DropdownMenuItem<String>>(
                                        (String item) =>
                                            DropdownMenuItem<String>(
                                              value: item,
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                constraints:
                                                    const BoxConstraints(
                                                        minHeight: 48.0),
                                                child: Padding(
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                        color: RibnColors
                                                            .defaultText),
                                                  ),
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5),
                                                ),
                                              ),
                                            ))
                                    .toList(),
                            borderRadius: BorderRadius.circular(11.4),
                            value: dropDownValue,
                            items: dropDownItems
                                .map<DropdownMenuItem<String>>((String item) =>
                                    DropdownMenuItem<String>(
                                      value: item,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        constraints: const BoxConstraints(
                                            minHeight: 48.0),
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                              color: RibnColors.defaultText),
                                        ),
                                      ),
                                    ))
                                .toList(),
                            onChanged: onChanged,
                            icon: Container(),
                            iconEnabledColor: Colors.white, //Icon color
                            style: const TextStyle(
                                //te
                                color: RibnColors.greyText, //Font color
                                fontSize: 12 //font size on dropdown button
                                ),

                            dropdownColor:
                                Colors.white, //dropdown background color
                            underline: Container(), //remove underline
                            isExpanded: true, //make true to make width 100%
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[
                                    300], //background color of dropdown button
                                border: Border.all(
                                    color: Colors.grey.withOpacity(1),
                                    width: 0.011), //border of dropdown button
                                borderRadius: BorderRadius.circular(
                                    3), //border raiuds of dropdown button
                                boxShadow: const <BoxShadow>[
                                  //apply shadow on Dropdown button
                                  BoxShadow(
                                      color: Colors
                                          .transparent) //blur radius of shadow
                                ]),
                            width: 40,
                            height: 30,
                            child: const Icon(
                              Icons.arrow_drop_down_sharp,
                              color: RibnColors.defaultText,
                            ),
                          ),
                          onTap: openDropdown,
                        ),
                      )
                    ],
                  ))),
        ],
      ),
      width: MediaQuery.of(context).size.width,
    );
  }
}
