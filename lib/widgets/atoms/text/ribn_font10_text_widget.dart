import 'package:flutter/cupertino.dart';

/// @dev This widget is to be used by any other widget thats wants to use H2
class RibnFont10TextWidget extends Text {
  final String text;
  final TextAlign textAlign;
  final Color textColor;
  final FontWeight fontWeight;
  const RibnFont10TextWidget(
      {Key? key,
      required this.text,
      required this.textAlign,
      required this.textColor,
      required this.fontWeight}) : super('');
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(
          fontSize: 10,
          fontFamily: 'DM Sans',
          color: textColor,
          fontWeight: fontWeight),
      textAlign: textAlign,
    );
  }
}
