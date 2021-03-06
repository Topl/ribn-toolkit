import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/styles.dart';

class AnimatedCircleStepLoader extends StatefulWidget {
  AnimatedCircleStepLoader({
    required this.stepLabels,
    required this.showStepLoader,
    Key? key,
  }) : super(key: key);

  final Map<int, String> stepLabels;
  Function showStepLoader;

  @override
  State<AnimatedCircleStepLoader> createState() => _AnimatedCircleStepLoaderState();
}

class _AnimatedCircleStepLoaderState extends State<AnimatedCircleStepLoader> {
  late final Timer timer;
  late int numCircles = widget.stepLabels.length;
  final double smallRadius = 8;
  final double bigRadius = 16;
  int currCircle = 0;
  final Duration duration = const Duration(seconds: 2);
  late List<int> circlePositions = List.generate(numCircles, (idx) => idx).toList();
  bool seedPhraseGenerating = true;

  @override
  void initState() {
    timer = Timer.periodic(duration, (timer) {
      if (timer.tick == numCircles) {
        widget.showStepLoader();
        timer.cancel();
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
      height: 300,
      width: 312,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 101,
            width: 312,
            child: _buildTitle(currCircle),
          ),
          SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: circlePositions.map(_buildAnimatedContainer).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(int position) {
    return Text(
      widget.stepLabels[position]!,
      style: RibnToolkitTextStyles.h1,
      textAlign: TextAlign.center,
    );
  }

  /// Animate color and radius of the active circles.
  Widget _buildAnimatedContainer(int position) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AnimatedContainer(
        duration: duration,
        child: CircleAvatar(
          backgroundColor: position <= currCircle ? RibnColors.primary : RibnColors.inactive,
          radius: currCircle == position ? bigRadius : smallRadius,
        ),
      ),
    );
  }
}
