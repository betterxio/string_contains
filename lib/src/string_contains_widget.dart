import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:string_contains/src/utils/constants.dart';
import 'models/string_contains_element.dart';

/// Call Back [Function] for [StringContainsElement].
typedef OnTapCallBack = void Function(StringContainsElement element);

/// [StringContainsWidget] highlights the url, email, phone number, hashtag, mention and [highLightWords].
/// provides [onTap] callback for each element of type [StringContainsElementType].
/// [StringContainsWidget] is a widget that displays a string that contains a
/// certain [StringContainsElementType]s.

class StringContainsWidget extends StatelessWidget {
  /// source is the text to be cleaned.
  final String source;

  /// [style] is the [TextStyle] to be used for the [Text] widget.
  final TextStyle? style;

  /// [linkStyle] is the [TextStyle] to be used for the [Text] widget.
  /// if null, the default style will be used.
  /// by default, the [linkStyle] is set normal [TextStyle] with [color] as [primaryColor].

  final TextStyle? linkStyle;

  /// [strustStyle] is the [StrutStyle] to be used for the [Text] widget.
  final StrutStyle? strutStyle;

  /// [textAlign] is the [TextAlign] to be used for the [Text] widget.
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

  /// [onTap] is the [OnTapCallBack] to be used for the [Text] widget.
  /// This can be used to handle the tap event.
  /// The callback will be called with the [StringContainsElement] that is
  /// detected.
  final OnTapCallBack? onTap;

  /// [highLightWords] is the [List] of [String]s to be used for the [Text] widget.
  /// This can be used to highlight certain words in the text.
  /// The words will be highlighted with the [highlightWordsStyle].
  /// if [highLightWords] is provided, and not added [StringContainsElementType.words] in [types],
  /// then [StringContainsElementType.words] will be added to [types] automatically.
  final List<String> highLightWords;

  /// [highlightWordsStyle] is the [TextStyle] to be used for the [Text] widget.
  /// This can be used to highlight certain words in the text.
  /// by default, the [highlightWordsStyle] is set normal [TextStyle] with [color] as [primaryColorDark].
  /// if [highLightWords] is provided, and not added [StringContainsElementType.words] in [types],
  /// then [StringContainsElementType.words] will be added to [types] automatically.
  final TextStyle? highlightWordsStyle;

  /// [caseSensitive] is the [bool] to be used for the caseSensitive in words.
  /// if [caseSensitive] is not provided, then [caseSensitive] will be used by default.
  final bool caseSensitive;

  /// [types] is the [List] of [StringContainsElementType]s to be used for the [Text] widget.
  /// this is used to identify the type of the [StringContainsElement]
  /// that need to be detected.
  /// if [types] is not provided, then [StringContainsElementType.url] will be used by default.
  /// if [types] is provided empty or only [StringContainsElementType.none] is provided, then
  /// only [Text] will be displayed.
  final List<StringContainsElementType> types;

  const StringContainsWidget({
    super.key,
    required this.source,
    this.style,
    this.linkStyle,
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
    this.onTap,
    this.highLightWords = const <String>[],
    this.highlightWordsStyle,
    this.caseSensitive = false,
    this.types = const [
      StringContainsElementType.url,
      StringContainsElementType.email,
      StringContainsElementType.phoneNumber,
      StringContainsElementType.hashtag,
      StringContainsElementType.mention,
    ],
  });

  @override
  Widget build(BuildContext context) {
    if (isSelecatable) {
      return SelectableText.rich(
        _textSpan(source, onTap, context),
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
    return Text.rich(
      _textSpan(source, onTap, context),
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

  /// [_getAllFilterTypes] is a helper function that returns all the
  /// [StringContainsElementType] that are in the [types] list.
  /// This is used to identify the type of the [StringContainsElement]
  /// that need to be detected.
  List<StringContainsElementType> _getAllFilterTypes() {
    final List<StringContainsElementType> filterTypes = [];
    if (types.isEmpty && highLightWords.isEmpty) {
      return filterTypes;
    } else if (types.isEmpty && highLightWords.isNotEmpty) {
      return [StringContainsElementType.words];
    } else if (types.isNotEmpty && highLightWords.isNotEmpty) {
      filterTypes.addAll(types);
      filterTypes.remove(StringContainsElementType.none);
      filterTypes.add(StringContainsElementType.words);
      return filterTypes.toSet().toList();
    } else if (types.isNotEmpty && highLightWords.isEmpty) {
      filterTypes.addAll(types);
      filterTypes.remove(StringContainsElementType.none);
      filterTypes.remove(StringContainsElementType.words);
      return filterTypes.toSet().toList();
    }
    return filterTypes;
  }

  /// [_textSpan] returns a [TextSpan] for the [String] source.
  /// This is used to create the [TextSpan] for the [Text]/[SelectableText] widget.
  TextSpan _textSpan(
    String source,
    OnTapCallBack? onTap,
    BuildContext context,
  ) {
    final filterTypes = _getAllFilterTypes();
    if (filterTypes.isEmpty) {
      return TextSpan(
        text: source,
        style: style,
        locale: locale,
      );
    }
    final styleForLinks = linkStyle ??
        TextStyle(
          color: Theme.of(context).primaryColor,
        );
    final styleForWords = highlightWordsStyle ??
        TextStyle(
          color: Theme.of(context).primaryColorDark,
        );
    final textSpans = <TextSpan>[];
    final regExp = createRegExpFromTypes(
      filterTypes,
      words: highLightWords,
      caseSensitive: caseSensitive,
    );
    source.splitMapJoin(
      regExp,
      onMatch: (match) {
        final startIndex = match.start;
        final endIndex = match.end;
        final matchString = source.substring(startIndex, endIndex);
        final stringType = stringToType(
          matchString,
          filterTypes,
        );
        final stringContainsElement = StringContainsElement(
          stringType,
          matchString,
        );
        if (stringContainsElement.type == StringContainsElementType.none) {
          textSpans.add(
            TextSpan(
              text: matchString,
              style: style,
              locale: locale,
              semanticsLabel: semanticsLabel,
            ),
          );
        }
        textSpans.add(
          TextSpan(
            text: matchString,
            style: stringContainsElement.type == StringContainsElementType.words
                ? styleForWords
                : styleForLinks,
            locale: locale,
            semanticsLabel: semanticsLabel,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                onTap?.call(stringContainsElement);
              },
          ),
        );
        return matchString;
      },
      onNonMatch: (match) {
        final matchString = match.substring(0);
        textSpans.add(
          TextSpan(
            text: matchString,
            style: style,
            locale: locale,
            semanticsLabel: semanticsLabel,
          ),
        );
        return matchString;
      },
    );
    return TextSpan(
      children: textSpans,
    );
  }
}
