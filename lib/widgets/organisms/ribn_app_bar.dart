import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ribn_toolkit/constants/assets.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/styles.dart';
import 'package:ribn_toolkit/utils.dart';
import 'package:ribn_toolkit/widgets/molecules/input_dropdown.dart';

/// Builds the top AppBar in the extension view.
/// Displays the network drop down and settings drop down.
class RibnAppBar extends StatefulWidget {
  @override
  _RibnAppBarState createState() => _RibnAppBarState();
}

class _RibnAppBarState extends State<RibnAppBar> {
  String selectedNetwork = 'valhalla';
  Map selectedSettingsOption = {};

  List<String> networks = ['valhalla', 'toplnet', 'private'];
  final Map<String, SvgPicture> settingsOptions = {
    'Support': SvgPicture.asset(RibnAssets.supportIcon),
    'Settings': SvgPicture.asset(RibnAssets.settingsIcon),
  };

  dynamic updateNetwork() {}

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: RibnColors.primary,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InputDropdown(),
            const Spacer(),
            _buildSettingsMenu(settingsOptions),
          ],
        ),
      ),
      centerTitle: false,
    );
  }

  /// Builds the settings drop down menu.
  Widget _buildSettingsMenu(Map<String, SvgPicture> settingsOptions) {
    return Container(
      color: RibnColors.primary,
      child: PopupMenuButton<String>(
        child: SizedBox(width: 30, child: SvgPicture.asset(RibnAssets.menuIcon)),
        offset: const Offset(0, 30),
        // onSelected: onSelected,
        padding: const EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        itemBuilder: (BuildContext context) {
          return settingsOptions.keys.map(
            (String currOption) {
              return PopupMenuItem<String>(
                value: currOption,
                padding: EdgeInsets.zero,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 15, child: settingsOptions[currOption]),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 50,
                        child: Text(
                          currOption,
                          style: const TextStyle(
                            color: RibnColors.primary,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ).toList();
        },
      ),
    );
  }
}
