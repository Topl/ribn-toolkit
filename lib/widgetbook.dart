import 'package:flutter/material.dart';
import 'package:topl_toolkit/constants/colors.dart';
import 'package:topl_toolkit/widgets/atoms/large_button.dart';
import 'package:topl_toolkit/widgets/molecules/input_dropdown.dart';
import 'package:topl_toolkit/widgets/organisms/ribn_app_bar.dart';
import 'package:widgetbook/widgetbook.dart';

class WidgetBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      categories: [
        WidgetbookCategory(
          name: 'Atoms',
          widgets: [
            WidgetbookComponent(
              name: 'Button',
              useCases: [
                WidgetbookUseCase(
                  name: 'Primary',
                  builder: (context) => Center(
                    child: LargeButton(
                      label: 'BUTTON TEXT',
                      onPressed: () {},
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Secondary',
                  builder: (context) => Center(
                    child: LargeButton(
                      label: 'BUTTON TEXT',
                      onPressed: () {},
                      backgroundColor: RibnColors.secondary,
                      textColor: RibnColors.primary,
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
                  builder: (context) => Container(
                    width: 1000,
                    height: 40,
                    child: RibnAppBar(),
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
              // scaffoldBackgroundColor: const Color(0xff26A69A),
              ),
        ),
      ],
      devices: [
        Device(
          name: 'Square Canvas',
          resolution: Resolution.dimensions(
            nativeWidth: 1000,
            nativeHeight: 1000,
            scaleFactor: 2,
          ),
          type: DeviceType.desktop,
        ),
      ],
      appInfo: AppInfo(name: 'Topl Toolkit'),
    );
  }
}
