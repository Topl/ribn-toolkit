// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/styles.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_icon_button.dart';
import 'package:ribn_toolkit/widgets/molecules/wave_container.dart';

/// A widget to display the title, back arrow button and cancel button on top of the page.
class CustomPageTextTitle extends StatelessWidget {
  const CustomPageTextTitle({
    required this.title,
    this.hideBackArrow = false,
    this.hideCloseCross = false,
    this.hideWaveAnimation = false,
    Key? key,
  }) : super(key: key);
  final String title;
  final bool hideBackArrow;
  final bool hideCloseCross;
  final bool hideWaveAnimation;

  @override
  Widget build(BuildContext context) {
    if (hideWaveAnimation == true) {
      return SizedBox(
          height: kIsWeb ? 90 : 128,
          width: double.infinity,
          child: TitleBody(title: title, hideBackArrow: hideBackArrow, hideCloseCross: hideCloseCross));
    }

    return WaveContainer(
      containerHeight: kIsWeb ? 90 : 128,
      containerWidth: double.infinity,
      waveAmplitude: 0,
      containerChild: Padding(
        // padding to account for device notches etc
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: TitleBody(title: title, hideBackArrow: hideBackArrow, hideCloseCross: hideCloseCross),
      ),
    );
  }
}

class TitleBody extends StatelessWidget {
  const TitleBody({
    Key? key,
    required this.title,
    required this.hideBackArrow,
    required this.hideCloseCross,
  }) : super(key: key);

  final String title;
  final bool hideBackArrow;
  final bool hideCloseCross;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Center(
          child: Text(
            title,
            style: RibnToolkitTextStyles.extH2.copyWith(
              color: RibnColors.lightGreyTitle,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        if (hideBackArrow != true)
          Positioned.fill(
            left: 20,
            child: Align(
              alignment: Alignment.centerLeft,
              child: CustomIconButton(
                icon: const Icon(
                  Icons.arrow_back,
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
        if (hideCloseCross != true)
          Positioned.fill(
            right: 20,
            child: Align(
              alignment: Alignment.centerRight,
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
      ],
    );
  }
}
