// import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/styles.dart';
import 'package:ribn_toolkit/utils.dart';

class InputDropdown extends StatefulWidget {
  @override
  State<InputDropdown> createState() => _InputDropdownState();
}

class _InputDropdownState extends State<InputDropdown> {
  String selectedNetwork = 'valhalla';

  List<String> networks = ['valhalla', 'toplnet', 'private'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 25,
      decoration: BoxDecoration(
        color: const Color(0xFF25B0A3),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(5),
      child: PopupMenuButton<String>(
        offset: const Offset(0, 25),
        padding: const EdgeInsets.all(0.0),
        elevation: 0,
        itemBuilder: (context) {
          return networks.map(
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
                            networkName == selectedNetwork ? const Color(0xFF80FF00) : const Color(0xffbdbdbd),
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
              height: 15,
              width: 50,
              child: Center(
                child: Text(
                  capitalize(selectedNetwork),
                  style: RibnToolkitTextStyles.h3.copyWith(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
            const Icon(Icons.arrow_drop_down, color: Colors.white, size: 10),
          ],
        ),
        onSelected: (String network) {
          setState(() {
            selectedNetwork = network;
          });
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
