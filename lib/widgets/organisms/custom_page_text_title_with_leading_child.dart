import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/styles.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_icon_button.dart';
import 'package:ribn_toolkit/widgets/molecules/wave_container.dart';

/// A widget to display the title, cancel button and a child widget on top of the page.
/// With this title widget the title is not aligned with the other elements
class CustomPageTextTitleWithLeadingChild extends StatelessWidget {
  const CustomPageTextTitleWithLeadingChild({
    required this.title,
    required this.child,
    this.hideCloseCross = false,
    this.hideWaveAnimation = false,
    Key? key,
  }) : super(key: key);
  final String title;
  final dynamic child;
  final bool hideCloseCross;
  final bool hideWaveAnimation;

  @override
  Widget build(BuildContext context) {
    if (hideWaveAnimation == true) {
      return SizedBox(
        height: kIsWeb
            ? 110
            : Platform.isIOS
                ? 160
                : 120,
        width: double.infinity,
        child: TitleBody(
          title: title,
          hideCloseCross: hideCloseCross,
          child: child,
        ),
      );
    }

    return WaveContainer(
      containerHeight: kIsWeb
          ? 110
          : Platform.isIOS
              ? 160
              : 120,
      containerWidth: double.infinity,
      waveAmplitude: 0,
      containerChild: Padding(
        // padding to account for device notches etc
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: TitleBody(
          title: title,
          hideCloseCross: hideCloseCross,
          child: child,
        ),
      ),
    );
  }
}

class TitleBody extends StatelessWidget {
  const TitleBody({
    Key? key,
    required this.title,
    required this.hideCloseCross,
    required this.child,
  }) : super(key: key);

  final String title;
  final bool hideCloseCross;
  final dynamic child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Positioned.fill(
          top: 20,
          left: 20,
          child: Align(
            alignment: Alignment.topLeft,
            child: child,
          ),
        ),
        if (hideCloseCross != true)
          Positioned.fill(
            top: 20,
            right: 20,
            child: Align(
              alignment: Alignment.topRight,
              child: CustomIconButton(
                icon: const Icon(
                  Icons.close,
                  color: RibnColors.lightGreyTitle,
                ),
                onPressed: () {
                  Navigator.popUntil(context, (Route route) => route.settings.name == '/home');
                },
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
            ),
          ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Text(
              title,
              style: RibnToolkitTextStyles.extH2.copyWith(
                color: RibnColors.lightGreyTitle,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
