import 'package:flutter_test/flutter_test.dart';
import 'package:string_contains/string_contains.dart';

void main() {
  test('String is null or empty', () {
    String? str;
    String? str2 = '';
    String? str3 = 'Hello';
    expect(str.nullOrEmpty, true);
    expect(str2.nullOrEmpty, true);
    expect(str3.nullOrEmpty, false);
  });

  test('String contains email', () {
    String? str = 'Hello, my email is info@betterx.io';
    String? str2 = 'Hello, my email is xxxx@xxxxxxx';
    expect(str.containsEmail(), true);
    expect(str2.containsEmail(), false);
  });
}
