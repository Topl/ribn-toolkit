// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_copy_button.dart';

class RoundedCopyTextField extends StatelessWidget {
  const RoundedCopyTextField(
      {this.backgroundColor = Colors.white,
      required this.text,
      required this.icon,
      required this.copyText,
      required this.copyIcon,
      required this.width,
      Key? key})
      : super(key: key);

  final Color backgroundColor;
  final String text;
  final SvgPicture icon;
  final String copyText;
  final Image copyIcon;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 34,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: RibnColors.lightGrey),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 7),
            child: SizedBox(width: 26, height: 26, child: icon),
          ),
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'DM Sans',
              fontSize: 13,
              color: RibnColors.defaultText,
            ),
          ),
          const Spacer(),
          CustomCopyButton(textToBeCopied: copyText, icon: copyIcon),
          const SizedBox(width: 4),
        ],
      ),
    );
  }
}
