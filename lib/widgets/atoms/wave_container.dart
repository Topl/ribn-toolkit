import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class WaveContainer extends StatelessWidget {
  const WaveContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 500,
      // constraints: const BoxConstraints.expand(height: 183),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          // colors: <Color>[RibnColors.tertiary, RibnColors.primaryOffColor],
          colors: <Color>[RibnColors.tertiary, RibnColors.primaryOffColor],
        ),
      ),
      child: Stack(
        children: [
          WaveWidget(
            config: CustomConfig(
              gradients: [
                [const Color(0xFF155464), const Color(0xEE155464)],
                [const Color(0xFF1e7e80), const Color(0x661e7e80)],
                [const Color(0xFF1e7e80), const Color(0x661e7e80)],
                [const Color(0xFF23968E), const Color(0x661e7e80)]
              ],
              durations: [35000, 19440, 10800, 6000],
              heightPercentages: [0.20, 0.23, 0.25, 0.30],
              blur: const MaskFilter.blur(BlurStyle.inner, 60),
              gradientBegin: Alignment.bottomLeft,
              gradientEnd: Alignment.topRight,
            ),
            waveAmplitude: 0,
            size: const Size(
              double.infinity,
              double.infinity,
            ),
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(top: 8.0),
          //       child: Text(
          //         '\$${vm.polyBalance}',
          //         style: RibnToolkitTextStyles.h3.copyWith(
          //           color: RibnColors.secondary,
          //         ),
          //       ),
          //     ),
          //     const SizedBox(height: 20),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         _buildButton(Strings.send, vm.navigateToSendPolys),
          //         const SizedBox(width: 10),
          //         _buildButton(Strings.receive, () async {
          //           await showReceivingAddress();
          //         }),
          //       ],
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
