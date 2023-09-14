/*
 Created by Thanh Son on 10/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import '../objectx.dart';

/// Parse object to bool with Javascript Boolean condition
extension Object2Bool on Object? {

  /// object.jsBool() return the value like Boolean(object) in javascript;
  /// It's false if the object is 0, '' (empty string), false, or NaN. Otherwise, return true
  /// See: https://www.w3schools.com/js/js_booleans.asp
  bool jsBool() =>
      this?.let((it) {
        if (it case 0 || '' || false) {
          return false;
        } else if (it is double && it.isNaN) {
          return false;
        } else {
          return true;
        }
      }) ??
      false;
}

/// Parse String to num, int, double, and bool
/// Return null if can not parse
extension StringReader on String {

  /// Convert this String to num value, and return [defaultValue] if an error happen
  num? toNum([num? defaultValue]) =>
      this.let(num.tryParse) ?? defaultValue;

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

/// Get the value in map
extension MapReader<K, V> on Map<K, V> {

  /// Return the value of [key] in the map if the value type is R. Otherwise, return defaultValue.
  R? read<R extends V>(K key, [R? defaultValue]) {
    final value = this[key];
    return (value is R) ? value : defaultValue;
  }
}


