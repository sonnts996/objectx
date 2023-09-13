/*
 Created by Thanh Son on 10/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import '../objectx.dart';

extension Object2Bool on Object? {
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

extension StringReader on String {
  num? toNum([num? defaultValue]) =>
      this.let(num.tryParse) ?? defaultValue;

  int? toInt([int? defaultValue, int? radix]) =>
      this.let((it) => int.tryParse(it, radix: radix)) ?? defaultValue;

  double? toDouble([double? defaultValue]) =>
      this.let(double.tryParse) ?? defaultValue;

  bool? toBool({bool ignoreCase = false}) => this.let((it) {
        final finalIt = ignoreCase ? it.toLowerCase() : it;
        if (finalIt case 'true') {
          return true;
        } else if (finalIt case 'false') {
          return false;
        }
        return null;
      });

  String operator [](int index) => substring(index, index + 1);

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

extension MapReader<K, V> on Map<K, V> {
  R? read<R extends V>(K key, [R? defaultValue]) {
    final value = this[key];
    return (value is R) ? value : defaultValue;
  }
}


