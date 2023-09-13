// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_expression_function_bodies, avoid_init_to_null

/*
 Created by Thanh Son on 10/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:objectx/objectx.dart';
import 'package:objectx/src/_internal.dart';
import 'package:test/test.dart';

void main() {
  group('Object Let', () {
    test('Nullable variable', () {
      String? a = null;
      expect(a.let((it) => '$it\n'), 'null\n');
      expect(a?.let((it) => '$it\n'), null);

      expect(a.letOrNull((it) => it, () => ''), '');
      expect(a.letOrNull((it) => it, () => '').isNullable, false);
      expect(a.letOrNull((it) => it, () => null).isNullable, true);

      a = 'Hello World';
      a.length;
      expect(a.let((it) => '$it\n'), 'Hello World\n');
      expect(a.letOrNull((it) => it, () => ''), 'Hello World');
    });

    test('IDE validator', () {
      String? foo1(String? a) => a.let((it) {
            // return 'Hello ' + it; // IDE error highlight
            return 'Hello ' +
                it!; // will throw [Null check operator used on a null value] if a is null;
          });

      String? foo2(String? a) => a?.let((it) {
            return 'Hello ' + it; // IDE allow this code
          });

      expect(foo1('World'), 'Hello World');
      expect(
          () => foo1(null),
          throwsA(predicate((p0) =>
              p0.toString() == 'Null check operator used on a null value')));
      expect(foo2('World'), 'Hello World');
      expect(foo2(null), null);
    });

    test('dynamic let', () {
      dynamic a = 'Hello World';
      expect(() => a.let((it) => it), throwsA((e) => e is NoSuchMethodError));
      expect(let(a, (it) => it), 'Hello World');
    });
  });
}
