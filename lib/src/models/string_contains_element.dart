import 'package:string_contains/src/utils/constants.dart';

/// [StringContainsElement] is used to check if a string contains
/// a certain [StringContainsElementType].

class StringContainsElement {
  /// [type] is the [StringContainsElementType] to be used for the [StringContainsElement].
  StringContainsElementType type;

  /// [value] is the [String] to be used for getting the value of element.
  String value;

  // /// [startIndex] is the [int] to be used for getting the start index of element.
  // /// [startIndex] is used to get the start index of element.
  // int startIndex;

  // /// [endIndex] is the [int] to be used for getting the end index of element.
  // /// [endIndex] is used to get the end index of element.
  // int endIndex;

  /// [StringContainsElement] constructor.
  StringContainsElement(
    this.type,
    this.value,
    // this.startIndex,
    // this.endIndex,
  );
}
