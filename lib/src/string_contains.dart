import 'utils/bad_words.dart';

/// ```dart
/// Extension on [String] that provides a methods to check, if a string contains specific words/phrases/Regex/etc.
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
        final regExp = RegExp(
          "\\b(?:${badWords.join('|')})\\b",
          caseSensitive: false,
          dotAll: true,
        );
        return regExp.hasMatch(this);
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
        final regExp = RegExp(
          "\\b(?:${badWords.join('|')})\\b",
          caseSensitive: false,
          dotAll: true,
        );
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
        final regExp = RegExp(
          "\\b(?:${badWords.join('|')})\\b",
          caseSensitive: false,
          dotAll: true,
        );
        final matched = regExp.allMatches(this);
        return matched
            .map((match) {
              return substring(match.start, match.end);
            })
            .toSet()
            .toList();
      } on Exception {
        return [];
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
  /// ```dart
  /// 'Please visit our website : https://betterx.io/'.containsUrl() // returns true
  /// ```

  bool containsUrl() {
    if (isNotEmpty) {
      final RegExp regExp = RegExp(
        r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+',
        caseSensitive: false,
        dotAll: true,
      );
      return regExp.hasMatch(this);
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
  /// ```dart
  /// 'Please visit our website : https://betterx.io/'.getUrls() // returns ['https://betterx.io/']
  /// ```

  List<String> getUrls() {
    if (isNotEmpty) {
      final RegExp regExp = RegExp(
        r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+',
        caseSensitive: false,
        dotAll: true,
      );
      final matches = regExp.allMatches(this);
      return matches
          .map((match) => substring(match.start, match.end))
          .toSet()
          .toList();
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
  /// ```dart
  /// "BetterX.io : Let's build something Better, User-centered & beautiful together\n for more info contact us at : info@betterx.io".containsEmail() // returns false
  /// ```

  bool containsEmail() {
    if (isNotEmpty) {
      final RegExp regExp = RegExp(
        r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}',
        caseSensitive: false,
        dotAll: true,
      );
      return regExp.hasMatch(this);
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
  /// ```dart
  /// "BetterX.io : Let's build something Better, User-centered & beautiful together\n for more info contact us at : info@betterx.io".getEmails() // returns ['betterx.io']
  /// ```

  List<String> getEmails() {
    if (isNotEmpty) {
      final RegExp regExp = RegExp(
        r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}',
        caseSensitive: false,
        dotAll: true,
      );
      final matches = regExp.allMatches(this);
      return matches
          .map((match) => substring(match.start, match.end))
          .toSet()
          .toList();
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
  /// ```dart
  /// "BetterX.io : Let's build something Better, User-centered & beautiful together\n for more info contact us at : info@
  /// betterx.io".hideEmails() // returns "BetterX.io : Let's build something Better, User-centered & beautiful together\n for more info contact us at : in**@betterx.io
  /// ```

  String hideEmails({String obscuringCharacter = '*'}) {
    if (isNotEmpty) {
      final RegExp regExp = RegExp(
        r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}',
        caseSensitive: false,
        dotAll: true,
      );
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
  /// ```dart
  /// "BetterX.io : Let's build something Better, User-centered & beautiful together\n for more info contact us at : 91-0000000000".containsPhoneNumber() // returns true
  /// ```

  bool containsPhoneNumber() {
    if (isNotEmpty) {
      final RegExp regExp = RegExp(
        r'[0-9]{10}',
        caseSensitive: false,
        dotAll: true,
      );
      return regExp.hasMatch(this);
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
  /// ```dart
  /// "BetterX.io : Let's build something Better, User-centered & beautiful together\n for more info contact us at : 91-0000000000".getPhoneNumbers() // returns ['0000000000']
  /// ```

  List<String> getPhoneNumbers() {
    if (isNotEmpty) {
      final RegExp regExp = RegExp(
        r'[0-9]{10}',
        caseSensitive: false,
        dotAll: true,
      );
      final matches = regExp.allMatches(this);
      return matches
          .map((match) => substring(match.start, match.end))
          .toSet()
          .toList();
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
  /// "91-0000000000".hidePhoneNumbers() // returns "91-00******00"
  /// "91-0000000000".hidePhoneNumbers(showFirstLastTwoDigits: false) // returns "91-********"
  /// "91-0000000000".hidePhoneNumbers(obscuringCharacter: '#') // returns "91-84######00"
  /// ```
  String hidePhoneNumbers({
    String obscuringCharacter = '*',
    bool showFirstLastTwoDigits = true,
  }) {
    if (isNotEmpty) {
      final RegExp regExp = RegExp(
        r'[0-9]{10}',
        caseSensitive: false,
        dotAll: true,
      );
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
  /// ```dart
  /// "hi there, i love flutter.".containsWords(["hi", "there","flutter" ]) // returns true
  /// "i love Flutter.".containsWords(["hi", "there","flutter"], caseSensitive: true) // returns false
  /// ```

  bool containsWords(List<String> words, {bool caseSensitive = false}) {
    if (isNotEmpty) {
      try {
        final regExp = RegExp(
          "\\b(?:${words.join('|')})\\b",
          caseSensitive: caseSensitive,
          dotAll: true,
        );
        return regExp.hasMatch(this);
      } on Exception {
        return false;
      }
    }
    return false;
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
      final regExp = RegExp(
        "\\b(?:${words.join('|')})\\b",
        caseSensitive: caseSensitive,
        dotAll: true,
      );
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
    }
    return this;
  }
}
