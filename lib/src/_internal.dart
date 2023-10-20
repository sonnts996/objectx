/*
 Created by Thanh Son on 10/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:meta/meta.dart';

@visibleForTesting
@isTest

/// Check whether a variable type can be null or not.
extension ObjectCheckNullable<T> on T {
  /// Check whether a variable type can be null or not.
  bool get isNullable => null is T;
}
