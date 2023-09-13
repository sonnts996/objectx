/*
 Created by Thanh Son on 10/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'dart:core' as core;

core.Null nullReturned(it) => null;

/// Create a closure for [value]
/// Call [p0] if value is null and p1 for otherwise.\
///
/// Example:
/// ```
/// letIF(a, (it) => print(it), () => print('null')); // if a is null, print to console 'null' message, otherwise, a value will be print
/// ```
///
R letOrNull<R, T>(
  T? value,
  R Function(T it) p0,
  R Function() onNull,
) =>
    (value != null) ? p0(value) : onNull();

/// Create a closure for [value]
///
/// Example:
/// ```
/// let(a, (it) => print(it)); // the function print(it) will be not execute if a is null
/// ```
///
R let<R, T>(T value, R Function(T it) p0) => p0(value);

/// Extension for any Object
/// Note: This extension is not work in [core.dynamic] type,
/// cast to [Object?] or somethings like that to use it.
//  See https://dart.dev/language/extension-methods#static-types-and-dynamic
extension ObjectLet<T extends core.Object?> on T {
  /// Create a closure with [T] parameter.
  ///
  /// Example:
  /// ```
  /// a?.let((it) => print(it)); // the function print(it) will be not execute if a is null
  /// ```
  ///
  /// Note: [let] is not work in [core.dynamic] type,
  /// cast to [Object?] or use [R let<R, T>(T value, R Function(T it) p1)] function.
  /// See https://dart.dev/language/extension-methods#static-types-and-dynamic
  R let<R>(R Function(T it) p0) => p0(this);
}

/// Extension for Nullable Object
/// Note: This extension is not work in [core.dynamic] type,
/// cast to [Object?] or somethings like that to use it.
//  See https://dart.dev/language/extension-methods#static-types-and-dynamic
extension ObjectLetOrNull<T extends core.Object> on T? {
  /// Note: [letOrNull] is not work in [core.dynamic] type,
  ///
  /// Example:
  /// ```
  /// letOrNull(a, (it) => print(it), () => print('null')); // if a is null, print to console 'null' message, otherwise, a value will be print
  /// ```
  ///
  /// cast to [Object?] or use [R letIf<R, T>(T? value, R Function() p0, R Function(T it) p1)] function.
  /// See https://dart.dev/language/extension-methods#static-types-and-dynamic
  R letOrNull<R>(
    R Function(T it) p0,
    R Function() onNull,
  ) =>
      (this != null) ? p0(this as T) : onNull();
}

/// Extension for Nullable Object
/// Note: This extension is not work in [core.dynamic] type,
/// cast to [Object?] or somethings like that to use it.
//  See https://dart.dev/language/extension-methods#static-types-and-dynamic
extension ObjectPrint<T extends core.Object?> on T {
  /// Print this object to console
  ///
  /// Note: [print] is not work in [core.dynamic] type,
  /// cast to [Object?] or use print(object) // dart:core > print.
  /// See https://dart.dev/language/extension-methods#static-types-and-dynamic
  void print({core.String? tag, core.bool debugMode = true}) {
    if (debugMode) {
      // ignore: avoid_print
      tag.letOrNull((it) => ('$tag: $this'), () => core.print(this));
    }
  }
}
