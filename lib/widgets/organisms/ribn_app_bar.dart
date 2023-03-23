// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/styles.dart';
import 'package:ribn_toolkit/widgets/molecules/input_dropdown.dart';

/// Builds the top AppBar in the extension view.
/// Displays the network drop down and settings drop down.
class RibnAppBar extends StatefulWidget implements PreferredSizeWidget {
  const RibnAppBar({
    Key? key,
    required this.currentNetworkName,
    required this.networks,
    required this.updateNetwork,
    required this.settingsOptions,
    required this.selectSettingsOption,
    required this.chevronIconLink,
    required this.ribnLogoIconLink,
    required this.hamburgerIconLink,
    required this.onSelectChainDropdownOpen,
  })  : preferredSize = const Size.fromHeight(40),
        super(key: key);

  final String currentNetworkName;
  final List<String> networks;
  final Function(String) updateNetwork;
  final Map<String, Image> settingsOptions;
  final Function(String) selectSettingsOption;
  final String chevronIconLink;
  final String ribnLogoIconLink;
  final String hamburgerIconLink;

  /// Callback when the dropdown is opened
  final Function onSelectChainDropdownOpen;

  @override
  final Size preferredSize;

  @override
  _RibnAppBarState createState() => _RibnAppBarState();
}

class _RibnAppBarState extends State<RibnAppBar> {
  @override
  Widget build(BuildContext context) {
    List<String> networks = renameNetworks(widget.networks);
    String currentNetworkName = renameNetwork(widget.currentNetworkName);

    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[RibnColors.tertiary, RibnColors.primaryOffColor],
          ),
          boxShadow: [
            BoxShadow(
              color: RibnColors.blackShadow,
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
      ),
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSettingsMenu(widget.settingsOptions, widget.selectSettingsOption),
            const Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Image.asset(
                widget.ribnLogoIconLink,
                width: 46,
              ),
            ),
            const Spacer(flex: 1),
            InputDropdown(
              onOpen: () => widget.onSelectChainDropdownOpen(),
              selectedItem: currentNetworkName,
              items: networks,
              onChange: (selected) => widget.updateNetwork(widget.networks[networks.indexWhere((e) => e == selected)]),
              chevronIconLink: widget.chevronIconLink,
            ),
          ],
        ),
      ),
      centerTitle: false,
    );
  }

  List<String> renameNetworks(List<String> networks) {
    final List<String> renamedNetworks = networks.map((String e) => renameNetwork(e)).toList();
    return renamedNetworks;
  }

  String renameNetwork(String network) {
    switch (network.toLowerCase()) {
      case "toplnet":
        return "Topl mainnet";
      case "valhalla":
        return "Valhalla testnet";
      case "private":
        return "Private network";
      default:
        return "";
    }
  }

  /// Builds the settings drop down menu.
  Widget _buildSettingsMenu(Map<String, Image> settingsOptions, Function(String)? onSelected) {
    return Container(
      color: Colors.transparent,
      child: PopupMenuButton<String>(
        elevation: 0,
        child: SizedBox(width: 24, child: Image.asset(widget.hamburgerIconLink)),
        offset: const Offset(0, 30),
        onSelected: onSelected,
        padding: const EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.32),
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
                          style: RibnToolkitTextStyles.dropdownButtonStyle.copyWith(
                            color: RibnColors.defaultText,
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
