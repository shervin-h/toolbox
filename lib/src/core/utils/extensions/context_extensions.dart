import 'package:flutter/cupertino.dart';

/// ## [OnContext] Extension :
///
/// An extension on [BuildContext] that provides utility functions for working with the device context.
///
/// This extension includes a single function:
/// - [isTablet]: Determines whether the current device is a tablet based on its screen size.
///
extension OnContext on BuildContext {
  /// ## [isTablet] Function :
  ///
  /// Checks if the current device is a tablet based on its screen size.
  ///
  /// ### Returns:
  /// - `true` if the device is considered a tablet, meaning its shortest side is greater than 600 logical pixels.
  /// - `false` if the device is not considered a tablet.
  ///
  /// ### Example:
  /// ```dart
  /// bool isDeviceTablet = context.isTablet();
  /// if (isDeviceTablet) {
  ///   // Perform tablet-specific actions.
  /// } else {
  ///   // Perform actions for non-tablet devices.
  /// }
  /// ```
  bool isTablet() {
    if (MediaQuery.of(this).size.shortestSide > 600) {
      return true;
    }
    return false;
  }
}