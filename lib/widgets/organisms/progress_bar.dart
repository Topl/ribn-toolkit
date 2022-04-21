import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/strings.dart';
import 'package:ribn_toolkit/constants/styles.dart';
import 'package:steps_indicator/steps_indicator.dart';

/// Custom progress bar displayed during onboarding
class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar(this.currPage, {Key? key}) : super(key: key);
  final int currPage;
  final int numPages = 4;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            child: StepsIndicator(
              selectedStep: currPage,
              nbSteps: numPages,
              selectedStepColorOut: Colors.white,
              selectedStepColorIn: Colors.white,
              doneStepColor: Colors.white,
              doneLineColor: RibnColors.primary,
              undoneLineColor: RibnColors.inactive,
              isHorizontal: true,
              doneLineThickness: 3,
              lineLength: 80,
              undoneLineThickness: 3,
              selectedStepSize: 10,
              doneStepWidget: const CircleAvatar(
                backgroundColor: RibnColors.primary,
                foregroundColor: Colors.white,
                radius: 15,
                child: Icon(Icons.check),
              ),
              unselectedStepWidget: const CircleAvatar(
                backgroundColor: RibnColors.inactive,
                radius: 7,
              ),
              selectedStepWidget: CircleAvatar(
                radius: 22,
                backgroundColor: RibnColors.accent,
                child: CircleAvatar(
                  backgroundColor: RibnColors.primary,
                  foregroundColor: Colors.white,
                  radius: 15,
                  child: Text('${currPage + 1}'),
                ),
              ),
            ),
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 20),
                buildPageLabel(0, 80),
                const SizedBox(width: 20),
                buildPageLabel(1, 80),
                const SizedBox(width: 20),
                buildPageLabel(2, 80),
                const SizedBox(width: 20),
                buildPageLabel(3, 80),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Builds the appropriate label under the currently active position in the progress bar.
  Widget buildPageLabel(int pageNum, double width) {
    return SizedBox(
      width: width,
      child: Center(
        child: Text(
          getLabel(pageNum),
          textAlign: TextAlign.center,
          style: RibnToolkitTextStyles.smallBoldLabel.copyWith(
            color: pageNum != currPage ? Colors.transparent : RibnColors.defaultText,
          ),
        ),
      ),
    );
  }

  String getLabel(int pageNum) {
    switch (pageNum) {
      case 0:
        return Strings.generateSeedPhrase.toUpperCase();
      case 1:
        return Strings.writeDownSeedPhrase.toUpperCase();
      case 2:
        return Strings.confirmSeedPhrase.toUpperCase();
      case 3:
        return Strings.createWalletPassword.toUpperCase();
      case 4:
        return Strings.finalReview.toUpperCase();
      default:
        return '';
    }
  }
}
