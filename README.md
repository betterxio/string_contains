# string_contains

[![pub package](https://img.shields.io/pub/v/string_contains?style=flat)](https://pub.dev/packages/string_contains)
[![Score](https://img.shields.io/pub/points/string_contains?label=Score&logo=dart)](https://pub.dartlang.org/packages/string_contains/score)
[![Platform](https://img.shields.io/badge/Platform-Android%20|%20iOS%20|%20Web%20|%20macOS%20|%20Windows%20|%20Linux%20-blue.svg?logo=flutter)](https://pub.dartlang.org/packages/string_contains)
[![GitHub issues](https://img.shields.io/github/issues/betterxio/string_contains?style=flat)](https://pub.dev/packages/string_contains)
[![GitHub license](https://img.shields.io/github/license/betterxio/string_contains?style=flat)](https://pub.dev/packages/string_contains)

Package provides light widgets[for Linkify, Clean] and string scanner extensions on a string to check it contains bad words/urls/links/emails/phone numbers/#hashtags/@mentions etc.

# Installing

### 1. Depend on it

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  string_contains: ^2.4.0
```

### 2. Install it

You can install packages from the command line:

with `pub`:

```
$ dart pub add string_contains
```

with `Flutter`:

```
$ flutter pub add string_contains
```

### 3. Import it

Now in your `Flutter` code, you can use:

```dart
import 'package:string_contains/string_contains.dart';
```

# Getting Started

Import the library.

```dart
import 'package:string_contains/string_contains.dart';
```

You can use the extension methods on String and Nullable String.

```dart
final String? nullableString = "International phone number +91-9000000001. others 123-456-7890 and (123)-456-7890.";
print(nullableString.containsPhoneNumber()); // returns true
print(nullableString.getPhoneNumbers()); // returns ['+91-9000000001', '123-456-7890', '(123)-456-7890']
```

# Example

```dart
import 'package:string_contains/string_contains.dart';
```

```dart
 'I am CEO, Bitch'.containsBadWords(); // returns true

 'I am CEO, Bitch'.cleanBadWords() // returns 'I am CEO, B***t'.

 'I am CEO, Bitch'.cleanBadWords(keepFirstLastLetters: false) // returns 'I am CEO, *****'.

 'I am CEO, Bitch'.cleanBadWords(obscuringCharacter: '@') // returns 'I am CEO, B@@@h'.

 'I am CEO, Bitch'.getBadWords() // returns ['Bitch']

 'Please visit our website : https://betterx.io/'.containsUrl() // returns true

 'Please visit our website : https://betterx.io/'.getUrls() // returns ['https://betterx.io/']

 "BetterX.io : Let's build something Better, User-centered & beautiful together\n for more info contact us at : info@betterx.io".containsEmail() // returns true

 "BetterX.io : Let's build something Better, User-centered & beautiful together\n for more info contact us at : info@betterx.io".getEmails() // returns ['betterx.io']

 "BetterX.io : Let's build something Better, User-centered & beautiful together\n for more info contact us at : info@betterx.io".hideEmails() // returns "BetterX.io : Let's build something Better, User-centered & beautiful together\n for more info contact us at : in**@betterx.io

```

```dart
"hi there, i love flutter.".containsWords(["hi", "there","flutter" ]) // returns true
"i love Flutter.".containsWords(["hi", "there","flutter"], caseSensitive: true) // returns false
```

```dart
"hi there, i love flutter.".cleanWords(["hi", "there","flutter" ]) // returns "**, t***e, i love F*****r."
"i love Flutter.".cleanWords(["hi", "there","flutter"], caseSensitive: true) // returns "i love Flutter."
"i love Flutter.".cleanWords(["hi", "there","flutter"], obscuringCharacter: '#') // returns "i love F#####r."
"i love Flutter.".cleanWords(["hi", "there","flutter"], keepFirstLastLetters: false) // returns "i love *******."
```

StringContainsWidget highlights the url, email, phone number, hashtag, mention and highLightWords. it provides onTap callback for each element of type StringContainsElementType.
StringContainsWidget is a widget that displays a string that contains a certain StringContainsElementTypes.

```dart
  StringContainsWidget(
                source:
                    '''I am CEO, Bitch Please visit our website : https://betterx.io/. Please visit our website : https://betterx.io/ and you can search for any thing on google : google.com, I love Dart : https://dart.dev/, you can practice on : https://dartpad.dev/. Flutter uses Dart, you can create your own app with Flutter : https://flutter.dev/, this is a good example of Flutter : https://flutter.dev/docs/get-started/. BetterX.io : Let's build something Better, User-centered & beautiful together for more info contact us at : info@betterx.io. My Personal Email : ravikumar2710999@gmail.com. A fake email : gedoye9446@roxoas.com. My Phone Number : +91-9000000001. I love Dart and Flutter I love #dart and #flutter. @flutter is #awesome''',
                onTap: (url) {
                  print('element is a ${url.value} and type of ${url.type}');
                  if (url.type == StringContainsElementType.words) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${url.value} is awesome!!',
                        ),
                        duration: const Duration(seconds: 2),
                        dismissDirection: DismissDirection.horizontal,
                      ),
                    );
                  }
                },
                highLightWords: const [
                  'Flutter',
                  'Dart',
                ],
                highlightWordsStyle: const TextStyle(
                  color: Colors.red,
                ),
                types: const [
                  StringContainsElementType.email,
                  StringContainsElementType.url,
                  StringContainsElementType.phoneNumber,
                  StringContainsElementType.hashtag,
                  StringContainsElementType.mention,
                  StringContainsElementType.words,
                ],
),
```

<p>
    <img src="https://raw.githubusercontent.com/betterxio/string_contains/main/assets/string-contains-widget.png" width="240px" height="auto" hspace="20"/>
<p>

CleanWidget
it used to clean up bad-words/hide emails/hide phoneNumbers/partially or fully hide extra words from the source string. return a clean Text widget.

```dart
CleanWidget(
            source:
                      '''I am CEO, Bitch Please visit our website : https://betterx.io/. Please visit our website : https://betterx.io/ and you can search for any thing on google : google.com, I love Dart : https://dart.dev/, you can practice on : https://dartpad.dev/. Flutter uses Dart, you can create your own app with Flutter : https://flutter.dev/, this is a good example of Flutter : https://flutter.dev/docs/get-started/. BetterX.io : Let's build something Better, User-centered & beautiful together for more info contact us at : info@betterx.io. My Personal Email : ravikumar2710999@gmail.com. A fake email : gedoye9446@roxoas.com. My Phone Number : +91-9000000001 I love Dart and Flutter I love #dart and #flutter. @flutter is #awesome''',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Theme.of(context).primaryColorDark,
                ),
),
```

</p>
    <img src="https://raw.githubusercontent.com/betterxio/string_contains/main/assets/clean-widget.png" width="240px" height="auto" hspace="20"/>
</p>

## Maintainers

### [Ravi Kovind](https://ravikovind.github.io/)

# Disclaimer

This library is not a replacement for human review of potentially offensive content. The purpose of this library is to help surface potentially offensive content to human reviewers. It is not a perfect solution for identifying potentially offensive content.

# Issues and feedback

Open to `suggestions` and `contributions`.
Please file [issues](https://github.com/betterxio/string_contains/issues) to send feedback or report a bug.
Thank you!
