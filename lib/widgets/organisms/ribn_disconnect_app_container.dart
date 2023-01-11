// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import '../../constants/colors.dart';
import '../atoms/text/ribn_font12_text_widget.dart';

class RibnDisconnectDAppContainer extends StatefulWidget {
  final List<String> dapps;
  final double width;
  const RibnDisconnectDAppContainer(
      {Key? key, required this.dapps, required this.width})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RibnDisconnectDAppContainerState();
  }
}

class _RibnDisconnectDAppContainerState
    extends State<RibnDisconnectDAppContainer> {
  final ScrollController controllerVertical =
      ScrollController(initialScrollOffset: 0);
  final ScrollController controllerHorizontal =
      ScrollController(initialScrollOffset: 0);

  @override
  void initState() {
    // TODO: implement initState
    controllerVertical.addListener(() {
      debugPrint(
          "current pos: ${controllerVertical.position.pixels.toString()}");
      if (controllerVertical.position.pixels - 100 ==
          controllerVertical.position.maxScrollExtent - 100) {
        setState(() {
          debugPrint("Need to hide now");
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 8, bottom: 12, right: 14),
      width: widget.width,
      height: 105,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(11.6)),
        color: RibnColors.mediumGrey,
      ),
      child: RawScrollbar(
        controller: controllerVertical,
        shape: const StadiumBorder(),
        mainAxisMargin: 10,
        crossAxisMargin: 8,
        thumbVisibility: true,
        thumbColor: RibnColors.primary,
        thickness: 10,
        child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
                controller: controllerVertical,
                scrollDirection: Axis.vertical,
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: widget.dapps.length,
                  itemBuilder: (buildContext, index) {
                    return RibnFont12TextWidget(
                        text: widget.dapps[index],
                        height: 2.5,
                        textAlign: TextAlign.justify,
                        textColor: RibnColors.defaultText,
                        fontWeight: FontWeight.w400);
                  },
                ))),
      ),
    );
  }
}
