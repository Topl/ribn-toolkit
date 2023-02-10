import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/assets.dart';
import '../../../constants/colors.dart';
import '../../atoms/custom_icon_button.dart';
import '../../atoms/large_button.dart';
import '../../atoms/text/ribn_font13_text_widget.dart';
import '../../atoms/text/ribn_h3_text_widget.dart';
import '../wave_container.dart';

class RibnMessageScreen extends StatelessWidget {
  final String title;
  final String topMessage;
  final String bottomMessage;
  final bool isError;
  final double width;
  final double height;
  final Color buttonTitleColor;
  final String buttonTitle;
  final void Function()? onTap;
  const RibnMessageScreen(
      {Key? key,
      required this.topMessage,
      required this.bottomMessage,
      required this.isError,
      required this.title,
      required this.width,
      required this.height,
      required this.buttonTitleColor,
      required this.buttonTitle,
      this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WaveContainer(
      containerChild: Material(
        type: MaterialType.transparency,
        child: Padding(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, left: 100),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: CustomIconButton(
                      icon: const Icon(
                        Icons.close,
                        color: RibnColors.lightGreyTitle,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: RibnH3TextWidget(
                    text: title,
                    textAlign: TextAlign.justify,
                    textColor: RibnColors.whiteColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    isError ? RibnAssets.errorFace : RibnAssets.checkCircleIcon,
                    scale: isError ? 2 : 0.5,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: RibnFont13TextWidget(
                    text: topMessage,
                    textAlign: TextAlign.justify,
                    textColor: RibnColors.whiteColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: RibnFont13TextWidget(
                    text: bottomMessage,
                    textAlign: TextAlign.justify,
                    textColor: RibnColors.whiteColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: LargeButton(
                    buttonChild: RibnFont13TextWidget(
                        text: buttonTitle,
                        textAlign: TextAlign.center,
                        textColor: buttonTitleColor,
                        fontWeight: FontWeight.normal),
                    backgroundColor: RibnColors.primaryOffColor,
                    hoverColor: RibnColors.primaryButtonHover,
                    dropShadowColor: RibnColors.primaryButtonShadow,
                    onPressed: onTap,
                  ),
                ),
              )
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
      containerWidth: width,
      containerHeight: height,
    );
  }
}
