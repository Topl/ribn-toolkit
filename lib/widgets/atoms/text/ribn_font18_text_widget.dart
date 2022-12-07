import 'package:flutter/cupertino.dart';

/// @dev This widget is to be used by any other widget thats wants to use H2
class RibnFont18TextWidget extends Text {
  final String text;
  final TextAlign textAlignment;
  final Color textColor;
  final FontWeight fontWeight;
  final double wordSpacing;
  final double textHeight;
  final TextHeightBehavior heightBehavior;
  const RibnFont18TextWidget(
      {Key? key,
      required this.text,
      required this.textAlignment,
      required this.textColor,
      required this.fontWeight,
      this.wordSpacing = 0,
      this.heightBehavior = const TextHeightBehavior(),
      this.textHeight = 0})
      : super('', key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      textHeightBehavior: heightBehavior,
      style: TextStyle(
          fontFamily: 'DM Sans',
          fontSize: 18,
          color: textColor,
          fontWeight: fontWeight,
          height: textHeight,
          wordSpacing: wordSpacing),
      textAlign: textAlign,
    );
  }
}
