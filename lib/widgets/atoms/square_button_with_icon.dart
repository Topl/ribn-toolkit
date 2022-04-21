import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SquareButtonWithIcon extends StatelessWidget {
  const SquareButtonWithIcon(
      {required this.backgroundColor, required this.icon, required this.text, required this.onPressed, Key? key})
      : super(key: key);

  final Color backgroundColor;
  final SvgPicture icon;
  final Widget text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: 320,
      child: OutlinedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11),
            ),
          ),
          minimumSize: MaterialStateProperty.all(
            const Size(285, 165),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.all(0),
          ),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 30, right: 30),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color(0xffB1E7E1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: icon,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 30),
                child: text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
