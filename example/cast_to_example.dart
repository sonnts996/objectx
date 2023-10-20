// ignore_for_file: omit_local_variable_types

/*
 Created by Thanh Son on 20/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:objectx/objectx.dart';

class A {
  const A(this.value);

  final String value;
}

class B extends A {
  const B(super.value, this.number);

  final int number;
}

void foo(A a) {
  int? value;
  // Method 1:
  value = a is B ? a.number : null;
  // With castTo:
  value = a.castTo<B?>()?.number; // returns null if can not cast a to B
}
