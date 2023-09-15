/// ## [MakeList] Extension :
///
/// Extends the functionality of integers by providing a method to create an
/// iterable list of integers in a specified range.
///
/// ### Usage:
/// ```dart
/// int start = 2;
/// int end = 5;
///
/// // Create an inclusive list from start to end.
/// Iterable<int> inclusiveList = start.to(end);
///
/// // Create an exclusive list from start to end.
/// Iterable<int> exclusiveList = start.to(end, inclusive: false);
///
/// print(inclusiveList); // Output: [2, 3, 4, 5]
/// print(exclusiveList); // Output: [2, 3, 4]
/// ```
///
/// ### Methods:
/// - `to(end, {bool inclusive = true})`: Generates an iterable list of integers
///   starting from the current integer up to the specified [end] integer.
///   - [end]: The ending integer value.
///   - [inclusive]: Indicates whether the [end] value should be included in the list.
///     By default, it is set to `true`.
///
/// ### Note:
/// - This extension is useful for generating sequences of integers within a range.
///
extension MakeList on int {
  /// Generates an iterable list of integers from the current integer to [end].
  ///
  /// ### Parameters:
  /// - [end]: The ending integer value.
  /// - [inclusive]: Indicates whether the [end] value should be included in the list.
  ///   By default, it is set to `true`.
  ///
  /// ### Returns:
  /// - An iterable list of integers within the specified range.
  Iterable<int> to(int end, {bool inclusive = true}) => end > this
      ? [for (var i = this; i < end; i++) i, if (inclusive) end]
      : [for (var i = this; i > end; i++) i, if (inclusive) end];
}
