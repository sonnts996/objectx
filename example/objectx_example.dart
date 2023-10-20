// ignore_for_file: avoid_init_to_null, omit_local_variable_types, prefer_if_null_operators

import 'package:objectx/objectx.dart';

void main() {
  String? a = null;

  final b = a
      ?.let((it) => it); // [it] is not null, type of [it] is String (without ?)

  // Cause [int.tryParse] require a non-null variable.
  // The [number] is null if [a] is null or cannot parse to int. Otherwise, number is result of int.tryParse
  int? number = a?.let(int.tryParse);
  // Similar
  int? number2 = a != null ? int.tryParse(a) : null;

  // Like a?.let, letOrNull has a closure when the value is null.
  // if a is null, the closure ()=> 0 will be executed
  // Otherwise, (it) => int.tryParse(it) ?? 0 will be executed. [it] is not null
  int number3 = a.letOrNull((it) => int.tryParse(it) ?? 0, onNull: () => 0);

  // print a to terminal with a tag ('$tag: $a'), if debugMode is false, it is not effect.
  a.print(tag: 'A value:', debugMode: true);
}
