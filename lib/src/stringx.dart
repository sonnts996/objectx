/*
 Created by Thanh Son on 20/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import '../objectx.dart';

/// Parse String to num, int, double, and bool
/// Return null if can not parse
extension StringReader on String {
  /// Convert this String to num value, and return [defaultValue] if an error happen
  num? toNum([num? defaultValue]) => this.let(num.tryParse) ?? defaultValue;

  /// Convert this String to int value, and return [defaultValue] if an error happen.
  /// int.tryParse only converts int value, if the value is double (example: 3.14), it will return null;
  int? toInt([int? defaultValue, int? radix]) =>
      this.let((it) => int.tryParse(it, radix: radix)) ?? defaultValue;

  /// Convert this String to double value, and return [defaultValue] if an error happen.
  double? toDouble([double? defaultValue]) =>
      this.let(double.tryParse) ?? defaultValue;

  /// Convert this String to bool value
  /// If the value is 'true', return true, if the value is 'false', return false; otherwise, return null.
  /// If [ignoreCase] is true, the text case is not considered.
  bool? toBool({bool ignoreCase = false}) => this.let((it) {
        final finalIt = ignoreCase ? it.toLowerCase() : it;
        if (finalIt case 'true') {
          return true;
        } else if (finalIt case 'false') {
          return false;
        }
        return null;
      });

  /// return the char at the index of the string, throw an error if the index is out of string length.
  String operator [](int index) => substring(index, index + 1);

  /// The first letter after the [pattern] (skip space) will be returned. If the resulting length is larger [max]. The number of the letter returned is [max].
  String firstLetter({int max = -1, String pattern = ' '}) {
    final list = split(pattern);
    String getFirst(String e) => e.isNotEmpty ? e.trim()[0] : '';
    if (max < 0) {
      return list.map(getFirst).join();
    }
    return max < list.length
        ? list.sublist(0, max + 1).map(getFirst).join()
        : list.map(getFirst).join();
  }
}
