// Flutter imports:
import 'package:flutter/cupertino.dart';

/// @dev This widget is to be used by any other widget thats wants to use H2
class RibnFont12TextWidget extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color textColor;
  final FontWeight fontWeight;
  final double wordSpacing;
  final double height;
  const RibnFont12TextWidget(
      {Key? key,
      required this.text,
      required this.textAlign,
      required this.textColor,
      required this.fontWeight,
      this.wordSpacing = 0,
      this.height = 0})
      : super(key: key);
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
        fontSize: 12.0,
        decoration: TextDecoration.none,
      ),
      textAlign: textAlign,
    );
  }
}
