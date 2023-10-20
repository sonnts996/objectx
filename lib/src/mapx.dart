/*
 Created by Thanh Son on 20/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/

/// Get the value in map
extension MapReader<K, V> on Map<K, V> {
  /// Return the value of [key] in the map if the value type is R. Otherwise, return defaultValue.
  R? read<R extends V>(K key, [R? defaultValue]) {
    final value = this[key];
    return (value is R) ? value : defaultValue;
  }
}
