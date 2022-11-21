import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/styles.dart';

class AnimatedCircleStepLoader extends StatefulWidget {
  const AnimatedCircleStepLoader({
    required this.stepLabels,
    required this.showStepLoader,
    required this.activeCircleColor,
    required this.inactiveCircleColor,
    required this.activeCircleRadius,
    required this.inactiveCircleRadius,
    required this.dotPadding,
    this.durationInSeconds = 1,
    this.hideTitle = false,
    Key? key,
  }) : super(key: key);

  final Map<int, String> stepLabels;
  final Function showStepLoader;
  final int durationInSeconds;

  final Color activeCircleColor;
  final Color inactiveCircleColor;
  final double activeCircleRadius;
  final double inactiveCircleRadius;
  final double dotPadding;
  final bool hideTitle;

  @override
  State<AnimatedCircleStepLoader> createState() => _AnimatedCircleStepLoaderState();
}

class _AnimatedCircleStepLoaderState extends State<AnimatedCircleStepLoader> {
  late final Timer timer;
  late int numCircles = widget.stepLabels.length;
  int currCircle = 0;
  late List<int> circlePositions = List.generate(numCircles, (idx) => idx).toList();
  bool seedPhraseGenerating = true;

  @override
  void initState() {
    final Duration duration = Duration(seconds: widget.durationInSeconds);
    timer = Timer.periodic(duration, (timer) {
      if (timer.tick == numCircles) {
        widget.showStepLoader();
      }
      currCircle = (currCircle + 1) % numCircles;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          if (widget.hideTitle != true)
            SizedBox(
              width: kIsWeb ? double.infinity : 312,
              child: _buildTitle(currCircle),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: circlePositions.map(_buildAnimatedContainer).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(int position) {
    return Text(
      widget.stepLabels[position]!,
      style: RibnToolkitTextStyles.onboardingH1,
      textAlign: TextAlign.center,
    );
  }

  /// Animate color and radius of the active circles.
  Widget _buildAnimatedContainer(int position) {
    final Duration duration = Duration(seconds: widget.durationInSeconds);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.dotPadding),
      child: AnimatedContainer(
        duration: duration,
        child: CircleAvatar(
          backgroundColor: position <= currCircle ? widget.activeCircleColor : widget.inactiveCircleColor,
          radius: currCircle == position ? widget.activeCircleRadius : widget.inactiveCircleRadius,
        ),
      ),
    );
  }
}
