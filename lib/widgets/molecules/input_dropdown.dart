import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/styles.dart';
import 'package:ribn_toolkit/utils.dart';

class InputDropdown extends StatefulWidget {
  const InputDropdown({
    required this.selectedNetwork,
    required this.networks,
    required this.onChange,
    required this.chevronIconLink,
    Key? key,
  }) : super(key: key);

  final String selectedNetwork;
  final List<String> networks;
  final Function(String) onChange;
  final String chevronIconLink;

  @override
  State<InputDropdown> createState() => _InputDropdownState();
}

class _InputDropdownState extends State<InputDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 21,
      decoration: BoxDecoration(
        color: RibnColors.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(5),
      child: PopupMenuButton<String>(
        offset: const Offset(0, 25),
        padding: const EdgeInsets.all(0.0),
        elevation: 0,
        itemBuilder: (context) {
          return widget.networks.map(
            (String networkName) {
              return PopupMenuItem(
                value: networkName,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: CircleAvatar(
                        backgroundColor:
                            networkName == widget.selectedNetwork ? const Color(0xFF80FF00) : const Color(0xffbdbdbd),
                        radius: 3,
                      ),
                    ),
                    Text(capitalize(networkName)),
                  ],
                ),
              );
            },
          ).toList();
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: CircleAvatar(backgroundColor: Color(0xFF80FF00), radius: 3),
            ),
            SizedBox(
              height: 20,
              width: 50,
              child: Center(
                child: Text(
                  capitalize(widget.selectedNetwork),
                  style: RibnToolkitTextStyles.h3.copyWith(
                    color: Colors.white,
                    fontSize: 10,
                    height: 1.2,
                  ),
                ),
              ),
            ),
            Image.asset(
              widget.chevronIconLink,
              width: 10.0,
            ),
          ],
        ),
        onSelected: (String network) {
          widget.onChange(network);
        },
      ),
    );
  }
}

Row renderDropdownRow(item, currentNetworkName, text) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: CircleAvatar(
          backgroundColor: item == currentNetworkName ? const Color(0xFF80FF00) : const Color(0xffbdbdbd),
          radius: 3,
        ),
      ),
      text
    ],
  );
}
