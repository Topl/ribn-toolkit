import 'package:flutter/cupertino.dart';
import '../../../constants/styles.dart';

/// @dev This widget is to be used by any other widget thats wants to use H2
class RibnLargeH3TextWidget extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color textColor;
  const RibnLargeH3TextWidget(
      {Key? key,
      required this.text,
      required this.textAlign,
      required this.textColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: RibnToolkitTextStyles.largeh3.copyWith(
        color: textColor,
      ),
      textAlign: textAlign,
    );
  }
}
