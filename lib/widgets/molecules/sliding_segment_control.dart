import 'package:flutter/cupertino.dart';

class SlidingSegmentControl extends StatefulWidget {
  SlidingSegmentControl({Key? key, required this.tabItems, required this.currentTabIndex}) : super(key: key);

  final Map<int, Widget> tabItems;
  int currentTabIndex;

  @override
  State<SlidingSegmentControl> createState() => _SlidingSegmentControlState();
}

class _SlidingSegmentControlState extends State<SlidingSegmentControl> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: CupertinoSlidingSegmentedControl(
        groupValue: widget.currentTabIndex,
        children: widget.tabItems,
        onValueChanged: (i) {
          setState(() {
            widget.currentTabIndex = i as int;
          });
        },
      ),
    );
  }
}
