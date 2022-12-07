import 'package:flutter/cupertino.dart';

/// @dev This widget is to be used by any other widget thats wants to use H2
class RibnFont11TextWidget extends Text {
  final String text;
  final TextAlign textAlignment;
  final Color textColor;
  final FontWeight fontWeight;
  final double wordSpacing;
  final TextDecoration textDecoration;
  final double letterSpacing;
  const RibnFont11TextWidget(
      {Key? key,
      required this.text,
      required this.textAlignment,
      required this.textColor,
      required this.fontWeight,
      this.wordSpacing = 0,
      this.textDecoration = TextDecoration.none,
      this.letterSpacing = 0})
      : super('', key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: TextStyle(
        letterSpacing: letterSpacing,
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
