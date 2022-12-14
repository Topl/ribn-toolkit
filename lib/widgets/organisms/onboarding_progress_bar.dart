import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/colors.dart';

/// Custom progress bar displayed during onboarding
class OnboardingProgressBar extends StatelessWidget {
  const OnboardingProgressBar({
    required this.numSteps,
    required this.currStep,
    this.stepWidth = 68,
    this.stepHeight = 6,
    this.progressBarWidth = 350,
    Key? key,
  }) : super(key: key);

  /// Total steps
  final int numSteps;

  /// Currently active step
  final int currStep;

  /// Width of step container
  final double stepWidth;

  /// Height of step container
  final double stepHeight;

  /// Max width of the progress bar
  final double progressBarWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: progressBarWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...List.generate(
            numSteps,
            (index) => AnimatedContainer(
              duration: const Duration(seconds: 1),
              decoration: BoxDecoration(
                color: index <= currStep
                    ? RibnColors.primary
                    : const Color(0xff6A969F),
                borderRadius: BorderRadius.circular(4),
              ),
              height: 6,
              width: stepWidth,
            ),
          )
        ],
      ),
    );
  }
}
