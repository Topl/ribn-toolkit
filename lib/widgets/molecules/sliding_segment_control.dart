import 'package:flutter/cupertino.dart';

class SlidingSegmentControl extends StatelessWidget {
  SlidingSegmentControl(
      {Key? key,
      required this.tabItems,
      required this.currentTabIndex,
      required this.updateTabIndex,
      this.redirectOnClick})
      : super(key: key);

  final Map<int, Widget> tabItems;
  int currentTabIndex;
  Function updateTabIndex;
  Function? redirectOnClick;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: CupertinoSlidingSegmentedControl(
        groupValue: currentTabIndex,
        children: tabItems,
        onValueChanged: (i) {
          updateTabIndex(i);

          if (redirectOnClick != null) {
            redirectOnClick!();
          }
        },
      ),
    );
  }
}
