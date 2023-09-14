/*
 Created by Thanh Son on 10/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:objectx/src/objectx_reader.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('String', () {
    test('Char', () {
      final text = 'Hello World';
      expect(text[0], 'H');
      expect(() => text[11], throwsRangeError);
    });

    test('First Letter', () {
      final text = 'Hello World';
      expect(text.firstLetter(), 'HW');
      expect(text.firstLetter(pattern: 'l'), 'Hod');
      expect(text.firstLetter(max: 2, pattern: 'l'), 'Ho');
      expect(text.firstLetter(max: 3, pattern: 'l'), 'Hod');
      expect(text.firstLetter(max: 4, pattern: 'l'), 'Hod');
    });

    test('map string', () {
      final map = <String, String?>{
        'a': 'Hello World',
        'b': 'true',
        'c': null,
        'd': '3.14',
      };
      expect(map.read('a'), 'Hello World');
      expect(map.read('b')?.toBool(), true);
      expect(map.read('c')?.toInt(), null);
      expect(map.read('d')?.toInt(1), 1);
      expect(map.read('d')?.toDouble(1), 3.14);
      expect(map.read('d')?.toNum()?.toInt(), 3);

    });

    test('String reader value', () {
      String a = '3.14';

      expect(a.toNum(), 3.14);
      expect(a.toInt(), null);
      expect(a.toDouble(), 3.14);
      expect(a.toBool(), null);
    },);
  });
}
