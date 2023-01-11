// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import '../../constants/assets.dart';
import '../../constants/colors.dart';
import '../atoms/ribn_custom_copy_button.dart';

class RibnTxContainer extends StatefulWidget {
  final String data;
  const RibnTxContainer({Key? key, required this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RibnTxContainerState();
  }
}

class _RibnTxContainerState extends State<RibnTxContainer> {
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
      height: 150,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(11.6)),
        color: RibnColors.mediumGrey,
      ),
      child: Stack(
        children: <Widget>[
          RawScrollbar(
              controller: controllerVertical,
              shape: const StadiumBorder(),
              mainAxisMargin: 10,
              crossAxisMargin: 8,
              thumbVisibility: true,
              thumbColor: RibnColors.primary,
              thickness: 10,
              child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                      controller: controllerVertical,
                      scrollDirection: Axis.vertical,
                      child: RawScrollbar(
                        controller: controllerHorizontal,
                        shape: const StadiumBorder(),
                        mainAxisMargin: 10,
                        crossAxisMargin: 8,
                        thumbVisibility: true,
                        thumbColor: RibnColors.primary,
                        thickness: 10,
                        child: ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context)
                                .copyWith(scrollbars: false),
                            child: SingleChildScrollView(
                                controller: controllerHorizontal,
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 30),
                                  child: SelectableText(
                                    // mockDAppTransactionJson,
                                    widget.data,
                                  ),
                                ))),
                      )))),
          Positioned(
            right: 10,
            bottom: 10,
            child: Container(
              alignment: Alignment.center,
              width: 27.0,
              height: 27.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: RibnCustomCopyButton(
                textToBeCopied: widget.data,
                bubbleText: 'Copied!',
                icon: SvgPicture.asset(
                  RibnAssets.contentCopyIcon,
                  width: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
