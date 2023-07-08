import 'package:string_contains/src/utils/constants.dart';

/// ```dart
/// Extension on [String] that provides a methods to check, if a string contains any bad-words/url/link/email/phone number/hashtag/mention and more others.
/// ```
extension StringContains on String {
  /// Checks if the string contains any of bad-word/profane-word(s).
  ///
  /// returns true if the string contains any of bad-word/profane-word(s).
  ///
  /// returns false if the string does not contain any of bad-word/profane-word(s).
  ///
  /// returns false if the string is empty.
  ///
  /// ```dart
  /// 'I am CEO, Bitch'.containsBadWords(); // returns true
  /// ```
  bool containsBadWord() {
    if (isNotEmpty) {
      try {
        return badWordsRegExp.hasMatch(this);
      } on Exception {
        return false;
      }
    }
    return false;
  }

  /// Clean the string from any bad-word/profane-word(s).
  ///
  /// returns clean [String] if the string contains any bad-word/profane-word(s).
  /// all bad-words are removed and replaced with [String] obscuringCharacter.
  ///
  /// returns same [String] if the string does not contain any bad-word/profane-word(s).
  ///
  /// obscuringCharacter is defaulted to '*'.
  ///
  /// keepFirstLastLetters is defaulted to [true].
  /// If [keepFirstLastLetters] is set to [false], first and last letter of the string also will be replaced with [String] obscuringCharacter.
  ///
  /// ```dart
  /// 'I am CEO, Bitch'.cleanBadWords() // returns 'I am CEO, B***t'.
  ///
  /// 'I am CEO, Bitch'.cleanBadWords(keepFirstLastLetters: false) // returns 'I am CEO, *****'.
  ///
  /// 'I am CEO, Bitch'.cleanBadWords(obscuringCharacter: '@') // returns 'I am CEO, B@@@h'.
  /// ```

  String cleanBadWords(
      {String obscuringCharacter = '*', bool keepFirstLastLetters = true}) {
    if (isNotEmpty) {
      try {
        final result = replaceAllMapped(badWordsRegExp, (match) {
          final length = match.end - match.start;
          if (length >= 3 && keepFirstLastLetters) {
            final matchedString = substring(match.start, match.end);
            final cleaned = matchedString.split('').first +
                obscuringCharacter * (length - 2) +
                matchedString.split('').last;
            return cleaned;
          }
          return obscuringCharacter * length;
        });
        return result;
      } on Exception {
        return this;
      }
    }
    return this;
  }

  /// Get all bad-words/profane-word(s) from the string.
  ///
  /// returns [List] if the string contains any bad-word/profane-word(s).
  ///
  /// returns empty [List] if the string does not contain any bad-word/profane-word(s).
  ///
  /// returns empty [List] if the string is empty.
  ///
  /// ```dart
  /// 'I am CEO, Bitch'.getBadWords() // returns ['Bitch']
  /// ```

  List<String> getBadWords() {
    if (isNotEmpty) {
      try {
        final matched = badWordsRegExp.allMatches(this);
        return matched
            .map((match) {
              return substring(match.start, match.end);
            })
            .toSet()
            .toList();
      } on Exception {
        return <String>[];
      }
    }
    return [];
  }

  /// Checks if the string contains [url]/[uri].
  ///
  /// returns true if the string contains [url]/[uri].
  ///
  /// returns false if the string does not contain [url]/[uri].
  ///
  /// returns false if the string is empty.
  ///
  /// customRegExp is your own custom RegExp.
  ///
  /// ```dart
  /// 'Please visit our website : https://betterx.io/'.containsUrl() // returns true
  /// ```

  bool containsUrl({RegExp? customRegExp}) {
    if (isNotEmpty) {
      try {
        final regExp = customRegExp ?? urlRegExp;
        return regExp.hasMatch(this);
      } on Exception {
        return false;
      }
    }
    return false;
  }

  /// Get all [List] of [url]/[uri] [String]s from the string.
  ///
  /// returns [List] if the string contains [url]/[uri].
  ///
  /// returns empty [List] if the string does not contain [url]/[uri].
  ///
  /// returns empty [List] if the string is empty.
  ///
  /// customRegExp is your own custom RegExp.
  ///
  /// ```dart
  /// 'Please visit our website : https://betterx.io/'.getUrls() // returns ['https://betterx.io/']
  /// ```

  List<String> getUrls({
    RegExp? customRegExp,
  }) {
    if (isNotEmpty) {
      try {
        final regExp = customRegExp ?? urlRegExp;
        final matches = regExp.allMatches(this);
        return matches
            .map((match) => substring(match.start, match.end))
            .toSet()
            .toList();
      } on Exception {
        return [];
      }
    }
    return [];
  }

  /// Checks if the string contains [email].
  ///
  /// returns true if the string contains [email].
  ///
  /// returns false if the string does not contain [email].
  ///
  /// returns false if the string is empty.
  ///
  /// customRegExp is your own custom RegExp.
  ///
  /// ```dart
  /// "BetterX.io : Let's build something Better, User-centered & beautiful together\n for more info contact us at : info@betterx.io".containsEmail() // returns false
  /// ```

  bool containsEmail({
    RegExp? customRegExp,
  }) {
    if (isNotEmpty) {
      try {
        final regExp = customRegExp ?? emailRegExp;
        return regExp.hasMatch(this);
      } on Exception {
        return false;
      }
    }
    return false;
  }

  /// Get [List] of all [email] from the string.
  ///
  /// returns [List] if the string contains [email].
  ///
  /// returns empty [List] if the string does not contain [email].
  ///
  /// returns empty [List] if the string is empty.
  ///
  /// customRegExp is your own custom RegExp.
  ///
  /// ```dart
  /// "BetterX.io : Let's build something Better, User-centered & beautiful together\n for more info contact us at : info@betterx.io".getEmails() // returns ['betterx.io']
  /// ```

  List<String> getEmails({
    RegExp? customRegExp,
  }) {
    if (isNotEmpty) {
      try {
        final regExp = customRegExp ?? emailRegExp;
        final matches = regExp.allMatches(this);
        return matches
            .map((match) => substring(match.start, match.end))
            .toSet()
            .toList();
      } on Exception {
        return [];
      }
    }
    return [];
  }

  /// hide [email] from the string.
  ///
  /// returns [String] if the string contains [email].
  ///
  /// returns [String] if the string does not contain [email].
  ///
  /// returns [String] if the string is empty.
  ///
  /// obscuringCharacter is defaulted to '*'.
  ///
  /// customRegExp is your own custom RegExp.
  ///
  /// ```dart
  /// "BetterX.io : Let's build something Better, User-centered & beautiful together\n for more info contact us at : info@
  /// betterx.io".hideEmails() // returns "BetterX.io : Let's build something Better, User-centered & beautiful together\n for more info contact us at : in**@betterx.io
  /// ```

  String hideEmails({String obscuringCharacter = '*', RegExp? customRegExp}) {
    if (isNotEmpty) {
      try {
        final regExp = customRegExp ?? emailRegExp;
        final result = replaceAllMapped(regExp, (match) {
          final matchedString = substring(match.start, match.end);
          final regExpForObscuring = RegExp(
            r'(?<=^[A-Za-z0-9]{2}).*?(?=@)',
            caseSensitive: false,
            dotAll: true,
          );
          final computedString = matchedString.replaceAllMapped(
            regExpForObscuring,
            (match) {
              final computedMatchedString =
                  matchedString.substring(match.start, match.end);
              return obscuringCharacter * computedMatchedString.length;
            },
          );
          return computedString;
        });
        return result;
      } on Exception {
        return this;
      }
    }
    return this;
  }

  /// Checks if the string contains [phone].
  ///
  /// phone number will be 10 digits without country code.
  ///
  /// returns true if the string contains [phone].
  ///
  /// returns false if the string does not contain [phone].
  ///
  /// returns false if the string is empty.
  ///
  /// customRegExp is your own custom RegExp.
  ///
  /// ```dart
  /// "BetterX.io : Let's build something Better, User-centered & beautiful together\n for more info contact us at : 91-9000000001".containsPhoneNumber() // returns true
  /// ```

  bool containsPhoneNumber({
    RegExp? customRegExp,
  }) {
    if (isNotEmpty) {
      try {
        final regExp = customRegExp ?? phoneNumberRegExp;
        return regExp.hasMatch(this);
      } on Exception {
        return false;
      }
    }
    return false;
  }

  /// Get [List] of all [phone] from the string.
  ///
  /// phone number will be 10 digits without country code.
  ///
  /// returns [List] if the string contains [phone].
  ///
  /// returns empty [List] if the string does not contain [phone].
  ///
  /// returns empty [List] if the string is empty.
  ///
  /// customRegExp is your own custom RegExp.
  /// ```dart
  /// "BetterX.io : Let's build something Better, User-centered & beautiful together\n for more info contact us at : 91-9000000001".getPhoneNumbers() // returns ['9000000001']
  /// ```

  List<String> getPhoneNumbers({
    RegExp? customRegExp,
  }) {
    if (isNotEmpty) {
      try {
        final regExp = customRegExp ?? phoneNumberRegExp;
        final matches = regExp.allMatches(this);
        return matches
            .map((match) => substring(match.start, match.end))
            .toSet()
            .toList();
      } on Exception {
        return [];
      }
    }
    return [];
  }

  /// hide [phone] from the string.
  ///
  /// phone number will be 10 digits without country code.
  ///
  /// returns [String] if the string contains [phone].
  ///
  /// returns [String] if the string does not contain [phone].
  ///
  /// returns [String] if the string is empty.
  ///
  /// obscuringCharacter is defaulted to '*'.
  ///
  /// showFirstLastTwoDigits is defaulted to true.

  /// ```dart
  /// "91-9000000001".hidePhoneNumbers() // returns "91-00******00"
  /// "91-9000000001".hidePhoneNumbers(showFirstLastTwoDigits: false) // returns "91-********"
  /// "91-9000000001".hidePhoneNumbers(obscuringCharacter: '#') // returns "91-84######00"
  /// ```
  String hidePhoneNumbers({
    String obscuringCharacter = '*',
    bool showFirstLastTwoDigits = true,
    RegExp? customRegExp,
  }) {
    if (isNotEmpty) {
      try {
        final regExp = customRegExp ?? phoneNumberRegExp;
        final result = replaceAllMapped(regExp, (match) {
          final matchedString = substring(match.start, match.end);
          if (showFirstLastTwoDigits) {
            return matchedString.substring(0, 2) +
                obscuringCharacter * 6 +
                matchedString.substring(8);
          }
          final computedString = matchedString.replaceAll(
            RegExp(r'[0-9]'),
            obscuringCharacter,
          );
          return computedString;
        });
        return result;
      } on Exception {
        return this;
      }
    }
    return this;
  }

  /// Checks if the string contains given [List] words.
  ///
  /// returns true if the string contains given [List] words.
  ///
  /// returns false if the string does not contain given [List] words.
  ///
  /// returns false if the string is empty.
  ///
  /// caseSensitive is defaulted to false.
  ///
  /// customRegExp is your own custom RegExp.
  ///
  /// ```dart
  /// "hi there, i love flutter.".containsWords(["hi", "there","flutter" ]) // returns true
  /// "i love Flutter.".containsWords(["hi", "there","flutter"], caseSensitive: true) // returns false
  /// ```

  bool containsWords(List<String> words, {bool caseSensitive = false}) {
    if (isNotEmpty) {
      try {
        final regExp = wordsRegExp(words, caseSensitive: caseSensitive);
        return regExp.hasMatch(this);
      } on Exception {
        return false;
      }
    }
    return false;
  }

  /// Get [List] of all [words] from the string.
  ///
  /// returns [List] if the string contains given [List] words.
  ///
  /// returns empty [List] if the string does not contain given [List] words.
  ///
  /// returns empty [List] if the string is empty.
  ///
  /// caseSensitive is defaulted to false.
  ///
  /// customRegExp is your own custom RegExp.
  ///
  /// ```dart
  /// "hi there, i love flutter.".getWords(["hi", "there","flutter" ]) // returns ['hi', 'there', 'flutter']
  /// "i love Flutter.".getWords(["hi", "there","flutter"], caseSensitive: true) // returns []
  /// ```

  List<String> getWords(
    List<String> words, {
    bool caseSensitive = false,
  }) {
    if (isNotEmpty) {
      try {
        final regExp = wordsRegExp(words, caseSensitive: caseSensitive);
        final matches = regExp.allMatches(this);
        return matches
            .map((match) => substring(match.start, match.end))
            .toSet()
            .toList();
      } on Exception {
        return [];
      }
    }
    return [];
  }

  /// Clean the string from given [List] words.
  ///
  /// returns clean [String] if the string contains given [List] words.
  ///
  /// returns same [String] if the string does not contain given [List] words.
  ///
  /// returns empty [String] if the string is empty.
  ///
  /// caseSensitive is defaulted to false.
  ///
  /// obscuringCharacter is defaulted to '*'.
  ///
  /// keepFirstLastLetters is defaulted to [true].
  ///
  /// ```dart
  /// "hi there, i love flutter.".cleanWords(["hi", "there","flutter" ]) // returns "**, t***e, i love F*****r."
  /// "i love Flutter.".cleanWords(["hi", "there","flutter"], caseSensitive: true) // returns "i love Flutter."
  /// "i love Flutter.".cleanWords(["hi", "there","flutter"], obscuringCharacter: '#') // returns "i love F#####r."
  /// "i love Flutter.".cleanWords(["hi", "there","flutter"], keepFirstLastLetters: false) // returns "i love *******."
  /// ```

  String cleanWords(
    List<String> words, {
    bool caseSensitive = false,
    String obscuringCharacter = '*',
    bool keepFirstLastLetters = true,
  }) {
    if (isNotEmpty) {
      try {
        final regExp = wordsRegExp(words, caseSensitive: caseSensitive);
        final result = replaceAllMapped(regExp, (match) {
          final length = match.end - match.start;
          if (length >= 3 && keepFirstLastLetters) {
            final matchedString = substring(match.start, match.end);
            final cleaned = matchedString.split('').first +
                obscuringCharacter * (length - 2) +
                matchedString.split('').last;
            return cleaned;
          }
          return obscuringCharacter * length;
        });
        return result;
      } on Exception {
        return this;
      }
    }
    return this;
  }

  /// Checks if the string contains [hashtag].
  ///
  /// returns true if the string contains [hashtag].
  ///
  /// returns false if the string does not contain [hashtag].
  ///
  /// returns false if the string is empty.
  ///
  /// customRegExp is your own custom RegExp.
  ///
  /// ```dart
  /// "hi there, i love #flutter.".containsHashtag() // returns true
  /// "i love #Flutter.".containsHashtag() // returns true
  /// "i love Flutter.".containsHashtag() // returns false
  /// ```

  bool containsHashtag({
    RegExp? customRegExp,
  }) {
    if (isNotEmpty) {
      try {
        final regExp = customRegExp ?? hashtagRegExp;
        return regExp.hasMatch(this);
      } on Exception {
        return false;
      }
    }
    return false;
  }

  /// Get the [List<String>] of [hashtag] from the string.
  ///
  /// returns [List<String>] if the string contains [hashtag].
  ///
  /// returns empty [List<String>] if the string does not contain [hashtag].
  ///
  /// returns empty [List<String>] if the string is empty.
  ///
  /// customRegExp is your own custom RegExp.
  ///
  /// ```dart
  /// "hi there, i love #flutter.".getHashtags() // returns ["flutter"]
  /// "i love #Flutter.".getHashtags() // returns ["Flutter"]
  /// "i love Flutter.".getHashtags() // returns []
  /// ```

  List<String> getHashtags({
    RegExp? customRegExp,
  }) {
    if (isNotEmpty) {
      try {
        final regExp = customRegExp ?? hashtagRegExp;
        final result = regExp
            .allMatches(this)
            .map((match) {
              return substring(match.start + 1, match.end);
            })
            .toSet()
            .toList();
        return result;
      } on Exception {
        return [];
      }
    }
    return [];
  }

  /// Checks if the string contains [mention].
  ///
  /// returns true if the string contains [mention].
  ///
  /// returns false if the string does not contain [mention].
  ///
  /// returns false if the string is empty.
  ///
  /// customRegExp is your own custom RegExp.
  ///
  /// ```dart
  /// "hi there, i love @flutter.".containsMention() // returns true
  /// "i love @Flutter.".containsMention() // returns true
  /// "i love Flutter.".containsMention() // returns false
  /// ```

  bool containsMention({
    RegExp? customRegExp,
  }) {
    if (isNotEmpty) {
      try {
        final regExp = customRegExp ?? mentionRegExp;
        return regExp.hasMatch(this);
      } on Exception {
        return false;
      }
    }
    return false;
  }

  /// Get the [List<String>] of [mention] from the string.
  ///
  /// returns [List<String>] if the string contains [mention].
  ///
  /// returns empty [List<String>] if the string does not contain [mention].
  ///
  /// returns empty [List<String>] if the string is empty.
  ///
  /// customRegExp is your own custom RegExp.
  ///
  /// ```dart
  /// "hi there, i love @flutter.".getMentions() // returns ["flutter"]
  /// "i love @Flutter.".getMentions() // returns ["Flutter"]
  /// "i love Flutter.".getMentions() // returns []
  /// ```

  List<String> getMentions({
    RegExp? customRegExp,
  }) {
    if (isNotEmpty) {
      try {
        final regExp = customRegExp ?? mentionRegExp;
        final result = regExp
            .allMatches(this)
            .map((match) {
              return substring(match.start + 1, match.end);
            })
            .toSet()
            .toList();
        return result;
      } on Exception {
        return [];
      }
    }
    return [];
  }
}

/// extension on nullable [String].
extension NullableStringExtension on String? {
  /// returns empty [String] if the string is null.
  /// ```dart
  /// String? name = null;
  /// name.notNullValue; // returns "";
  /// ```
  String get notNullValue => this ?? '';

  /// Checks if the string contains any of bad-word/profane-word(s).
  ///
  /// returns true if the string contains any of bad-word/profane-word(s).
  ///
  /// returns false if the string does not contain any of bad-word/profane-word(s).
  ///
  /// returns false if the string is empty.
  ///
  /// ```dart
  /// 'I am CEO, Bitch'.containsBadWords(); // returns true
  /// ```
  bool containsBadWord() => notNullValue.containsBadWord();

  /// Clean the string from any bad-word/profane-word(s).
  ///
  /// returns clean [String] if the string contains any bad-word/profane-word(s).
  /// all bad-words are removed and replaced with [String] obscuringCharacter.
  ///
  /// returns same [String] if the string does not contain any bad-word/profane-word(s).
  ///
  /// obscuringCharacter is defaulted to '*'.
  ///
  /// keepFirstLastLetters is defaulted to [true].
  /// If [keepFirstLastLetters] is set to [false], first and last letter of the string also will be replaced with [String] obscuringCharacter.
  ///
  /// ```dart
  /// 'I am CEO, Bitch'.cleanBadWords() // returns 'I am CEO, B***t'.
  ///
  /// 'I am CEO, Bitch'.cleanBadWords(keepFirstLastLetters: false) // returns 'I am CEO, *****'.
  ///
  /// 'I am CEO, Bitch'.cleanBadWords(obscuringCharacter: '@') // returns 'I am CEO, B@@@h'.
  /// ```

  String cleanBadWords(
          {String obscuringCharacter = '*',
          bool keepFirstLastLetters = true}) =>
      notNullValue.cleanBadWords(
        obscuringCharacter: obscuringCharacter,
        keepFirstLastLetters: keepFirstLastLetters,
      );

  /// Get all bad-words/profane-word(s) from the string.
  ///
  /// returns [List] if the string contains any bad-word/profane-word(s).
  ///
  /// returns empty [List] if the string does not contain any bad-word/profane-word(s).
  ///
  /// returns empty [List] if the string is empty.
  ///
  /// ```dart
  /// 'I am CEO, Bitch'.getBadWords() // returns ['Bitch']
  /// ```

  List<String> getBadWords() => notNullValue.getBadWords();

  /// Checks if the string contains [url]/[uri].
  ///
  /// returns true if the string contains [url]/[uri].
  ///
  /// returns false if the string does not contain [url]/[uri].
  ///
  /// returns false if the string is empty.
  ///
  /// customRegExp is your own custom RegExp.
  ///
  /// ```dart
  /// 'Please visit our website : https://betterx.io/'.containsUrl() // returns true
  /// ```

  bool containsUrl({RegExp? customRegExp}) =>
      notNullValue.containsUrl(customRegExp: customRegExp);

  /// Get all [List] of [url]/[uri] [String]s from the string.
  ///
  /// returns [List] if the string contains [url]/[uri].
  ///
  /// returns empty [List] if the string does not contain [url]/[uri].
  ///
  /// returns empty [List] if the string is empty.
  ///
  /// customRegExp is your own custom RegExp.
  ///
  /// ```dart
  /// 'Please visit our website : https://betterx.io/'.getUrls() // returns ['https://betterx.io/']
  /// ```

  List<String> getUrls({
    RegExp? customRegExp,
  }) =>
      notNullValue.getUrls(customRegExp: customRegExp);

  /// Checks if the string contains [email].
  ///
  /// returns true if the string contains [email].
  ///
  /// returns false if the string does not contain [email].
  ///
  /// returns false if the string is empty.
  ///
  /// customRegExp is your own custom RegExp.
  ///
  /// ```dart
  /// "BetterX.io : Let's build something Better, User-centered & beautiful together\n for more info contact us at : info@betterx.io".containsEmail() // returns false
  /// ```

  bool containsEmail({
    RegExp? customRegExp,
  }) =>
      notNullValue.containsEmail(customRegExp: customRegExp);

  /// Get [List] of all [email] from the string.
  ///
  /// returns [List] if the string contains [email].
  ///
  /// returns empty [List] if the string does not contain [email].
  ///
  /// returns empty [List] if the string is empty.
  ///
  /// customRegExp is your own custom RegExp.
  ///
  /// ```dart
  /// "BetterX.io : Let's build something Better, User-centered & beautiful together\n for more info contact us at : info@betterx.io".getEmails() // returns ['betterx.io']
  /// ```

  List<String> getEmails({
    RegExp? customRegExp,
  }) =>
      notNullValue.getEmails(customRegExp: customRegExp);

  /// hide [email] from the string.
  ///
  /// returns [String] if the string contains [email].
  ///
  /// returns [String] if the string does not contain [email].
  ///
  /// returns [String] if the string is empty.
  ///
  /// obscuringCharacter is defaulted to '*'.
  ///
  /// customRegExp is your own custom RegExp.
  ///
  /// ```dart
  /// "BetterX.io : Let's build something Better, User-centered & beautiful together\n for more info contact us at : info@
  /// betterx.io".hideEmails() // returns "BetterX.io : Let's build something Better, User-centered & beautiful together\n for more info contact us at : in**@betterx.io
  /// ```

  String hideEmails({String obscuringCharacter = '*', RegExp? customRegExp}) =>
      notNullValue.hideEmails(
        obscuringCharacter: obscuringCharacter,
        customRegExp: customRegExp,
      );

  /// Checks if the string contains [phone].
  ///
  /// phone number will be 10 digits without country code.
  ///
  /// returns true if the string contains [phone].
  ///
  /// returns false if the string does not contain [phone].
  ///
  /// returns false if the string is empty.
  ///
  /// customRegExp is your own custom RegExp.
  ///
  /// ```dart
  /// "BetterX.io : Let's build something Better, User-centered & beautiful together\n for more info contact us at : 91-9000000001".containsPhoneNumber() // returns true
  /// ```

  bool containsPhoneNumber({
    RegExp? customRegExp,
  }) =>
      notNullValue.containsPhoneNumber(customRegExp: customRegExp);

  /// Get [List] of all [phone] from the string.
  ///
  /// phone number will be 10 digits without country code.
  ///
  /// returns [List] if the string contains [phone].
  ///
  /// returns empty [List] if the string does not contain [phone].
  ///
  /// returns empty [List] if the string is empty.
  ///
  /// customRegExp is your own custom RegExp.
  /// ```dart
  /// "BetterX.io : Let's build something Better, User-centered & beautiful together\n for more info contact us at : 91-9000000001".getPhoneNumbers() // returns ['9000000001']
  /// ```

  List<String> getPhoneNumbers({
    RegExp? customRegExp,
  }) =>
      notNullValue.getPhoneNumbers(customRegExp: customRegExp);

  /// hide [phone] from the string.
  ///
  /// phone number will be 10 digits without country code.
  ///
  /// returns [String] if the string contains [phone].
  ///
  /// returns [String] if the string does not contain [phone].
  ///
  /// returns [String] if the string is empty.
  ///
  /// obscuringCharacter is defaulted to '*'.
  ///
  /// showFirstLastTwoDigits is defaulted to true.

  /// ```dart
  /// "91-9000000001".hidePhoneNumbers() // returns "91-00******00"
  /// "91-9000000001".hidePhoneNumbers(showFirstLastTwoDigits: false) // returns "91-********"
  /// "91-9000000001".hidePhoneNumbers(obscuringCharacter: '#') // returns "91-84######00"
  /// ```
  String hidePhoneNumbers({
    String obscuringCharacter = '*',
    bool showFirstLastTwoDigits = true,
    RegExp? customRegExp,
  }) =>
      notNullValue.hidePhoneNumbers(
        obscuringCharacter: obscuringCharacter,
        showFirstLastTwoDigits: showFirstLastTwoDigits,
        customRegExp: customRegExp,
      );

  /// Checks if the string contains given [List] words.
  ///
  /// returns true if the string contains given [List] words.
  ///
  /// returns false if the string does not contain given [List] words.
  ///
  /// returns false if the string is empty.
  ///
  /// caseSensitive is defaulted to false.
  ///
  /// customRegExp is your own custom RegExp.
  ///
  /// ```dart
  /// "hi there, i love flutter.".containsWords(["hi", "there","flutter" ]) // returns true
  /// "i love Flutter.".containsWords(["hi", "there","flutter"], caseSensitive: true) // returns false
  /// ```

  bool containsWords(List<String> words, {bool caseSensitive = false}) =>
      notNullValue.containsWords(words, caseSensitive: caseSensitive);

  /// Get [List] of all [words] from the string.
  ///
  /// returns [List] if the string contains given [List] words.
  ///
  /// returns empty [List] if the string does not contain given [List] words.
  ///
  /// returns empty [List] if the string is empty.
  ///
  /// caseSensitive is defaulted to false.
  ///
  /// customRegExp is your own custom RegExp.
  ///
  /// ```dart
  /// "hi there, i love flutter.".getWords(["hi", "there","flutter" ]) // returns ['hi', 'there', 'flutter']
  /// "i love Flutter.".getWords(["hi", "there","flutter"], caseSensitive: true) // returns []
  /// ```

  List<String> getWords(
    List<String> words, {
    bool caseSensitive = false,
  }) =>
      notNullValue.getWords(words, caseSensitive: caseSensitive);

  /// Clean the string from given [List] words.
  ///
  /// returns clean [String] if the string contains given [List] words.
  ///
  /// returns same [String] if the string does not contain given [List] words.
  ///
  /// returns empty [String] if the string is empty.
  ///
  /// caseSensitive is defaulted to false.
  ///
  /// obscuringCharacter is defaulted to '*'.
  ///
  /// keepFirstLastLetters is defaulted to [true].
  ///
  /// ```dart
  /// "hi there, i love flutter.".cleanWords(["hi", "there","flutter" ]) // returns "**, t***e, i love F*****r."
  /// "i love Flutter.".cleanWords(["hi", "there","flutter"], caseSensitive: true) // returns "i love Flutter."
  /// "i love Flutter.".cleanWords(["hi", "there","flutter"], obscuringCharacter: '#') // returns "i love F#####r."
  /// "i love Flutter.".cleanWords(["hi", "there","flutter"], keepFirstLastLetters: false) // returns "i love *******."
  /// ```

  String cleanWords(
    List<String> words, {
    bool caseSensitive = false,
    String obscuringCharacter = '*',
    bool keepFirstLastLetters = true,
  }) =>
      notNullValue.cleanWords(
        words,
        caseSensitive: caseSensitive,
        obscuringCharacter: obscuringCharacter,
        keepFirstLastLetters: keepFirstLastLetters,
      );

  /// Checks if the string contains [hashtag].
  ///
  /// returns true if the string contains [hashtag].
  ///
  /// returns false if the string does not contain [hashtag].
  ///
  /// returns false if the string is empty.
  ///
  /// customRegExp is your own custom RegExp.
  ///
  /// ```dart
  /// "hi there, i love #flutter.".containsHashtag() // returns true
  /// "i love #Flutter.".containsHashtag() // returns true
  /// "i love Flutter.".containsHashtag() // returns false
  /// ```

  bool containsHashtag({
    RegExp? customRegExp,
  }) =>
      notNullValue.containsHashtag(customRegExp: customRegExp);

  /// Get the [List<String>] of [hashtag] from the string.
  ///
  /// returns [List<String>] if the string contains [hashtag].
  ///
  /// returns empty [List<String>] if the string does not contain [hashtag].
  ///
  /// returns empty [List<String>] if the string is empty.
  ///
  /// customRegExp is your own custom RegExp.
  ///
  /// ```dart
  /// "hi there, i love #flutter.".getHashtags() // returns ["flutter"]
  /// "i love #Flutter.".getHashtags() // returns ["Flutter"]
  /// "i love Flutter.".getHashtags() // returns []
  /// ```

  List<String> getHashtags({
    RegExp? customRegExp,
  }) =>
      notNullValue.getHashtags(customRegExp: customRegExp);

  /// Checks if the string contains [mention].
  ///
  /// returns true if the string contains [mention].
  ///
  /// returns false if the string does not contain [mention].
  ///
  /// returns false if the string is empty.
  ///
  /// customRegExp is your own custom RegExp.
  ///
  /// ```dart
  /// "hi there, i love @flutter.".containsMention() // returns true
  /// "i love @Flutter.".containsMention() // returns true
  /// "i love Flutter.".containsMention() // returns false
  /// ```

  bool containsMention({
    RegExp? customRegExp,
  }) =>
      notNullValue.containsHashtag(customRegExp: customRegExp);

  /// Get the [List<String>] of [mention] from the string.
  ///
  /// returns [List<String>] if the string contains [mention].
  ///
  /// returns empty [List<String>] if the string does not contain [mention].
  ///
  /// returns empty [List<String>] if the string is empty.
  ///
  /// customRegExp is your own custom RegExp.
  ///
  /// ```dart
  /// "hi there, i love @flutter.".getMentions() // returns ["flutter"]
  /// "i love @Flutter.".getMentions() // returns ["Flutter"]
  /// "i love Flutter.".getMentions() // returns []
  /// ```

  List<String> getMentions({
    RegExp? customRegExp,
  }) =>
      notNullValue.getHashtags(customRegExp: customRegExp);
}
