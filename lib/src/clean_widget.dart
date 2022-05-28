import 'package:flutter/material.dart';
import 'package:string_contains/string_contains.dart';

/// CleanWidget is a widget that is intended to be used as a base class for
/// widgets that need to clean up text.
///
/// return a clean [Text] widget.
class CleanWidget extends StatelessWidget {
  final String source;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final bool isSelecatable;
  final String obscuringCharacter;
  final bool keepFirstLastLetters;
  final bool hideEmails;
  final bool hidePhoneNumbers;

  const CleanWidget({
    Key? key,
    required this.source,
    this.style,
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
    this.isSelecatable = false,
    this.obscuringCharacter = '*',
    this.keepFirstLastLetters = true,
    this.hideEmails = true,
    this.hidePhoneNumbers = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = cleanText(source);
    if (isSelecatable) {
      return SelectableText(
        text,
        style: style,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
      );
    }
    return Text(
      text,
      key: key,
      style: style,
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
    );
  }

  /// cleanText is a method that can be used to clean up text.
  /// It takes a [source] and returns a [String] that is cleaned up.
  /// It can be used to clean up text that is used in a widget.
  String cleanText(String source) {
    if (hideEmails && hidePhoneNumbers) {
      source = source.hideEmails(obscuringCharacter: obscuringCharacter);
      source = source.hidePhoneNumbers(obscuringCharacter: obscuringCharacter);
    } else if (hideEmails) {
      source = source.hideEmails(obscuringCharacter: obscuringCharacter);
    } else if (hidePhoneNumbers) {
      source = source.hidePhoneNumbers(obscuringCharacter: obscuringCharacter);
    }
    return source.cleanBadWords(
      obscuringCharacter: obscuringCharacter,
      keepFirstLastLetters: keepFirstLastLetters,
    );
  }
}
