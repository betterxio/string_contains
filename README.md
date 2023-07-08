# string_contains

[![pub package](https://img.shields.io/pub/v/string_contains?style=flat)](https://pub.dev/packages/string_contains)
[![GitHub issues](https://img.shields.io/github/issues/betterxio/string_contains?style=flat)](https://pub.dev/packages/string_contains)
[![GitHub license](https://img.shields.io/github/license/betterxio/string_contains?style=flat)](https://pub.dev/packages/string_contains)

Package provides light widgets [for Linkify, Clean] and extensions for strings and nullable strings that contain bad words/urls/links/emails/phone numbers/#hashtags/@mentions and others.

# Installing

### 1. Depend on it

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  string_contains: 1.5.0
```

### 2. Install it

You can install packages from the command line:

with `pub`:

```
$ pub get
```

with `Flutter`:

```
$ flutter pub get
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

# Maintainers

- [Ravi Kovind](https://ravikovind.github.io/)
