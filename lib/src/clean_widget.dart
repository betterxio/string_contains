import 'package:flutter/material.dart';
import 'package:string_contains/src/utils/bad_words.dart';
import 'package:string_contains/string_contains.dart';

/// [CleanWidget] is a [StatelessWidget].
/// it used to clean up [bad-words]/hide [emails]/hide [phoneNumbers]/partially or fully hide [extraWords] from the [source] string.
///
/// return a clean [Text] widget.
///
class CleanWidget extends StatelessWidget {
  /// source is the text to be cleaned.
  /// if [source] is empty, return empty [Text] widget.
  /// if [source] is not empty, return a [Text] widget with clean text.
  ///
  final String source;

  /// [style] is the [TextStyle] to be used for the [Text] widget.
  final TextStyle? style;

  /// [strustStyle] is the [StrutStyle] to be used for the [Text] widget.
  final StrutStyle? strutStyle;

  /// [textAlign] is the [TextAlign] to be used for the [Text] widget.
  /// if [textAlign] is null, use [TextAlign.start] as default.
  final TextAlign? textAlign;

  /// [textDirection] is the [TextDirection] to be used for the [Text] widget.
  /// This is useful for languages that read right-to-left.
  final TextDirection? textDirection;

  /// [locale] is the [Locale] to be used for the [Text] widget.
  final Locale? locale;

  /// [softWrap] is the [bool] to be used for the [Text] widget.
  final bool? softWrap;

  /// [overflow] is the [TextOverflow] to be used for the [Text] widget.
  final TextOverflow? overflow;

  // /// [textScaleFactor] is the [double] to be used for the [Text] widget.
  // /// This can be used to increase or decrease the size of the text.
  // removed due to deprecation
  // final double? textScaleFactor;

  /// [maxLines] is the [int] to be used for the [Text] widget.
  /// This can be used to limit the number of lines in the text.
  final int? maxLines;

  /// [semanticsLabel] is the [String] to be used for the [Text] widget.
  final String? semanticsLabel;

  /// [textWidthBasis] is the [TextWidthBasis] to be used for the [Text] widget.
  /// The different ways of measuring the width of one or more lines of text.
  final TextWidthBasis? textWidthBasis;

  /// [textHeightBehavior] is the [TextHeightBehavior] to be used for the [Text] widget.
  final TextHeightBehavior? textHeightBehavior;

  /// [isSelectable] is the [bool] to be used for the [Text] widget.
  /// This can be used to make the text selectable.
  final bool isSelecatable;

  /// [obscuringCharacter] is the [String] to be used for the [Text] widget.
  /// This can be used to obscure the text.
  /// the default value is '*'.
  final String obscuringCharacter;

  /// [keepFirstLastLetters] is the [bool] to be used for the [Text] widget.
  /// This can be used to keep the first and last letters of the text.
  final bool keepFirstLastLetters;

  /// [hideEmails] is the [bool] to be used for the [Text] widget.
  /// This can be used to hide/clean emails.
  final bool hideEmails;

  /// [hidePhoneNumbers] is the [bool] to be used for the [Text] widget.
  /// This can be used to hide phone numbers.
  final bool hidePhoneNumbers;

  /// [extraWords] is [List] of [String]s to be used for the [Text] widget.
  /// other [extraWords] to be cleaned.
  /// This is useful for hiding extra words in a [source].
  final List<String> extraWords;

  /// [caseSensitive] is the [bool] to be used for the [Text] widget.
  /// This can be used to make the text case sensitive.
  /// This is useful for hiding [extraWords] in a text.
  final bool caseSensitive;

  /// [includeDefaultBadWords] is the [bool] to be used for the [Text] widget.
  /// This can be used to include default bad words.
  /// This is useful for hiding bad words in a text.
  final bool includeDefaultBadWords;

  const CleanWidget({
    super.key,
    required this.source,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    // removed due to deprecation
    // this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.isSelecatable = false,
    this.obscuringCharacter = '*',
    this.keepFirstLastLetters = true,
    this.hideEmails = true,
    this.hidePhoneNumbers = true,
    this.extraWords = const [],
    this.caseSensitive = false,
    this.includeDefaultBadWords = true,
  });

  @override
  Widget build(BuildContext context) {
    /// [text] is the clean [String] of [source].
    final text = cleanText(source);
    if (isSelecatable) {
      return SelectableText(
        text,
        style: style,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        // textScaleFactor: textScaleFactor,
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
      // textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
  }

  /// [cleanText] is a method that can be used to clean up text.
  /// It takes a [source] and returns a [String] that is cleaned up.
  /// It can be used to clean up text that is used in a widget.
  ///
  String cleanText(String source) {
    if (hideEmails) {
      source = source.hideEmails(obscuringCharacter: obscuringCharacter);
    }
    if (hidePhoneNumbers) {
      source = source.hidePhoneNumbers(obscuringCharacter: obscuringCharacter);
    }
    if (extraWords.isNotEmpty) {
      source = source.cleanWords(
        includeDefaultBadWords
            ? [...extraWords.toSet(), ...badWords]
            : [...extraWords.toSet()],
        obscuringCharacter: obscuringCharacter,
        keepFirstLastLetters: keepFirstLastLetters,
        caseSensitive: caseSensitive,
      );
    }
    return source.cleanBadWords(
      obscuringCharacter: obscuringCharacter,
      keepFirstLastLetters: keepFirstLastLetters,
    );
  }
}
