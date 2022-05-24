# string_contains

Extension on String that provides a methods to check, if a string contains specific words/phrases/Regex/etc.

# Installing

### 1. Depend on it

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  string_contains: 0.0.1
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