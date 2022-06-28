import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class WaveContainer extends StatelessWidget {
  const WaveContainer({
    this.containerHeight = double.infinity,
    this.containerWidth = double.infinity,
    this.waveAmplitude = 30,
    required this.containerChild,
    Key? key,
  }) : super(key: key);

  /// This sets the height of the container
  final double containerHeight;

  /// This sets the width of the container
  final double containerWidth;

  /// This sets the height of the animated waves
  final double waveAmplitude;

  /// This renders what you pass through as a child on top of the wave background
  final Widget containerChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      width: containerWidth,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[RibnColors.tertiary, RibnColors.primaryOffColor],
        ),
      ),
      child: Stack(
        children: [
          ClipRect(
            child: WaveWidget(
              config: CustomConfig(
                gradients: [
                  [const Color(0xFF155464), const Color(0xEE155464)],
                  [const Color(0xFF1e7e80), const Color(0x661e7e80)],
                  [const Color(0xFF1e7e80), const Color(0x661e7e80)],
                  [const Color(0xFF23968E), const Color(0xFF155464)]
                ],
                durations: [35000, 19440, 10800, 6000],
                heightPercentages: [0.20, 0.23, 0.25, 0.30],
                blur: const MaskFilter.blur(BlurStyle.solid, 60),
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
              waveAmplitude: waveAmplitude,
              size: const Size(
                double.infinity,
                double.infinity,
              ),
            ),
          ),
          containerChild,
        ],
      ),
    );
  }
}
