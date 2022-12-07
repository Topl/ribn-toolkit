import 'package:flutter/cupertino.dart';

/// @dev This widget is to be used by any other widget thats wants to use H2
class RibnFont12TextWidget extends Text {
  final String text;
  final TextAlign textAlignment;
  final Color textColor;
  final FontWeight fontWeight;
  final double wordSpacing;
  final TextDecoration textDecoration;
  final TextOverflow textOverflow;
  final int maxLinesAllowed;
  const RibnFont12TextWidget(
      {Key? key,
      required this.text,
      required this.textAlignment,
      required this.textColor,
      required this.fontWeight,
      this.wordSpacing = 0,
      this.textDecoration = TextDecoration.none,
      this.textOverflow = TextOverflow.clip,
      this.maxLinesAllowed = 0})
      : super('', key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      overflow: textOverflow,
      style: TextStyle(
        overflow: textOverflow,
        color: textColor,
        wordSpacing: wordSpacing,
        fontWeight: fontWeight,
        fontFamily: 'DM Sans',
        fontSize: 12.0,
        decoration: textDecoration,
      ),
      textAlign: textAlignment,
    );
  }
}
