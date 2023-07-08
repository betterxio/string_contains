import 'bad_words.dart';

/// [RegExp] for detecting [badWords].
/// [List] of bad words is taken from [badWords].
final badWordsRegExp = RegExp(
  "\\b(?:${badWords.join('|')})\\b",
  caseSensitive: false,
  dotAll: true,
);

/// [RegExp] for detecting [url].
final urlRegExp = RegExp(
  r"(http(s)?:\/\/)?(www.)?[a-zA-Z0-9]{2,256}\.[a-zA-Z0-9]{2,256}(\.[a-zA-Z0-9]{2,256})?([-a-zA-Z0-9@:%_\+~#?&//=.]*)([-a-zA-Z0-9@:%_\+~#?&//=]+)",
  caseSensitive: false,
  dotAll: true,
);

/// [RegExp] for detecting [email].
final emailRegExp = RegExp(
  r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}',
  caseSensitive: false,
  dotAll: true,
);

/// [RegExp] for detecting [phoneNumber].
/// checks for phone number
/// 1. (123) 456-7890
/// 2. (123)456-7890
/// 3. 123-456-7890
/// 4. 123.456.7890
/// 5. 1234567890
/// 6. +31636363634
/// 7. 075-63546725
final phoneNumberRegExp = RegExp(
  r'(\+?\d{1,4}[\s-]?)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}',
  caseSensitive: false,
  dotAll: true,
);

/// [RegExp] for detecting [hashtag].
final hashtagRegExp = RegExp(
  r'#[a-zA-Z0-9_]+',
  caseSensitive: false,
  dotAll: true,
);

/// [RegExp] for detecting [mention].
final mentionRegExp = RegExp(
  r'(^|[^\w])@([\w\_\.]+)',
  caseSensitive: false,
  dotAll: true,
);

/// [RegExp] for detecting List<String> [words].
RegExp wordsRegExp(List<String> words, {bool caseSensitive = false}) {
  final regExp = RegExp(
    "\\b(?:${words.join('|')})\\b",
    caseSensitive: caseSensitive,
    dotAll: true,
  );
  return regExp;
}

/// [enum] for [StringContainsElementType]
/// which is used to determine which type of element is detected.
///
/// [StringContainsElementType.url] is used for detecting url.
///
/// [StringContainsElementType.email] is used for detecting email.
///
/// [StringContainsElementType.phoneNumber] is used for detecting phone number.
///
/// [StringContainsElementType.hashtag] is used for detecting hashtag.
///
/// [StringContainsElementType.mention] is used for detecting mention.
///
/// [StringContainsElementType.words] is used for detecting words.
///
/// [StringContainsElementType.none] is used for detecting nothing.
///

enum StringContainsElementType {
  /// [StringContainsElementType.email] is used for detecting email.
  email,

  /// [StringContainsElementType.phoneNumber] is used for detecting phone number.
  phoneNumber,

  /// [StringContainsElementType.hashtag] is used for detecting hashtag.
  hashtag,

  /// [StringContainsElementType.mention] is used for detecting mention.
  mention,

  /// [StringContainsElementType.url] is used for detecting url.
  url,

  /// [StringContainsElementType.words] is used for detecting words.
  words,

  /// [StringContainsElementType.none] is used for detecting nothing.
  none,
}

/// [extension] on [StringContainsElementType].
/// this extension is used to sort [StringContainsElementType] in alphabetical order.
/// [StringContainsElementType.email] is before [StringContainsElementType.phoneNumber]
/// [StringContainsElementType.phoneNumber] is before [StringContainsElementType.hashtag]
/// [StringContainsElementType.hashtag] is before [StringContainsElementType.mention]
/// [StringContainsElementType.mention] is before [StringContainsElementType.url]
/// [StringContainsElementType.url] is before [StringContainsElementType.words]
/// [StringContainsElementType.words] is before [StringContainsElementType.none]

///
/// [extension] on [StringContainsElementType].
/// this extension is used to sort [StringContainsElementType] in order.
/// [StringContainsElementType.email] is before [StringContainsElementType.phoneNumber]
/// [StringContainsElementType.phoneNumber] is before [StringContainsElementType.hashtag]
/// [StringContainsElementType.hashtag] is before [StringContainsElementType.mention]
/// [StringContainsElementType.mention] is before [StringContainsElementType.url]
/// [StringContainsElementType.url] is before [StringContainsElementType.words]
/// [StringContainsElementType.words] is before [StringContainsElementType.none]
///
extension on StringContainsElementType {
  int compareTo(StringContainsElementType other) =>
      index.compareTo(other.index);
}

/// [createRegExpFromTypes] is used to combine multiple [RegExp]s.
/// [types] is a list of [StringContainsElementType]s.
/// [caseSensitive] is used to determine whether the [RegExp] of [words] is case sensitive.
/// ```
/// refrence:
/// ```
/// https://stackoverflow.com/questions/9213237/combining-regular-expressions-in-javascript
///
/// [RegExp] is used to detect [url], [email], [phoneNumber], [hashtag], [mention], [words].
///
RegExp createRegExpFromTypes(
  List<StringContainsElementType> types, {
  List<String> words = const <String>[],
  bool caseSensitive = false,
}) {
  types.sort((a, b) => a.compareTo(b));
  final stringBuffer = StringBuffer();
  for (final type in types) {
    final isLast = type == types.last;
    switch (type) {
      case StringContainsElementType.email:
        isLast
            ? stringBuffer.write(emailRegExp.pattern)
            : stringBuffer.write(
                '${emailRegExp.pattern}|',
              );
        break;
      case StringContainsElementType.phoneNumber:
        isLast
            ? stringBuffer.write(phoneNumberRegExp.pattern)
            : stringBuffer.write(
                '${phoneNumberRegExp.pattern}|',
              );
        break;
      case StringContainsElementType.hashtag:
        isLast
            ? stringBuffer.write(hashtagRegExp.pattern)
            : stringBuffer.write(
                '${hashtagRegExp.pattern}|',
              );
        break;
      case StringContainsElementType.mention:
        isLast
            ? stringBuffer.write(mentionRegExp.pattern)
            : stringBuffer.write(
                '${mentionRegExp.pattern}|',
              );
        break;
      case StringContainsElementType.url:
        isLast
            ? stringBuffer.write(urlRegExp.pattern)
            : stringBuffer.write(
                '${urlRegExp.pattern}|',
              );
        break;
      case StringContainsElementType.words:
        isLast
            ? stringBuffer
                .write(wordsRegExp(words, caseSensitive: caseSensitive).pattern)
            : stringBuffer.write(
                '${wordsRegExp(words, caseSensitive: caseSensitive).pattern}|',
              );
        break;
      default:
        break;
    }
  }
  return RegExp(
    stringBuffer.toString(),
  );
}

/// [stringToType] is used to determine which type of [StringContainsElementType] is detected.
/// [source] is the source string.

StringContainsElementType stringToType(
  String string,
  List<StringContainsElementType> types, {
  List<String> words = const [],
  bool caseSensitive = false,
}) {
  if (string.isEmpty) {
    return StringContainsElementType.none;
  }
  types.sort((a, b) => a.compareTo(b));
  for (final type in types) {
    switch (type) {
      case StringContainsElementType.email:
        if (emailRegExp.hasMatch(string)) {
          return type;
        }
        break;
      case StringContainsElementType.phoneNumber:
        if (phoneNumberRegExp.hasMatch(string)) {
          return type;
        }
        break;
      case StringContainsElementType.hashtag:
        if (hashtagRegExp.hasMatch(string)) {
          return type;
        }
        break;
      case StringContainsElementType.mention:
        if (mentionRegExp.hasMatch(string)) {
          return type;
        }
        break;
      case StringContainsElementType.url:
        if (urlRegExp.hasMatch(string)) {
          return type;
        }
        break;
      case StringContainsElementType.words:
        if (wordsRegExp(words, caseSensitive: caseSensitive).hasMatch(string)) {
          return type;
        }
        break;
      default:
        return StringContainsElementType.none;
    }
  }
  return StringContainsElementType.none;
}
