import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/styles.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_icon_button.dart';
import 'package:ribn_toolkit/widgets/molecules/wave_container.dart';

/// A widget to display the title and back button on top of the page.
class CustomPageTitle extends StatelessWidget {
  const CustomPageTitle({required this.title, this.hideBackArrow = false, Key? key}) : super(key: key);
  final String title;
  final bool hideBackArrow;

  @override
  Widget build(BuildContext context) {
    return WaveContainer(
      containerHeight: 90,
      containerWidth: double.infinity,
      waveAmplitude: 0,
      containerChild: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: Stack(
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
          ],
        ),
      ),
    );
  }
}
