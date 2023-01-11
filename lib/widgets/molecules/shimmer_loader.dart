// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader(
      {required this.borderRadius,
      required this.height,
      required this.width,
      Key? key})
      : super(key: key);

  final double borderRadius;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: const Duration(seconds: 1),
      interval: const Duration(seconds: 1),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: const Color(0xffc7c7c7),
        ),
      ),
    );
  }
}
