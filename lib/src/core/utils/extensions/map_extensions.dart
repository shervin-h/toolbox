/// ## Extension: [RemoveNullOrEmptyValues]
///
/// This extension provides utility methods for removing null or empty values from a Map.
///
/// ### Usage:
/// ```dart
/// Map<String, dynamic> data = {
///   'name': 'John',
///   'age': null,
///   'city': '',
///   'country': 'USA',
/// };
///
/// data.removeNullValues(); // Removes null values from the Map.
/// data.removeEmptyValues(); // Removes empty String values from the Map.
/// ```
extension RemoveNullOrEmptyValues on Map {
  /// Removes Null Values
  ///
  /// This method removes all key-value pairs where the value is null from the Map.
  ///
  /// Returns: The modified Map with null values removed.
  Map removeNullValues() {
    removeWhere((key, value) => value == null);
    return this;
  }

  /// Removes Empty String Values
  ///
  /// This method removes all key-value pairs where the value is an empty String from the Map.
  ///
  /// Returns: The modified Map with empty String values removed.
  Map removeEmptyValues() {
    removeWhere((key, value) => (value is String && value.trim().isEmpty));
    return this;
  }
}