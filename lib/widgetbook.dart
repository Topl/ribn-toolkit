import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ribn_toolkit/constants/assets.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/strings.dart';
import 'package:ribn_toolkit/constants/styles.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_checkbox.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_copy_button.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_icon_button.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_page_title.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_text_field.dart';
import 'package:ribn_toolkit/widgets/atoms/hover_icon_button.dart';
import 'package:ribn_toolkit/widgets/atoms/square_button_with_icon.dart';
import 'package:ribn_toolkit/widgets/molecules/asset_card.dart';
import 'package:ribn_toolkit/widgets/molecules/custom_tooltip.dart';
import 'package:ribn_toolkit/widgets/atoms/large_button.dart';
import 'package:ribn_toolkit/widgets/molecules/input_dropdown.dart';
import 'package:ribn_toolkit/widgets/organisms/progress_bar.dart';
import 'package:ribn_toolkit/widgets/organisms/ribn_app_bar.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:url_launcher/url_launcher.dart';

class WidgetBook extends StatefulWidget {
  @override
  State<WidgetBook> createState() => _WidgetBookState();
}

class _WidgetBookState extends State<WidgetBook> {
  final TextEditingController _controller = TextEditingController();
  final String tooltipUrl = 'https://topl.services';
  bool checked = false;
  dynamic onPress(string) {
    setState(() {
      selectedNetwork = string;
    });
  }

  String selectedNetwork = 'valhalla';
  dynamic selectSettingsOption(string) {}

  List<String> networks = ['valhalla', 'toplnet', 'private'];
  final Map<String, SvgPicture> settingsOptions = {
    'Support': SvgPicture.asset(RibnAssets.supportIcon),
    'Settings': SvgPicture.asset(RibnAssets.settingsIcon),
  };
  final chevronIconLink = RibnAssets.chevronDown;
  dynamic selectSettings(string) {}

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      categories: [
        WidgetbookCategory(
          name: 'Atoms',
          widgets: [
            WidgetbookComponent(
              name: 'Large Button',
              useCases: [
                WidgetbookUseCase(
                  name: 'Primary',
                  builder: (context) => Center(
                    child: LargeButton(
                      buttonChild: Text(
                        'Button Text',
                        style: RibnToolkitTextStyles.btnLarge.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: RibnColors.primary,
                      hoverColor: RibnColors.primaryButtonHover,
                      dropShadowColor: RibnColors.primaryButtonShadow,
                      onPressed: () {},
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Secondary',
                  builder: (context) => Center(
                    child: LargeButton(
                      buttonChild: Text(
                        'Button Text',
                        style: RibnToolkitTextStyles.btnLarge.copyWith(
                          color: RibnColors.primary,
                        ),
                      ),
                      backgroundColor: RibnColors.secondary,
                      hoverColor: RibnColors.secondaryButtonHover,
                      dropShadowColor: RibnColors.secondaryButtonShadow,
                      onPressed: () {},
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Ghost',
                  builder: (context) => Center(
                    child: LargeButton(
                      buttonChild: Text(
                        'Button Text',
                        style: RibnToolkitTextStyles.btnLarge.copyWith(
                          color: RibnColors.ghostButtonText,
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      dropShadowColor: Colors.transparent,
                      borderColor: RibnColors.ghostButtonText,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Square Button with Icon',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => Center(
                    child: SquareButtonWithIcon(
                      backgroundColor: RibnColors.primary,
                      icon: SvgPicture.asset(RibnAssets.plusIcon, width: 30),
                      text: Text(
                        'BUTTON TEXT',
                        style: RibnToolkitTextStyles.btnLarge.copyWith(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Custom Icon Button',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => Center(
                    child: CustomIconButton(
                      icon: SvgPicture.asset(RibnAssets.plusIcon, width: 30),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Hover Icon Button',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => Center(
                    child: HoverIconButton(
                      buttonText: Text(
                        'Edit',
                        style: RibnToolkitTextStyles.dropdownButtonStyle.copyWith(color: RibnColors.primary),
                      ),
                      buttonIcon: Image.asset(RibnAssets.editIcon),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Custom Copy Button',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => Center(
                    child: CustomCopyButton(
                      textToBeCopied: 'Copied text!',
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Custom Page Title',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: CustomPageTitle(title: Strings.mint),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Custom Text Field',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => Center(
                    child: CustomTextField(
                      controller: _controller,
                      hintText: 'Type Something',
                      width: 268,
                      maxLength: 16,
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Checkbox',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => Center(
                    child: CustomCheckbox(
                      fillColor: MaterialStateProperty.all(Colors.transparent),
                      checkColor: RibnColors.active,
                      borderColor: checked ? RibnColors.active : RibnColors.inactive,
                      value: checked,
                      onChanged: (val) {
                        setState(() {
                          checked = val;
                        });
                      },
                      label: RichText(
                        text: TextSpan(
                          style: RibnToolkitTextStyles.body1
                              .copyWith(color: checked ? RibnColors.defaultText : RibnColors.inactive),
                          children: const [
                            TextSpan(
                              text: 'Checkbox text',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        WidgetbookCategory(
          name: 'Molecules',
          widgets: [
            WidgetbookComponent(
              name: 'Asset Card',
              useCases: [
                WidgetbookUseCase(
                  name: 'All Details',
                  builder: (context) => Center(
                    child: AssetCard(
                      onCardPress: () {},
                      iconImage: Image.asset(RibnAssets.coffGreenIcon),
                      shortName: const Text(
                        'TstAst',
                        style: RibnToolkitTextStyles.assetShortNameStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      assetLongName: const Text(
                        'Test Asset Name',
                        style: RibnToolkitTextStyles.assetLongNameStyle,
                      ),
                      missingAsstDetailsCondition: false,
                      assetQuantityDetails: Text(
                        '1500 G',
                        overflow: TextOverflow.ellipsis,
                        style: RibnToolkitTextStyles.assetShortNameStyle.copyWith(
                          color: RibnColors.primary,
                        ),
                      ),
                      firstIcon: Image.asset(
                        RibnAssets.sendIcon,
                        width: 12,
                      ),
                      onFirstIconPress: () {},
                      secondIcon: Image.asset(
                        RibnAssets.receiveIcon,
                        width: 12,
                      ),
                      onSecondIconPress: () {},
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Missing Details',
                  builder: (context) => Center(
                    child: AssetCard(
                      onCardPress: () {},
                      iconImage: Image.asset(RibnAssets.undefinedIcon),
                      shortName: const Text(
                        'TstAst',
                        style: RibnToolkitTextStyles.assetShortNameStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      assetLongName: Container(
                        width: 139,
                        height: 13,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(9)),
                          color: Color(0xcfdadada),
                        ),
                      ),
                      missingAsstDetailsCondition: true,
                      assetQuantityDetails: Text(
                        '1500 G',
                        overflow: TextOverflow.ellipsis,
                        style: RibnToolkitTextStyles.assetShortNameStyle.copyWith(
                          color: RibnColors.primary,
                        ),
                      ),
                      firstIcon: Image.asset(
                        RibnAssets.sendIcon,
                        width: 12,
                      ),
                      onFirstIconPress: () {},
                      secondIcon: Image.asset(
                        RibnAssets.receiveIcon,
                        width: 12,
                      ),
                      onSecondIconPress: () {},
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Dropdown',
              useCases: [
                WidgetbookUseCase(
                  name: 'App bar version',
                  builder: (context) => Center(
                    child: InputDropdown(
                        selectedNetwork: selectedNetwork,
                        networks: ['valhalla', 'toplnet', 'private'],
                        onChange: onPress,
                        chevronIconLink: RibnAssets.chevronDown),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Custom Tooltip',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => const Center(
                    child: CustomToolTip(
                      toolTipChild: Text(
                        Strings.assetCodeShortInfo,
                        style: RibnToolkitTextStyles.toolTipTextStyle,
                      ),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Subtitled',
                  builder: (context) => Center(
                    child: CustomToolTip(
                      toolTipChild: Column(
                        children: [
                          Text(
                            Strings.howIsMySeedPhraseUnrecoverable,
                            style: RibnToolkitTextStyles.toolTipTextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            Strings.howIsMySeedPhraseUnrecoverableNewLine,
                            style: RibnToolkitTextStyles.toolTipTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'With link',
                  builder: (context) => Center(
                    child: CustomToolTip(
                      toolTipChild: RichText(
                        text: TextSpan(
                          style: RibnToolkitTextStyles.toolTipTextStyle,
                          children: [
                            const TextSpan(
                              text: Strings.refillCurrentPolyBalance,
                            ),
                            WidgetSpan(
                              child: GestureDetector(
                                onTap: () async => await launch(tooltipUrl),
                                child: Row(
                                  children: [
                                    Text(
                                      ' Baas. ',
                                      style: RibnToolkitTextStyles.toolTipTextStyle.copyWith(
                                        color: const Color(0xff00B5AB),
                                      ),
                                    ),
                                    Image.asset(
                                      RibnAssets.openInNewWindow,
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        WidgetbookCategory(
          name: 'Organisms',
          widgets: [
            WidgetbookComponent(
              name: 'Ribn App Bar',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => SizedBox(
                    width: 500.00,
                    height: 40,
                    child: RibnAppBar(
                      currentNetworkName: selectedNetwork,
                      networks: networks,
                      updateNetwork: onPress,
                      settingsOptions: settingsOptions,
                      selectSettingsOption: selectSettings,
                      chevronIconLink: chevronIconLink,
                      ribnLogoIconLink: RibnAssets.newRibnLogo,
                      hamburgerIconLink: RibnAssets.hamburgerMenu,
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Progress Bar',
              useCases: [
                WidgetbookUseCase(
                  name: 'First Step',
                  builder: (context) => const Center(
                    child: CustomProgressBar(0),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Middle Step',
                  builder: (context) => const Center(
                    child: CustomProgressBar(2),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Final Step',
                  builder: (context) => const Center(
                    child: CustomProgressBar(3),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: ThemeData(
            // You can change the background color of the canvas as so:
            scaffoldBackgroundColor: const Color(0xFFF8F8F8),
          ),
        ),
      ],
      devices: [
        Device(
          name: 'Square Canvas',
          resolution: Resolution.dimensions(
            nativeWidth: 500.00,
            nativeHeight: 500.00,
            scaleFactor: 1,
          ),
          type: DeviceType.desktop,
        ),
        Device(
          name: 'iPhone 12 Pro',
          resolution: Resolution.dimensions(
            nativeWidth: 390,
            nativeHeight: 844,
            scaleFactor: 1,
          ),
          type: DeviceType.desktop,
        ),
      ],
      appInfo: AppInfo(name: 'Ribn Toolkit'),
    );
  }
}
