/// ## [JalaliMode] documentation :
/// An enumeration representing different modes for formatting Jalali (Persian) dates.
///
/// The `JalaliMode` enum provides options for formatting Jalali dates in various ways.
/// Each mode corresponds to a specific level of detail in the date representation.
enum JalaliMode {
  /// Display the complete date in the format: "YYYY/MM/DD".
  ///
  /// In this mode, the full Jalali date, including the year, month, and day, is displayed.
  all('a'),

  /// Display only the year in the format: "YYYY".
  ///
  /// This mode allows you to show only the year component of the Jalali date.
  year('y'),

  /// Display the year and month in the format: "MM".
  ///
  /// In this mode, the year and month components of the Jalali date are displayed.
  month('m'),

  /// Display the year, month, and day with abbreviated month name in the format: "YYYY/MM/DD".
  ///
  /// This mode provides a detailed representation of the Jalali date, including the year, month,
  /// and day with an abbreviated month name.
  day('d'),

  /// Display the year and month in the format: "MM/DD".
  ///
  /// In this mode, the month and day components of the Jalali date are displayed.
  monthDay('md');

  /// Creates a `JalaliMode` enum with the specified mode string.
  ///
  /// The `mode` string is used to define the formatting style associated with the mode.
  const JalaliMode(this.mode);

  final String mode;
}
