// Flutter imports:
import 'package:flutter/cupertino.dart';

/// @dev This widget is to be used by any other widget thats wants to use H2
class RibnBodyFont12TextWidget extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color textColor;
  final FontWeight fontWeight;
  final double wordSpacing;
  const RibnBodyFont12TextWidget(
      {Key? key,
      required this.text,
      required this.textAlign,
      required this.textColor,
      required this.fontWeight,
      required this.wordSpacing})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(text,
        style: TextStyle(
            fontFamily: 'DM Sans',
            fontSize: 12,
            fontWeight: fontWeight,
            wordSpacing: wordSpacing),
        textAlign: textAlign);
  }
}
