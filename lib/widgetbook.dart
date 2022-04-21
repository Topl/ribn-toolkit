import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ribn_toolkit/constants/assets.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/strings.dart';
import 'package:ribn_toolkit/constants/styles.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_icon_button.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_page_title.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_text_field.dart';
import 'package:ribn_toolkit/widgets/atoms/square_button_with_icon.dart';
import 'package:ribn_toolkit/widgets/molecules/asset_card.dart';
import 'package:ribn_toolkit/widgets/molecules/custom_tooltip.dart';
import 'package:ribn_toolkit/widgets/atoms/large_button.dart';
import 'package:ribn_toolkit/widgets/molecules/input_dropdown.dart';
import 'package:ribn_toolkit/widgets/organisms/progress_bar.dart';
import 'package:ribn_toolkit/widgets/organisms/ribn_app_bar.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:url_launcher/url_launcher.dart';

class WidgetBook extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final canvasWidth = 500.00;
  final canvasHeight = 500.00;
  final String tooltipUrl = 'https://topl.services';

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
                        'BUTTON TEXT',
                        style: RibnToolkitTextStyles.btnMedium.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Secondary',
                  builder: (context) => Center(
                    child: LargeButton(
                      buttonChild: Text(
                        'BUTTON TEXT',
                        style: RibnToolkitTextStyles.btnMedium.copyWith(
                          color: RibnColors.primary,
                        ),
                      ),
                      backgroundColor: RibnColors.secondary,
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
                      text: Text('BUTTON TEXT', style: RibnToolkitTextStyles.btnLarge),
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
                      hintText: Strings.hintSeedPhrase,
                      width: 268,
                      maxLength: 16,
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
              name: 'Dropdown',
              useCases: [
                WidgetbookUseCase(
                  name: 'App bar version',
                  builder: (context) => Center(
                    child: InputDropdown(),
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
                    width: canvasWidth,
                    height: 40,
                    child: RibnAppBar(),
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
            scaffoldBackgroundColor: const Color(0xffE9E9E9),
          ),
        ),
      ],
      devices: [
        Device(
          name: 'Square Canvas',
          resolution: Resolution.dimensions(
            nativeWidth: canvasWidth,
            nativeHeight: canvasHeight,
            scaleFactor: 1,
          ),
          type: DeviceType.desktop,
        ),
      ],
      appInfo: AppInfo(name: 'Ribn Toolkit'),
    );
  }
}
