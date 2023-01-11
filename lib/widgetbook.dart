// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:widgetbook/widgetbook.dart';

// Project imports:
import 'package:ribn_toolkit/constants/assets.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/ribn_sample_data_models.dart';
import 'package:ribn_toolkit/constants/strings.dart';
import 'package:ribn_toolkit/constants/styles.dart';
import 'package:ribn_toolkit/constants/ui_constants.dart';
import 'package:ribn_toolkit/utils.dart';
import 'package:ribn_toolkit/widgets/atoms/animated_expand_button.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_checkbox.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_copy_button.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_dropdown.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_icon_button.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_text_field.dart';
import 'package:ribn_toolkit/widgets/atoms/custom_toggle.dart';
import 'package:ribn_toolkit/widgets/atoms/error_bubble.dart';
import 'package:ribn_toolkit/widgets/atoms/hover_icon_button.dart';
import 'package:ribn_toolkit/widgets/atoms/large_button.dart';
import 'package:ribn_toolkit/widgets/atoms/peekaboo_button.dart';
import 'package:ribn_toolkit/widgets/atoms/rounded_copy_text_field.dart';
import 'package:ribn_toolkit/widgets/atoms/seperators/ribn_dashed_line.dart';
import 'package:ribn_toolkit/widgets/atoms/status_chip.dart';
import 'package:ribn_toolkit/widgets/atoms/text/ribn_font10_text_widget.dart';
import 'package:ribn_toolkit/widgets/atoms/text/ribn_font12_text_widget.dart';
import 'package:ribn_toolkit/widgets/atoms/text/ribn_font13_text_widget.dart';
import 'package:ribn_toolkit/widgets/atoms/text/ribn_font14_text_widget.dart';
import 'package:ribn_toolkit/widgets/atoms/text/ribn_font16_text_widget.dart';
import 'package:ribn_toolkit/widgets/atoms/text/ribn_font18_text_widget.dart';
import 'package:ribn_toolkit/widgets/atoms/text/ribn_font19_text_widget.dart';
import 'package:ribn_toolkit/widgets/atoms/text/ribn_h1_text_widget.dart';
import 'package:ribn_toolkit/widgets/atoms/text/ribn_h2_text_widget.dart';
import 'package:ribn_toolkit/widgets/atoms/text/ribn_h3_text_widget.dart';
import 'package:ribn_toolkit/widgets/atoms/text/ribn_h4_text_widget.dart';
import 'package:ribn_toolkit/widgets/atoms/text/ribn_h5_text_widget.dart';
import 'package:ribn_toolkit/widgets/helper_class.dart';
import 'package:ribn_toolkit/widgets/molecules/accordion.dart';
import 'package:ribn_toolkit/widgets/molecules/animated_circle_step_loader.dart';
import 'package:ribn_toolkit/widgets/molecules/asset_amount_field.dart';
import 'package:ribn_toolkit/widgets/molecules/asset_card.dart';
import 'package:ribn_toolkit/widgets/molecules/asset_long_name_field.dart';
import 'package:ribn_toolkit/widgets/molecules/asset_selection_field.dart';
import 'package:ribn_toolkit/widgets/molecules/asset_short_name_field.dart';
import 'package:ribn_toolkit/widgets/molecules/custom_modal.dart';
import 'package:ribn_toolkit/widgets/molecules/custom_tooltip.dart';
import 'package:ribn_toolkit/widgets/molecules/input_dropdown.dart';
import 'package:ribn_toolkit/widgets/molecules/loading_spinner.dart';
import 'package:ribn_toolkit/widgets/molecules/note_field.dart';
import 'package:ribn_toolkit/widgets/molecules/onboarding_action_button.dart';
import 'package:ribn_toolkit/widgets/molecules/password_text_field.dart';
import 'package:ribn_toolkit/widgets/molecules/recipient_field.dart';
import 'package:ribn_toolkit/widgets/molecules/ribn_activity_details.dart';
import 'package:ribn_toolkit/widgets/molecules/ribn_activity_tile.dart';
import 'package:ribn_toolkit/widgets/molecules/ribn_checkbox_wrappable_text.dart';
import 'package:ribn_toolkit/widgets/molecules/ribn_custom_modal.dart';
import 'package:ribn_toolkit/widgets/molecules/shimmer_loader.dart';
import 'package:ribn_toolkit/widgets/molecules/sliding_segment_control.dart';
import 'package:ribn_toolkit/widgets/molecules/wave_container.dart';
import 'package:ribn_toolkit/widgets/organisms/custom_page_dropdown_title.dart';
import 'package:ribn_toolkit/widgets/organisms/custom_page_text_title.dart';
import 'package:ribn_toolkit/widgets/organisms/custom_page_text_title_with_leading_child.dart';
import 'package:ribn_toolkit/widgets/organisms/onboarding_progress_bar.dart';
import 'package:ribn_toolkit/widgets/organisms/ribn_app_bar.dart';
import 'package:ribn_toolkit/widgets/organisms/ribn_bottom_app_bar.dart';
import 'package:ribn_toolkit/widgets/organisms/ribn_bottom_app_bar_v2.dart';
import 'package:ribn_toolkit/widgets/organisms/ribn_disconnect_app_container.dart';
import 'package:ribn_toolkit/widgets/organisms/ribn_tx_container.dart';

class WidgetBook extends StatefulWidget {
  const WidgetBook({Key? key}) : super(key: key);

  @override
  State<WidgetBook> createState() => _WidgetBookState();
}

class _WidgetBookState extends State<WidgetBook> {
  int currentIndex = 0;
  @override
  void initState() {
    HelperClass.controllers = [
      HelperClass.textController,
      HelperClass.noteController,
      HelperClass.assetLongNameController,
      HelperClass.assetShortNameController,
      HelperClass.amountController,
      HelperClass.recipientController,
      HelperClass.passwordController
    ];
    // initialize listeners for each of the TextEditingControllers
    HelperClass.controllers.forEach(initListener);
    super.initState();
  }

  @override
  void dispose() {
    HelperClass.controllers.forEach(disposeController);
    super.dispose();
  }

  initListener(TextEditingController controller) {
    controller.addListener(() {
      setState(() {});
    });
  }

  disposeController(TextEditingController controller) {
    controller.dispose();
  }

  Widget buildDropdownChild() {
    return Padding(
      padding: const EdgeInsets.only(left: 136),
      child: Container(
        width: 115,
        height: 148,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: RibnColors.lightGrey, width: 1),
          color: const Color(0xffffffff),
          boxShadow: const [
            BoxShadow(
              color: RibnColors.blackShadow,
              spreadRadius: 0,
              blurRadius: 22.4,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: ListView(
          children: UIConstants.assetUnitsList
              .map(
                (item) => MaterialButton(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(item,
                        style: RibnToolkitTextStyles.dropdownButtonStyle
                            .copyWith(color: RibnColors.defaultText)),
                  ),
                  onPressed: () {
                    setState(() {
                      HelperClass.selectedItem = item;
                      HelperClass.showDropdown = false;
                    });
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      categories: [
        WidgetbookCategory(
          name: 'Atoms',
          widgets: [
            WidgetbookComponent(
              name: 'Separators',
              useCases: [
                WidgetbookUseCase(
                  name: 'Dash line',
                  builder: (context) =>
                      const RibnDashedLine(color: RibnColors.lightGreyDivider),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Text Widgets',
              useCases: [
                WidgetbookUseCase(
                  name: 'H1',
                  builder: (context) => const RibnH1TextWidget(
                    text: "I am an H1 Text Widget",
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    textColor: RibnColors.defaultText,
                    height: 1.57,
                    letterSpacing: 1.68,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'H2',
                  builder: (context) => const RibnH2TextWidget(
                    text: "I am an H2 Text Widget",
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    textColor: RibnColors.defaultText,
                    letterSpacing: 1.34,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'H3',
                  builder: (context) => const RibnH3TextWidget(
                    text: "I am an H3 Text Widget",
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    textColor: RibnColors.defaultText,
                    letterSpacing: 0,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'H4',
                  builder: (context) => const RibnH4TextWidget(
                    text: "I am an H4 Text Widget",
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    textColor: RibnColors.defaultText,
                    letterSpacing: 0,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'H5',
                  builder: (context) => const RibnH5TextWidget(
                    text: "I am an H5 Text Widget",
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    textColor: RibnColors.defaultText,
                    letterSpacing: 0,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'BodyFont12',
                  builder: (context) => const RibnH5TextWidget(
                    text: "I am a Body Font with text size 12 Font Text Widget",
                    textAlign: TextAlign.start,
                    textColor: RibnColors.defaultText,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 1,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Font10B',
                  builder: (context) => const RibnFont10TextWidget(
                    text:
                        "I am a Font with text size 10 with a bold fontweight Font Text Widget",
                    textAlign: TextAlign.start,
                    textColor: RibnColors.defaultText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Font10',
                  builder: (context) => const RibnFont10TextWidget(
                    text:
                        "I am a Font with text size 10 with a normal fontweight Font Text Widget",
                    textAlign: TextAlign.start,
                    textColor: RibnColors.defaultText,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Font12B',
                  builder: (context) => const RibnFont12TextWidget(
                    text:
                        "I am a Font with text size 12 with bold fontweight and word spacing of 0 Font Text Widget",
                    textAlign: TextAlign.start,
                    textColor: RibnColors.defaultText,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 0,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Font12',
                  builder: (context) => const RibnFont12TextWidget(
                    text:
                        "I am a Font with text size 12 with a normal fontweight and word spacing of 1 Font Text Widget",
                    textAlign: TextAlign.start,
                    textColor: RibnColors.defaultText,
                    fontWeight: FontWeight.normal,
                    wordSpacing: 1,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Font13B',
                  builder: (context) => const RibnFont13TextWidget(
                    text:
                        "I am a Font with text size 13 with a bold fontweight Font Text Widget",
                    textAlign: TextAlign.start,
                    textColor: RibnColors.defaultText,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Font13',
                  builder: (context) => const RibnFont13TextWidget(
                    text:
                        "I am a Font with text size 13 with a normal fontweight Font Text Widget",
                    textAlign: TextAlign.start,
                    textColor: RibnColors.defaultText,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Font14B',
                  builder: (context) => const RibnFont14TextWidget(
                    text:
                        "I am a Font with text size 14 with a bold fontweight Font Text Widget",
                    textAlign: TextAlign.start,
                    textColor: RibnColors.defaultText,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 0,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Font14',
                  builder: (context) => const RibnFont14TextWidget(
                    text:
                        "I am a Font with text size 14 with a normal fontweight Font Text Widget",
                    textAlign: TextAlign.start,
                    textColor: RibnColors.defaultText,
                    fontWeight: FontWeight.normal,
                    wordSpacing: 0.5,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Font16B',
                  builder: (context) => const RibnFont16TextWidget(
                    text:
                        "I am a Font with text size 16 with a bold fontweight Font Text Widget",
                    textAlign: TextAlign.start,
                    textColor: RibnColors.defaultText,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 0,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Font16',
                  builder: (context) => const RibnFont16TextWidget(
                    text:
                        "I am a Font with text size 16 with a normal fontweight Font Text Widget",
                    textAlign: TextAlign.start,
                    textColor: RibnColors.defaultText,
                    fontWeight: FontWeight.normal,
                    wordSpacing: 0.5,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Font18B',
                  builder: (context) => const RibnFont18TextWidget(
                    text:
                        "I am a Font with text size 18 with a bold fontweight Font Text Widget",
                    textAlign: TextAlign.start,
                    textColor: RibnColors.defaultText,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 0,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Font18',
                  builder: (context) => const RibnFont18TextWidget(
                    text:
                        "I am a Font with text size 18 with a normal fontweight Font Text Widget",
                    textAlign: TextAlign.start,
                    textColor: RibnColors.defaultText,
                    fontWeight: FontWeight.normal,
                    wordSpacing: 0.5,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Font19B',
                  builder: (context) => const RibnFont19TextWidget(
                    text:
                        "I am a Font with text size 19 with a bold fontweight Font Text Widget",
                    textAlign: TextAlign.start,
                    textColor: RibnColors.defaultText,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 0,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Font19',
                  builder: (context) => const RibnFont19TextWidget(
                    text:
                        "I am a Font with text size 19 with a normal fontweight Font Text Widget",
                    textAlign: TextAlign.start,
                    textColor: RibnColors.defaultText,
                    fontWeight: FontWeight.normal,
                    wordSpacing: 0.5,
                  ),
                ),
              ],
            ),
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
              name: 'Animated Expand Button',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: AnimatedExpandButton(
                          backgroundColor: Colors.transparent,
                          onPressed: () {},
                          title: 'Test',
                          height: 45,
                          width: 80,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Peekaboo Button',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: PeekabooButton(
                          buttonText: Text(
                            'Button Text',
                            style: RibnToolkitTextStyles.smallBody
                                .copyWith(fontSize: 15),
                          ),
                          buttonChild: SizedBox(
                            width: 137,
                            height: 22,
                            child: LargeButton(
                              buttonChild: Text(
                                'Do This Action',
                                style: RibnToolkitTextStyles.dropdownButtonStyle
                                    .copyWith(
                                        fontSize: 11,
                                        color: RibnColors.ghostButtonText),
                              ),
                              backgroundColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              dropShadowColor: Colors.transparent,
                              borderColor: RibnColors.ghostButtonText,
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Onboarding Action Button',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => Center(
                    child: OnboardingActionButton(
                      backgroundColor: RibnColors.primary,
                      icon: Image.asset(RibnAssets.importWalletPng),
                      description: 'This is an example description text...',
                      title: 'Button Title',
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
                      icon: Image.asset(RibnAssets.plusBlue, width: 30),
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
                        style: RibnToolkitTextStyles.dropdownButtonStyle
                            .copyWith(color: RibnColors.primary),
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
                      icon: Image.asset(
                        RibnAssets.copyIcon,
                        width: 26,
                      ),
                    ),
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
                      controller: HelperClass.textController,
                      hintText: 'Type Something',
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Rounded Copy Text Field',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => Center(
                    child: RoundedCopyTextField(
                      text: 'This is some text',
                      icon: SvgPicture.asset(
                        RibnAssets.myFingerprint,
                      ),
                      copyText: 'This is some text',
                      copyIcon: Image.asset(
                        RibnAssets.copyIcon,
                        width: 26,
                      ),
                      width: 200,
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
                      borderColor: HelperClass.checked
                          ? RibnColors.active
                          : RibnColors.inactive,
                      value: HelperClass.checked,
                      onChanged: (val) {
                        setState(() {
                          HelperClass.checked = val;
                        });
                      },
                      label: RichText(
                        text: TextSpan(
                          style: RibnToolkitTextStyles.body1.copyWith(
                              color: HelperClass.checked
                                  ? RibnColors.defaultText
                                  : RibnColors.inactive),
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
            WidgetbookComponent(
              name: 'Error Bubble',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => const Center(
                    child: ErrorBubble(
                      inverted: true,
                      errorText: 'This is an error message',
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Toggle Switch',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => Center(
                    child: CustomToggle(
                      onChanged: (bool val) {
                        setState(() {
                          HelperClass.customToggleValue = val;
                        });
                      },
                      value: HelperClass.customToggleValue,
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Status Chip',
              useCases: [
                WidgetbookUseCase(
                  name: 'Unconfirmed',
                  builder: (context) => const Center(
                    child: StatusChip(
                      status: 'unconfirmed',
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Confirmed',
                  builder: (context) => const Center(
                    child: StatusChip(
                      status: 'confirmed',
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
            WidgetbookComponent(name: "Authorise", useCases: [
              WidgetbookUseCase(
                name: 'Authorize',
                builder: (context) => Center(
                  child: RibnCheckboxWrappableText(
                    fillColor: Colors.transparent,
                    checkColor: RibnColors.active,
                    borderColor: HelperClass.checked
                        ? RibnColors.active
                        : RibnColors.inactive,
                    value: HelperClass.checked,
                    onChanged: (val) {
                      setState(() {
                        HelperClass.checked = val!;
                      });
                    },
                    origin: 'https://google.com',
                  ),
                ),
              )
            ]),
            WidgetbookComponent(
              name: 'Asset Card',
              useCases: [
                WidgetbookUseCase(
                  name: 'All Details No Action Bttns',
                  builder: (context) => Center(
                    child: AssetCard(
                      onCardPress: () {},
                      iconImage: Image.asset(
                        RibnAssets.coffGreenIcon,
                        width: 31,
                      ),
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
                        style:
                            RibnToolkitTextStyles.assetShortNameStyle.copyWith(
                          color: RibnColors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'All Details + Action Bttns',
                  builder: (context) => Center(
                    child: AssetCard(
                      onCardPress: () {},
                      iconImage: Image.asset(
                        RibnAssets.coffGreenIcon,
                        width: 31,
                      ),
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
                        style:
                            RibnToolkitTextStyles.assetShortNameStyle.copyWith(
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
                        style:
                            RibnToolkitTextStyles.assetShortNameStyle.copyWith(
                          color: RibnColors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Custom Dropdown',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => Center(
                    child: CustomDropDown(
                      visible: HelperClass.showDropdown,
                      onDismissed: () {
                        setState(() {
                          HelperClass.showDropdown = false;
                        });
                      },
                      childAlignment: Alignment.bottomLeft,
                      dropDownAlignment: Alignment.topCenter,
                      chevronIcon: Image.asset(
                        RibnAssets.chevronDownDark,
                        width: 24,
                      ),
                      dropdownChild: buildDropdownChild(),
                      selectedItem: HelperClass.selectedItem != null
                          ? Text(
                              formatAssetUnit(HelperClass.selectedItem),
                              style: RibnToolkitTextStyles.dropdownButtonStyle,
                            )
                          : null,
                      hintText: 'Unit',
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'App Bar',
                  builder: (context) => Center(
                    child: InputDropdown(
                        selectedItem: HelperClass.selectedNetwork,
                        items: HelperClass.networks,
                        onChange: (string) {
                          setState(() {
                            HelperClass.selectedNetwork = string;
                          });
                        },
                        chevronIconLink: RibnAssets.chevronDown),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Password Text Field',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: PasswordTextField(
                          hintText: 'Type Something',
                          controller: HelperClass.passwordController,
                          obscurePassword: HelperClass.obscurePassword,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Asset Long Name Field',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: AssetLongNameField(
                          selectedIcon: HelperClass.selectedIcon,
                          controller: HelperClass.assetLongNameController,
                          onIconSelected: (icon) {
                            setState(() {
                              HelperClass.selectedIcon = icon;
                            });
                          },
                          tooltipIcon: Image.asset(
                            RibnAssets.greyHelpBubble,
                            width: 18,
                          ),
                          chevronIcon: Image.asset(
                            RibnAssets.chevronDownDark,
                            width: 24,
                          ),
                          assetsIconList: UIConstants.assetIconsList,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Asset Short Name Field',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: AssetShortNameField(
                          controller: HelperClass.assetShortNameController,
                          tooltipIcon: Image.asset(
                            RibnAssets.greyHelpBubble,
                            width: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Recipient Field',
              useCases: [
                WidgetbookUseCase(
                  name: 'Minting to Recipient',
                  builder: (context) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: RecipientField(
                          controller: HelperClass.recipientController,
                          validRecipientAddress: '',
                          onBackspacePressed: () {
                            setState(() {
                              HelperClass.recipientController.clear();
                              HelperClass.validRecipientAddress = '';
                            });
                          },
                          icon:
                              SvgPicture.asset(RibnAssets.recipientFingerprint),
                          alternativeDisplayChild: RoundedCopyTextField(
                            text: 'This is some text',
                            icon: SvgPicture.asset(
                              RibnAssets.myFingerprint,
                            ),
                            copyText: 'This is some text',
                            copyIcon: Image.asset(
                              RibnAssets.copyIcon,
                              width: 26,
                            ),
                            width: 200,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Minting to My Wallet',
                  builder: (context) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: RecipientField(
                          mintingToMyWallet: true,
                          controller: HelperClass.recipientController,
                          validRecipientAddress: '',
                          onBackspacePressed: () {
                            setState(() {
                              HelperClass.recipientController.clear();
                              HelperClass.validRecipientAddress = '';
                            });
                          },
                          icon:
                              SvgPicture.asset(RibnAssets.recipientFingerprint),
                          alternativeDisplayChild: RoundedCopyTextField(
                            text: 'This is some text',
                            icon: SvgPicture.asset(
                              RibnAssets.myFingerprint,
                            ),
                            copyText: 'This is some text',
                            copyIcon: Image.asset(
                              RibnAssets.copyIcon,
                              width: 26,
                            ),
                            width: 200,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Asset Amount Field',
              useCases: [
                WidgetbookUseCase(
                  name: 'Minting',
                  builder: (context) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: AssetAmountField(
                          selectedUnit: HelperClass.selectedUnit,
                          controller: HelperClass.amountController,
                          allowEditingUnit: true,
                          onUnitSelected: (String unit) {
                            setState(() {
                              HelperClass.selectedUnit = unit;
                            });
                          },
                          chevronIcon: Image.asset(
                            RibnAssets.chevronDownDark,
                            width: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Reminting',
                  builder: (context) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: AssetAmountField(
                          selectedUnit: HelperClass.selectedUnit ==
                                  HelperClass.selectedUnit
                              ? 'No Unit'
                              : HelperClass.selectedUnit,
                          controller: HelperClass.amountController,
                          allowEditingUnit: false,
                          onUnitSelected: (String unit) {
                            setState(() {
                              HelperClass.selectedUnit = unit;
                            });
                          },
                          chevronIcon: Image.asset(
                            RibnAssets.chevronDownDark,
                            width: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Asset Note Field',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: NoteField(
                          controller: HelperClass.noteController,
                          noteLength: HelperClass.noteController.text.length,
                          tooltipIcon: Image.asset(
                            RibnAssets.greyHelpBubble,
                            width: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Asset Selection Field',
              useCases: [
                WidgetbookUseCase(
                  name: 'No Asset Selected',
                  builder: (context) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: AssetSelectionField(
                          formattedSelectedAsset: const {
                            'longName': 'Green Coffee',
                            'shortName': 'GrnCffe',
                            'assetIcon': RibnAssets.coffGreenIcon,
                          },
                          formattedAsset: (asset) {
                            return {
                              'longName': 'Green Coffee',
                              'shortName': 'GrnCffe',
                              'assetIcon': RibnAssets.coffGreenIcon,
                            };
                          },
                          assets: const [],
                          onSelected: () {},
                          tooltipIcon: Image.asset(
                            RibnAssets.greyHelpBubble,
                            width: 18,
                          ),
                          chevronIcon: Image.asset(
                            RibnAssets.chevronDownDark,
                            width: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Asset Selected',
                  builder: (context) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: AssetSelectionField(
                          formattedSelectedAsset: const {
                            'assetCode':
                                '5YJkvbDcWX5GgPj5xqzxhwqY6EvKrqWj2hhBRXxSGMns2qPxCMz5kSR3vw',
                            'longName': 'Green Coffee',
                            'shortName': 'GrnCffe',
                            'assetIcon': RibnAssets.coffGreenIcon,
                          },
                          formattedAsset: (asset) {
                            return {
                              'longName': 'Green Coffee',
                              'shortName': 'GrnCffe',
                              'assetIcon': RibnAssets.coffGreenIcon,
                            };
                          },
                          assets: const [],
                          onSelected: () {},
                          tooltipIcon: Image.asset(
                            RibnAssets.greyHelpBubble,
                            width: 18,
                          ),
                          chevronIcon: Image.asset(
                            RibnAssets.chevronDownDark,
                            width: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Custom Tooltip',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => Center(
                    child: CustomToolTip(
                      borderColor: Border.all(color: const Color(0xffE9E9E9)),
                      toolTipIcon: Image.asset(
                        RibnAssets.greyHelpBubble,
                        width: 18,
                      ),
                      toolTipChild: const Text(
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
                      borderColor: Border.all(color: const Color(0xffE9E9E9)),
                      toolTipIcon: Image.asset(
                        RibnAssets.greyHelpBubble,
                        width: 18,
                      ),
                      toolTipChild: Column(
                        children: [
                          Text(
                            Strings.howIsMySeedPhraseUnrecoverable,
                            style:
                                RibnToolkitTextStyles.toolTipTextStyle.copyWith(
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
                      borderColor: Border.all(color: const Color(0xffE9E9E9)),
                      toolTipIcon: Image.asset(
                        RibnAssets.greyHelpBubble,
                        width: 18,
                      ),
                      toolTipChild: RichText(
                        text: TextSpan(
                          style: RibnToolkitTextStyles.toolTipTextStyle,
                          children: [
                            const TextSpan(
                              text: Strings.refillCurrentPolyBalance,
                            ),
                            WidgetSpan(
                              child: GestureDetector(
                                onTap: () async => await launchUrl(
                                    Uri.parse(HelperClass.tooltipUrl)),
                                child: Row(
                                  children: [
                                    Text(
                                      ' Baas. ',
                                      style: RibnToolkitTextStyles
                                          .toolTipTextStyle
                                          .copyWith(
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
            WidgetbookComponent(
              name: 'Wave Container',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => Center(
                    child: WaveContainer(
                      containerHeight: double.infinity,
                      containerWidth: double.infinity,
                      waveAmplitude: 0,
                      containerChild: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'You can place elements on top of this background as so...',
                              style: RibnToolkitTextStyles.h4
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Shimmer Loader',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => const Center(
                    child: ShimmerLoader(
                        width: 150, height: 15, borderRadius: 100),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Loading Spinner',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => const Center(
                    child: LoadingSpinner(),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Modal',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => Center(
                    child: LargeButton(
                      buttonChild: Text(
                        'Show Modal',
                        style: RibnToolkitTextStyles.btnLarge.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: RibnColors.primary,
                      hoverColor: RibnColors.primaryButtonHover,
                      dropShadowColor: RibnColors.primaryButtonShadow,
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (context) => CustomModal.renderCustomModal(
                            context: context,
                            title: const Text(
                              'Modal Title',
                              style: RibnToolkitTextStyles.extH2,
                            ),
                            body: Column(
                              children: const [
                                Text(
                                  'This is a cool modal with a sexy action button.',
                                  style: RibnToolkitTextStyles.body1,
                                  textHeightBehavior: TextHeightBehavior(
                                      applyHeightToFirstAscent: false),
                                ),
                              ],
                            ),
                            actionsAlignment: MainAxisAlignment.center,
                            elevation: 2,
                            actions: [
                              LargeButton(
                                buttonWidth: 240,
                                buttonChild: Text(
                                  'Action Button',
                                  style:
                                      RibnToolkitTextStyles.btnLarge.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor: RibnColors.primary,
                                hoverColor: RibnColors.primaryButtonHover,
                                dropShadowColor: RibnColors.primaryButtonShadow,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Custom with sizing',
                  builder: (context) => Align(
                    alignment: FractionalOffset.center,
                    child: LargeButton(
                      buttonChild: Text(
                        'Show Modal',
                        style: RibnToolkitTextStyles.btnLarge.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: RibnColors.primary,
                      hoverColor: RibnColors.primaryButtonHover,
                      dropShadowColor: RibnColors.primaryButtonShadow,
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (context) =>
                              RibnCustomModal.renderRibnCustomModal(
                            context: context,
                            title: const Text(
                              'Modal Title',
                              style: RibnToolkitTextStyles.extH2,
                            ),
                            body: Column(
                              children: const [
                                Text(
                                  'This is a cool modal with a sexy action button.',
                                  style: RibnToolkitTextStyles.body1,
                                  textHeightBehavior: TextHeightBehavior(
                                      applyHeightToFirstAscent: false),
                                ),
                              ],
                            ),
                            actionsAlignment: MainAxisAlignment.center,
                            elevation: 2,
                            actions: [
                              LargeButton(
                                buttonWidth: 240,
                                buttonChild: Text(
                                  'Action Button',
                                  style:
                                      RibnToolkitTextStyles.btnLarge.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor: RibnColors.primary,
                                hoverColor: RibnColors.primaryButtonHover,
                                dropShadowColor: RibnColors.primaryButtonShadow,
                                onPressed: () {},
                              ),
                            ],
                            width: 220,
                            height: 220,
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
            WidgetbookComponent(
              name: 'Accordion',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => const Center(
                    child: Accordion(
                      header: Text('This is an example accordion header'),
                      description: Text(
                          'And this is some description text for the accordion.'),
                      width: 400,
                      backgroundColor: Colors.white,
                      collapsedBackgroundColor: Colors.white,
                      iconColor: RibnColors.defaultText,
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Animated Circle Step Loader',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => Center(
                    child: AnimatedCircleStepLoader(
                      stepLabels: HelperClass.stepLabels,
                      showStepLoader: () {},
                      activeCircleColor: RibnColors.primary,
                      inactiveCircleColor: RibnColors.inactive,
                      activeCircleRadius: 8,
                      inactiveCircleRadius: 4.5,
                      dotPadding: 8,
                      renderCenterIcon: true,
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Sliding Segment Control',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => Center(
                    child: SlidingSegmentControl(
                      currentTabIndex: HelperClass.currentTabIndex,
                      updateTabIndex: (i) => {
                        setState(() {
                          HelperClass.currentTabIndex = i as int;
                        })
                      },
                      tabItems: <int, Widget>{
                        0: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Text("Tab Value 1",
                              style: RibnToolkitTextStyles.btnMedium
                                  .copyWith(color: RibnColors.defaultText)),
                        ),
                        1: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Text("Tab Value 2",
                              style: RibnToolkitTextStyles.btnMedium
                                  .copyWith(color: RibnColors.defaultText)),
                        ),
                      },
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Activity Tiles',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard Old',
                  builder: (context) => RibnActivityTile(
                    tileColor: RibnColors.whiteColor,
                    assetIcon: RibnAssets.polyIconCircle,
                    assetBalance: '-500',
                    assetShortName: 'POLY',
                    transactionStatus: 'confirmed',
                    transactionDate: 'Sent on Oct 14',
                    onTap: () {},
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Standard NFTs Recieve',
                  builder: (context) => RibnActivityTile(
                    tileColor: RibnColors.whiteColor,
                    assetIcon: RibnAssets.undefinedIcon,
                    assetBalance: '+1',
                    assetShortName: 'APE',
                    transactionStatus: 'confirmed',
                    transactionDate: 'Sent on Oct 14',
                    onTap: () {},
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Standard NFTs Send',
                  builder: (context) => RibnActivityTile(
                    tileColor: RibnColors.whiteColor,
                    assetIcon: RibnAssets.undefinedIcon,
                    assetBalance: '-1',
                    assetShortName: 'APE',
                    transactionStatus: 'confirmed',
                    transactionDate: 'Sent on Oct 14',
                    onTap: () {},
                  ),
                ),
                WidgetbookUseCase(
                    name: 'Activity Details Old',
                    builder: (context) => RibnActivityDetails(
                          activityDetails:
                              RibnSampleDataModels.activityDetailsModel,
                          dataTileTextStyle: const TextStyle(
                            fontFamily: 'DM Sans',
                            fontSize: 12,
                            color: RibnColors.defaultText,
                            fontWeight: FontWeight.w300,
                          ),
                        ))
              ],
            ),
            WidgetbookComponent(
              name: 'Activity Details',
              useCases: [
                WidgetbookUseCase(
                    name: 'Activity Details Old',
                    builder: (context) => RibnActivityDetails(
                          activityDetails:
                              RibnSampleDataModels.activityDetailsModel,
                          dataTileTextStyle: const TextStyle(
                            fontFamily: 'DM Sans',
                            fontSize: 12,
                            color: RibnColors.hintTextColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ))
              ],
            ),
            WidgetbookComponent(
              name: 'Raw Bidrectional Scrolling Container',
              useCases: [
                WidgetbookUseCase(
                    name: 'Raw Tx Container with Copy Paste',
                    builder: (context) => Align(
                          child: RibnTxContainer(
                            data: JsonEncoder.withIndent(' ' * 4)
                                .convert(RibnSampleDataModels.rawTx),
                          ),
                          alignment: FractionalOffset.center,
                        )),
                WidgetbookUseCase(
                    name: 'Raw DAppList Container',
                    builder: (context) => Align(
                          child: RibnDisconnectDAppContainer(
                            dapps: RibnSampleDataModels.dappList,
                            width: 227,
                          ),
                          alignment: FractionalOffset.center,
                        ))
              ],
            )
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
                      currentNetworkName: HelperClass.selectedNetwork,
                      networks: HelperClass.networks,
                      updateNetwork: (string) {
                        HelperClass.selectedNetwork = string;
                      },
                      settingsOptions: HelperClass.settingsOptions,
                      selectSettingsOption: HelperClass.selectSettings,
                      chevronIconLink: HelperClass.chevronIconLink,
                      ribnLogoIconLink: RibnAssets.newRibnLogo,
                      hamburgerIconLink: RibnAssets.hamburgerMenu,
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Custom Page Text Title',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) =>
                      const CustomPageTextTitle(title: 'Page Title'),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Custom Page Dropdown Title',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => CustomPageDropdownTitle(
                    title: 'Page Title',
                    chevronIconLink: '',
                    currentSelectedItem: HelperClass.currentSelectedItem,
                    itemsToSelectFrom: HelperClass.itemsToSelectFrom,
                    updateSelectedItem: (string) {
                      setState(() {
                        HelperClass.currentSelectedItem = string;
                      });
                    },
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Custom Page Text Title With Leading Child',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => CustomPageTextTitleWithLeadingChild(
                    title: 'Page Title',
                    child: InputDropdown(
                      selectedItem: HelperClass.selectedNetwork,
                      items: HelperClass.networks,
                      onChange: (string) {},
                      chevronIconLink: RibnAssets.chevronDown,
                      enabled: false,
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
                    child: OnboardingProgressBar(
                      currStep: 0,
                      numSteps: 4,
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Middle Step',
                  builder: (context) => const Center(
                    child: OnboardingProgressBar(
                      currStep: 2,
                      numSteps: 4,
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Final Step',
                  builder: (context) => const Center(
                    child: OnboardingProgressBar(
                      currStep: 4,
                      numSteps: 4,
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Ribn Bottom App Bar',
              useCases: [
                WidgetbookUseCase(
                  name: 'Standard',
                  builder: (context) => Scaffold(
                    bottomNavigationBar: RibnBottomAppBar(
                      pages: HelperClass.pages,
                      currPage: HelperClass.currPage,
                      activePageIcons: HelperClass.activePageIcons,
                      pageIcons: HelperClass.pageIcons,
                      setCurrentPage: (key) {
                        setState(() {
                          HelperClass.currPage = key;
                        });
                      },
                    ),
                    backgroundColor: RibnColors.background,
                  ),
                ),
                WidgetbookUseCase(
                  name: 'StandardV2',
                  builder: (context) => Scaffold(
                    bottomNavigationBar: RibnBottomAppBarV2(
                      pages: HelperClass.pagesV2,
                      currPage: HelperClass.currPage,
                      activePageIcons: HelperClass.activePageIconsV2,
                      pageIcons: HelperClass.pageIconsV2,
                      setCurrentPage: (key) {
                        setState(() {
                          HelperClass.currPage = key;
                        });
                      },
                    ),
                    backgroundColor: RibnColors.background,
                  ),
                ),
              ],
            ),
          ],
        ),
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
          name: 'iPhone 12 Pro',
          resolution: Resolution.dimensions(
            nativeWidth: 390,
            nativeHeight: 1200,
            scaleFactor: 1,
          ),
          type: DeviceType.mobile,
        ),
        Device(
          name: 'Chrome Widget',
          resolution: Resolution.dimensions(
            nativeWidth: 320,
            nativeHeight: 1200,
            scaleFactor: 1,
          ),
          type: DeviceType.mobile,
        ),
        Device(
          name: 'Square Canvas',
          resolution: Resolution.dimensions(
            nativeWidth: 500,
            nativeHeight: 500,
            scaleFactor: 1,
          ),
          type: DeviceType.desktop,
        ),
        Device(
          name: 'Large Desktop',
          resolution: Resolution.dimensions(
            nativeWidth: 1440,
            nativeHeight: 1242,
            scaleFactor: 1,
          ),
          type: DeviceType.desktop,
        ),
        Device(
          name: 'Wide Screen',
          resolution: Resolution.dimensions(
            nativeWidth: 1248,
            nativeHeight: 2778,
            scaleFactor: 2,
          ),
          type: DeviceType.mobile,
        )
      ],
      appInfo: AppInfo(name: 'Ribn Toolkit'),
    );
  }
}
