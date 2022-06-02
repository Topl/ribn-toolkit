import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

/// Custom progress bar displayed during onboarding
class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({
    required this.currPage,
    this.width = 851,
    required this.stepLabels,
    Key? key,
  }) : super(key: key);
  final int currPage;
  final double width;
  final Map<int, String> stepLabels;

  @override
  Widget build(BuildContext context) {
    final numPages = stepLabels.length;

    return SizedBox(
      height: 200,
      width: width,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 58),
                child: Center(
                  child: Container(
                    color: RibnColors.inactive,
                    width: double.infinity,
                    height: 3,
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 200,
                child: StepProgressIndicator(
                  currentStep: currPage,
                  totalSteps: numPages,
                  size: 160,
                  direction: Axis.horizontal,
                  customStep: (index, color, _) => renderProgressIcon(index),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  renderProgressIcon(index) {
    if (index < currPage) {
      return Column(
        children: const [
          SizedBox(
            height: 25,
          ),
          CircleAvatar(
            backgroundColor: RibnColors.primary,
            foregroundColor: Colors.white,
            radius: 15,
            child: Icon(
              Icons.check,
              size: 20,
            ),
          ),
        ],
      );
    } else if (index == currPage) {
      return Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: RibnColors.inactive,
            child: CircleAvatar(
              backgroundColor: RibnColors.primary,
              foregroundColor: Colors.white,
              radius: 14,
              child: Text('${index + 1}'),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            '${stepLabels[index]}',
            textAlign: TextAlign.center,
          ),
        ],
      );
    } else if (index > currPage) {
      return Column(
        children: const [
          SizedBox(
            height: 30,
          ),
          CircleAvatar(
            backgroundColor: RibnColors.inactive,
            radius: 10,
          ),
        ],
      );
    }
  }
}
