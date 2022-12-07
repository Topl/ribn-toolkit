import 'package:flutter/cupertino.dart';

/// @dev This widget is to be used by any other widget thats wants to use H2
class RibnFont11TextWidget extends Text {
  final String text;
  final TextAlign textAlignment;
  final Color textColor;
  final FontWeight fontWeight;
  final double wordSpacing;
  final TextDecoration textDecoration;
  const RibnFont11TextWidget({
    Key? key,
    required this.text,
    required this.textAlignment,
    required this.textColor,
    required this.fontWeight,
    this.wordSpacing = 0,
    this.textDecoration = TextDecoration.none,
  }) : super('', key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        wordSpacing: wordSpacing,
        fontWeight: fontWeight,
        fontFamily: 'DM Sans',
        fontSize: 11,
        decoration: textDecoration,
      ),
      textAlign: textAlignment,
    );
  }
}
