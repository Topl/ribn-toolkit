import 'package:flutter/material.dart';
import 'package:ribn_toolkit/constants/colors.dart';
import 'package:ribn_toolkit/constants/styles.dart';
import 'dart:ui' as ui show TextHeightBehavior;

import 'package:ribn_toolkit/constants/text_tag_options.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    String this.data, {
    Key? key,
    required this.tag,
    this.color = RibnColors.defaultText,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
  })  : textSpan = null,
        super(key: key);

  /// The text to display.
  ///
  /// This will be null if a [textSpan] is provided instead.
  final String? data;

  /// The text to display as a [InlineSpan].
  ///
  /// This will be null if [data] is provided instead.
  final InlineSpan? textSpan;

  /// The text tag for providing styling hierarchy e.g. TextTagOptions.bodyRegular
  final TextTagOptions? tag;

  /// The color value provided to style the text
  final Color? color;

  /// {@macro flutter.painting.textPainter.strutStyle}
  final StrutStyle? strutStyle;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The directionality of the text.
  ///
  /// This decides how [textAlign] values like [TextAlign.start] and
  /// [TextAlign.end] are interpreted.
  ///
  /// This is also used to disambiguate how to render bidirectional text. For
  /// example, if the [data] is an English phrase followed by a Hebrew phrase,
  /// in a [TextDirection.ltr] context the English phrase will be on the left
  /// and the Hebrew phrase to its right, while in a [TextDirection.rtl]
  /// context, the English phrase will be on the right and the Hebrew phrase on
  /// its left.
  ///
  /// Defaults to the ambient [Directionality], if any.
  final TextDirection? textDirection;

  /// Used to select a font when the same Unicode character can
  /// be rendered differently, depending on the locale.
  ///
  /// It's rarely necessary to set this property. By default its value
  /// is inherited from the enclosing app with `Localizations.localeOf(context)`.
  ///
  /// See [RenderParagraph.locale] for more information.
  final Locale? locale;

  /// Whether the text should break at soft line breaks.
  ///
  /// If false, the glyphs in the text will be positioned as if there was unlimited horizontal space.
  final bool? softWrap;

  /// How visual overflow should be handled.
  ///
  /// If this is null [TextStyle.overflow] will be used, otherwise the value
  /// from the nearest [DefaultTextStyle] ancestor will be used.
  final TextOverflow? overflow;

  /// The number of font pixels for each logical pixel.
  ///
  /// For example, if the text scale factor is 1.5, text will be 50% larger than
  /// the specified font size.
  ///
  /// The value given to the constructor as textScaleFactor. If null, will
  /// use the [MediaQueryData.textScaleFactor] obtained from the ambient
  /// [MediaQuery], or 1.0 if there is no [MediaQuery] in scope.
  final double? textScaleFactor;

  /// An optional maximum number of lines for the text to span, wrapping if necessary.
  /// If the text exceeds the given number of lines, it will be truncated according
  /// to [overflow].
  ///
  /// If this is 1, text will not wrap. Otherwise, text will be wrapped at the
  /// edge of the box.
  ///
  /// If this is null, but there is an ambient [DefaultTextStyle] that specifies
  /// an explicit number for its [DefaultTextStyle.maxLines], then the
  /// [DefaultTextStyle] value will take precedence. You can use a [RichText]
  /// widget directly to entirely override the [DefaultTextStyle].
  final int? maxLines;

  /// {@template flutter.widgets.Text.semanticsLabel}
  /// An alternative semantics label for this text.
  ///
  /// If present, the semantics of this widget will contain this value instead
  /// of the actual text. This will overwrite any of the semantics labels applied
  /// directly to the [TextSpan]s.
  ///
  /// This is useful for replacing abbreviations or shorthands with the full
  /// text value:
  ///
  /// ```dart
  /// Text(r'$$', semanticsLabel: 'Double dollars')
  /// ```
  /// {@endtemplate}
  final String? semanticsLabel;

  /// {@macro flutter.painting.textPainter.textWidthBasis}
  final TextWidthBasis? textWidthBasis;

  /// {@macro dart.ui.textHeightBehavior}
  final ui.TextHeightBehavior? textHeightBehavior;

  @override
  Widget build(BuildContext context) {
    return Text(
      data ?? '',
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      style: addConditionalStyling(),
    );
  }

  // Adds styling from TextTagOptions property provided
  TextStyle addConditionalStyling() {
    switch (tag) {
      case TextTagOptions.h1:
        return RibnToolkitTextStyles.h1.copyWith(
          color: color,
        );
      case TextTagOptions.h2:
        return RibnToolkitTextStyles.h2.copyWith(
          color: color,
        );
      case TextTagOptions.h3:
        return RibnToolkitTextStyles.h3.copyWith(
          color: color,
        );
      case TextTagOptions.h4:
        return RibnToolkitTextStyles.h4.copyWith(
          color: color,
        );
      case TextTagOptions.h5:
        return RibnToolkitTextStyles.h5.copyWith(
          color: color,
        );
      case TextTagOptions.bodyExtraSmall:
        return RibnToolkitTextStyles.bodyExtraSmall.copyWith(
          color: color,
        );
      case TextTagOptions.bodyExtraSmallBold:
        return RibnToolkitTextStyles.bodyExtraSmallBold.copyWith(
          color: color,
        );
      case TextTagOptions.bodyExtraSmallSpacedOut:
        return RibnToolkitTextStyles.bodyExtraSmallSpacedOut.copyWith(
          color: color,
        );
      case TextTagOptions.bodySmall:
        return RibnToolkitTextStyles.bodySmall.copyWith(
          color: color,
        );
      case TextTagOptions.bodySmallBold:
        return RibnToolkitTextStyles.bodySmallBold.copyWith(
          color: color,
        );
      case TextTagOptions.bodySmallSpacedOut:
        return RibnToolkitTextStyles.bodySmallSpacedOut.copyWith(
          color: color,
        );
      case TextTagOptions.bodyRegular:
        return RibnToolkitTextStyles.bodyRegular.copyWith(
          color: color,
        );
      case TextTagOptions.bodyRegularBold:
        return RibnToolkitTextStyles.bodyRegularBold.copyWith(
          color: color,
        );
      case TextTagOptions.bodyRegularSpacedOut:
        return RibnToolkitTextStyles.bodyRegularSpacedOut.copyWith(
          color: color,
        );
      case TextTagOptions.bodyLarge:
        return RibnToolkitTextStyles.bodyLarge.copyWith(
          color: color,
        );
      case TextTagOptions.bodyLargeBold:
        return RibnToolkitTextStyles.bodyLargeBold.copyWith(
          color: color,
        );
      case TextTagOptions.bodyLargeSpacedOut:
        return RibnToolkitTextStyles.bodyLargeSpacedOut.copyWith(
          color: color,
        );
      case TextTagOptions.bodyExtraLarge:
        return RibnToolkitTextStyles.bodyExtraLarge.copyWith(
          color: color,
        );
      case TextTagOptions.bodyExtraLargeBold:
        return RibnToolkitTextStyles.bodyExtraLargeBold.copyWith(
          color: color,
        );
      case TextTagOptions.bodyExtraLargeSpacedOut:
        return RibnToolkitTextStyles.bodyExtraLargeSpacedOut.copyWith(
          color: color,
        );
      default:
        return RibnToolkitTextStyles.body1.copyWith(
          color: color,
        );
    }
  }
}
