import 'package:flutter/cupertino.dart';

/// ## [OnContext] Extension :
///
/// An extension on [BuildContext] that provides utility functions for working with the device context.
///
/// This extension includes a single function:
/// - [isTablet] : Determines whether the current device is a tablet based on its screen size.
/// - [width] : width of current context
/// - [height] : height of current context
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

  /// ## Getter: `width`
  ///
  /// The `width` getter is used to obtain the width of the current device screen using the `MediaQuery` class. It provides a convenient way to access the screen width directly.
  ///
  /// ### Usage:
  ///
  /// You can use this getter to retrieve the screen width in your Flutter code by simply calling `width` on the context where it's available. For example:
  ///
  /// ```dart
  /// double screenWidth = context.width;
  /// ```
  ///
  /// ### Return Value:
  ///
  /// - A `double` representing the width of the device screen in logical pixels.
  ///
  /// ### Example:
  ///
  /// ```dart
  /// double screenWidth = context.width;
  /// print('Screen Width: $screenWidth');
  /// ```
  ///
  /// ### Use Case:
  ///
  /// Use the `width` getter when you need to determine the screen width for responsive layout design or when specifying the width of UI elements based on the screen size.
  double get width => MediaQuery.of(this).size.width;

  /// ## Getter: `height`
  ///
  /// The `height` getter is used to obtain the height of the current device screen using the `MediaQuery` class. It provides a convenient way to access the screen height directly.
  ///
  /// ### Usage:
  ///
  /// You can use this getter to retrieve the screen height in your Flutter code by simply calling `height` on the context where it's available. For example:
  ///
  /// ```dart
  /// double screenHeight = context.height;
  /// ```
  ///
  /// ### Return Value:
  ///
  /// - A `double` representing the height of the device screen in logical pixels.
  ///
  /// ### Example:
  ///
  /// ```dart
  /// double screenHeight = context.height;
  /// print('Screen Height: $screenHeight');
  /// ```
  ///
  /// ### Use Case:
  ///
  /// Use the `height` getter when you need to determine the screen height for responsive layout design or when specifying the height of UI elements based on the screen size.
  double get height => MediaQuery.of(this).size.height;
}