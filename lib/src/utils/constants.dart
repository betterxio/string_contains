import 'bad_words.dart';

/// RegExp for detecting [badWords].
/// List of bad words is taken from [badWords].
final badWordsRegExp = RegExp(
  "\\b(?:${badWords.join('|')})\\b",
  caseSensitive: false,
  dotAll: true,
);

/// RegExp for detecting [url].
final urlRegExp = RegExp(
  r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+',
  caseSensitive: false,
  dotAll: true,
);

/// RegExp for detecting [email].
final emailRegExp = RegExp(
  r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}',
  caseSensitive: false,
  dotAll: true,
);

/// RegExp for detecting [phoneNumber].
final phoneNumberRegExp = RegExp(
  r'[0-9]{10}',
  caseSensitive: false,
  dotAll: true,
);

/// RegExp for detecting [hashtag].
final hashtagRegExp = RegExp(
  r'#[a-zA-Z0-9_]+',
  caseSensitive: false,
  dotAll: true,
);

/// RegExp for detecting [mention].
final mentionRegExp = RegExp(
  r'@[a-zA-Z0-9_]+',
  caseSensitive: false,
  dotAll: true,
);

/// RegExp for detecting List<String> [words].
RegExp wordsRegExp(List<String> words, {bool caseSensitive = false}) {
  final regExp = RegExp(
    "\\b(?:${words.join('|')})\\b",
    caseSensitive: caseSensitive,
    dotAll: true,
  );
  return regExp;
}

/// enum for [StringContainsElementType]
/// which is used to determine which type of element is detected.
///
/// [StringContainsElementType.url] is used for detecting url.
/// [StringContainsElementType.email] is used for detecting email.
/// [StringContainsElementType.phoneNumber] is used for detecting phone number.
/// [StringContainsElementType.hashtag] is used for detecting hashtag.
/// [StringContainsElementType.mention] is used for detecting mention.
/// [StringContainsElementType.words] is used for detecting words.
/// [StringContainsElementType.none] is used for detecting nothing/badword.
///

enum StringContainsElementType {
  url,
  email,
  phoneNumber,
  hashtag,
  mention,
  words,
  none,
}
