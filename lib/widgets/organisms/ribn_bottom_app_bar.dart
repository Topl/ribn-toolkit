// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:ribn_toolkit/widgets/atoms/custom_icon_button.dart';

class RibnBottomAppBar extends StatelessWidget {
  static double iconHeight = 32;
  static double iconWidth = 32;
  static double largeIconHeight = 53;
  static double largeIconWidth = 53;
  static double radius = 8;
  final List<dynamic> pages;
  final int currPage;
  final List<Image> activePageIcons;
  final List<Image> pageIcons;
  final Function setCurrentPage;

  const RibnBottomAppBar(
      {Key? key,
      required this.pages,
      required this.currPage,
      required this.activePageIcons,
      required this.pageIcons,
      required this.setCurrentPage})
      : super(key: key);

  /// Builds the [BottomAppBar], allowing navigation to the three main pages.
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kIsWeb ? 60 : 110,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x40E2ECF9),
            spreadRadius: 0,
            blurRadius: 37.5,
            offset: Offset(0, -6),
          ),
        ],
      ),
      child: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: pages.asMap().keys.map(
            (key) {
              final bool isActive = key == currPage;
              final bool isMintAssetIcon = key == 1 ? true : false;
              return Container(
                decoration: isMintAssetIcon
                    ? const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0X5950D5B7),
                            spreadRadius: 0,
                            blurRadius: 22,
                            offset: Offset(0, 6),
                          ),
                        ],
                      )
                    : null,
                child: CustomIconButton(
                  radius: radius,
                  height: isMintAssetIcon ? largeIconHeight : iconHeight,
                  width: isMintAssetIcon ? largeIconWidth : iconWidth,
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      isActive ? activePageIcons[key] : pageIcons[key],
                    ],
                  ),
                  onPressed: () => setCurrentPage(key),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
