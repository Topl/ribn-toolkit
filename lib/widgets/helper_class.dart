import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/assets.dart';

class HelperClass {
  static TextEditingController textController = TextEditingController();
  static TextEditingController noteController = TextEditingController();
  static TextEditingController assetLongNameController = TextEditingController();
  static TextEditingController assetShortNameController = TextEditingController();
  static TextEditingController amountController = TextEditingController();
  static TextEditingController recipientController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static List<TextEditingController> controllers = [];

  static String tooltipUrl = 'https://topl.services';

  static bool checked = false;

  static String selectedNetwork = 'valhalla';

  static dynamic selectSettingsOption(string) {}

  static List<String> networks = ['valhalla', 'toplnet', 'private'];

  static Map<String, Image> settingsOptions = {
    'Support': Image.asset(RibnAssets.supportIcon),
    'Settings': Image.asset(RibnAssets.settingsIcon),
  };

  static var chevronIconLink = RibnAssets.chevronDown;

  static dynamic selectSettings(string) {}

  static String? selectedUnit;

  static List pages = [0, 1, 2];

  static List<Image> pageIcons = [
    Image.asset(RibnAssets.walletGrey),
    Image.asset(RibnAssets.circlePlus),
    Image.asset(RibnAssets.clockGrey)
  ];

  static List<Image> activePageIcons = [
    Image.asset(RibnAssets.walletBlue),
    Image.asset(RibnAssets.circlePlus),
    Image.asset(RibnAssets.clockBlue)
  ];

  static int currPage = 0;

  static String? selectedIcon;

  static String validRecipientAddress = '';

  static bool showDropdown = false;

  static String? selectedItem;

  static bool obscurePassword = true;

  static Map<int, String> stepLabels = {0: 'Step 1', 1: 'Step 2', 2: 'Step 3', 3: 'Step 4', 4: 'Step 5'};

  static int currentTabIndex = 0;

  static bool customToggleValue = false;

  static List<String> itemsToSelectFrom = ['Sent', 'Received', 'Minted'];

  static String currentSelectedItem = 'Transaction types';
}
