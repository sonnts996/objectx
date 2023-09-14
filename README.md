`this is in develop`

## Features

Extension for Dart's Object: 

    - Basic object's extension:
        - let
        - letOrNull
        - print
    - String extensions:
        - toInt
        - toDouble
        - toBool
        - index getter
        - firstLetter  
    - Map extensions:
        - read
    - Object extensions:
        - jsBool

## Getting started

```yaml
    dependencies:
        objectx: 'any'
```

## Usage

For all extensions:

```dart
    import 'package:objectx/objectx.dart';
```

For object's basic extensions:

```dart
    import 'package:objectx/objectx_base.dart';
```

For object's reader extensions:

```dart
    import 'package:objectx/objectx_reader.dart';
```

### ObjectX

```dart 
    String? a = null;

    final b = a?.let((it) => it);   // it is not null, type of it is String (without ?)

    // Cause [int.tryParse] require a non-null variable. 
    // The [number] is null if [a] is null or cannot parse to int. Otherwise, number is result of int.tryParse
    int? number = a?.let(int.tryParse);
    // Similar 
    int? number2 =  a != null ? int.tryParse(a) : null;

    // Like a?.let, letOrNull has a closure when the value is null.
    // if a is null, the closure ()=> 0 will be executed
    // Otherwise, (it) => int.tryParse(it) ?? 0 will be executed. [it] is not null
    int number3 = a.letOrNull((it) => int.tryParse(it) ?? 0, () => 0);

```

Print object:

```dart
    // print a to terminal with a tag ('$tag: $a'), if debugMode is false, it is not effect.
    a.print(tag: 'A value:', debugMode: kDebugMode);
```

### Object's reader

```dart
    Object object = Something();

    // object.jsBool() return the value like Boolean(object) in javascript;
    // It's false if the object is 0, '' (empty string), false, or NaN. Otherwise, return true
    // See: https://www.w3schools.com/js/js_booleans.asp
    final bool a = object.jsBool();
```

String reader

```dart
    test('String reader value', () {
        String a = '3.14';

        expect(a.toNum(), 3.14);
        expect(a.toInt(), null); // cause int.tryParse('3.14') = null
        expect(a.toDouble(), 3.14);
        expect(a.toBool(), null);
    },);
```

```dart
    final String a = 'Hello World';
    final first = a[0]; // 'H'
    final firstLetter = a.firstLetter(); // 'HW', split by space
```

## Features and bugs 

Please file feature requests and bugs at the [issue tracker](https://github.com/sonnts996/objectx/issues).