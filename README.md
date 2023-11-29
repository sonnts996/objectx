The utilities extension for Dart & Flutter object.

![version](https://img.shields.io/pub/v/objectx) ![license](https://img.shields.io/github/license/sonnts996/objectx)

## Getting started

```yaml
dependencies:
  objectx: '1.0.1+1'
```

## Usage

For all extensions:

```dart
import 'package:objectx/objectx.dart';
```

### · ``let`` extension on ``T`` (``T extends Object?``)

```dart
String foo(String a) {
  return 'Value is $a';
}

String? boo() {
  return null;
}

void main(){
  String fooValue;
  // Method 1: create a local value.
  final value = boo();
  if(value != null){
    fooValue = foo(value);
  }else{
    fooValue = '';
  }
  // Method 2: without creating local value, but will call the boo method multi times.
  fooValue = boo() != null ? foo(boo()!) : '';
  // With let: the boo value is called once, let provides that value and continues to process it.
  fooValue = boo()?.let(foo) ?? '';
}
```

### · ``letOrNull`` extension on ``T?`` (``T extends Object``)

```dart
  // Like let, but addition onNull function
  fooValue = boo().letOrNull((it) => foo(it), onNull: () => '');
```

### · ``print`` extension on ``Object?``

- print to console with tag > ``$tag: $object``

```dart
// Method 1:
String foo(String a) {
  final value = 'Value is $a';
  print(Value);
  return value;
}

// With objectx:
String foo(String a) {
  return 'Value is $a'..print();
}
```

### · ``castTo`` extension on ``T`` (``T extends Object?``)

```dart
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
```

### · ``firstLetter`` extension on ``String``

```dart
final String a = 'Hello World';
final first = a[0]; // 'H'
final firstLetter = a.firstLetter(); // 'HW', split by space
```

### · ``toNum`` extension on ``String``

```dart
String a = '3.14';
a.toNum();// 3.14;
a.toInt(); // null // cause int.tryParse('3.14') = null
a.toDouble(); // 3.14
a.toBool(); // null
```

### · ``limitIn`` extension on ``num``

```dart
// return value in the range [0, 1], 
// if the value is smaller than 0, the minimum value returns is 0,
// and otherwise, the maximum value is 1.
final finalValue = limitIn(0, value, 1);
```

### · ``read`` extension on ``Map<K, V>``

## Features and bugs

> [!Warning]
>
> Some extension is not work in [dynamic] type.<br/>
> Please cast to [Object?] or somethings like that to use it.<br/>
> See more https://dart.dev/language/extension-methods#static-types-and-dynamic

Please file feature requests and bugs at the [issue tracker](https://github.com/sonnts996/objectx/issues).