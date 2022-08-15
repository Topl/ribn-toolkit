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
      switch (status) {
        case 'unconfirmed':
          return RibnColors.statusChipRed;
        case 'pending':
          return RibnColors.statusChipYellow;
        case 'confirmed':
          return RibnColors.statusChipGreen;
        default:
          return RibnColors.statusChipGreen;
      }
    }

    return Chip(
      labelPadding: const EdgeInsets.only(right: 7),
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      avatar: CircleAvatar(
        backgroundColor: colorByStatus(),
        radius: 4,
      ),
      label: Text(
        capitalize(status),
        style: RibnToolkitTextStyles.statusChip,
      ),
      backgroundColor: RibnColors.statusChipGrey,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
