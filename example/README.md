# string_contains example

Extension on [String] that provides a methods to check, if a string contains specific words/phrases/Regex/etc.

# Installing

### 1. Depend on it

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  string_contains: ^2.3.0
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
```
