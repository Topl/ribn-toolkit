import 'package:flutter/material.dart';
import 'package:topl_toolkit/widgets/atoms/primary_button.dart';
import 'package:widgetbook/widgetbook.dart';

class HotReload extends StatelessWidget {
  const HotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      categories: [
        WidgetbookCategory(
          name: 'atoms',
          widgets: [
            WidgetbookComponent(
              name: 'Button',
              useCases: [
                WidgetbookUseCase(
                  name: 'elevated',
                  builder: (context) => PrimaryButton(),
                ),
              ],
            ),
          ],
        )
      ],
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: ThemeData.light(),
        ),
        WidgetbookTheme(
          name: 'Dark',
          data: ThemeData.dark(),
        ),
      ],
      devices: [
        Device(
          name: 'Chrome Extension',
          resolution: Resolution.dimensions(
            nativeWidth: 342,
            nativeHeight: 573,
            scaleFactor: 2,
          ),
          type: DeviceType.desktop,
        ),
      ],
      appInfo: AppInfo(name: 'Example 3'),
    );
  }
}
