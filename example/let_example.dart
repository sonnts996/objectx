// ignore_for_file: prefer_expression_function_bodies, unnecessary_lambdas

/*
 Created by Thanh Son on 20/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:objectx/objectx.dart';

String foo(String a) {
  return 'Value is $a'..print();
}

String? boo() {
  return null;
}

void main() {
  String fooValue;
  // Method 1: create a local value.
  final value = boo();
  if (value != null) {
    fooValue = foo(value);
  } else {
    fooValue = '';
  }
  // Method 2: without creating local value, but will call the boo method multi times.
  fooValue = boo() != null ? foo(boo()!) : '';
  // With let: the boo value is called once, let provides that value and continues to process it.
  fooValue = boo()?.let((it) => foo(it)) ?? '';
  // Like let, but addition onNull function
  fooValue = boo().letOrNull((it) => foo(it), onNull: () => '');
}
