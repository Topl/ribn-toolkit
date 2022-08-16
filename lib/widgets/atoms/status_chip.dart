import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/styles.dart';
import 'package:ribn_toolkit/utils.dart';

class StatusChip extends StatelessWidget {
  const StatusChip({
    required this.status,
    Key? key,
  }) : super(key: key);

  final String status;

  @override
  Widget build(BuildContext context) {
    colorByStatus() {
      if (status == 'confirmed') {
        return RibnColors.statusChipGreen;
      }

      return RibnColors.statusChipRed;
    }

    return Container(
      height: 18,
      decoration: BoxDecoration(
        color: RibnColors.statusChipGrey,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: colorByStatus(),
            radius: 4,
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            capitalize(status),
            overflow: TextOverflow.visible,
            style: RibnToolkitTextStyles.statusChip,
          )
        ],
      ),
    );
  }
}
