import 'package:string_contains/src/utils/constants.dart';

/// [StringContainsElement] is used to check if a string contains
/// a certain [StringContainsElementType].

class StringContainsElement {
  /// [type] is the [StringContainsElementType] to be used for the [StringContainsElement].
  StringContainsElementType type;

  /// [value] is the [String] to be used for getting the value of element.
  String value;
  StringContainsElement(
    this.type,
    this.value,
  );
}
