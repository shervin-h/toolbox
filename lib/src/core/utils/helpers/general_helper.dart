/// ## [getFormattedMonth] Function :
///
/// Formats an integer month value into a two-digit string representation.
///
/// ### Parameters:
/// - [month]: An integer representing the month (1 to 12).
///
/// ### Returns:
/// - A two-digit string representing the formatted month ('01' to '12').
///
/// ### Example:
/// ```dart
/// int numericMonth = 3;
/// String formattedMonth = getFormattedMonth(numericMonth);
/// print(formattedMonth); // Output: '03'
/// ```
///
/// ### Note:
/// - The function ensures that the resulting string always has two digits.
///
String getFormattedMonth(int month) {
  return month.toString().padLeft(2, '0');
}

/// ## [convertMonthNumberToName] Function :
///
/// Converts a numeric month representation (e.g., '01' for `فروردین`) to its corresponding Persian month name.
///
/// ### Parameters:
/// - [monthNumber]: A String representing the numeric month ('01' to '12').
///
/// ### Returns:
/// - A String representing the Persian name of the month, or an empty string if the input is invalid.
///
/// ### Example:
/// ```dart
/// String numericMonth = '03';
/// String monthName = convertMonthNumberToName(numericMonth);
/// print(monthName); // Output: 'خرداد'
/// ```
///
/// ### Note:
/// - If the provided [monthNumber] is not in the range of '01' to '12', the function returns an empty string.
/// - The input [monthNumber] should be a two-digit string (e.g., '01' for `فروردین`).
///
String convertMonthNumberToName(int month) {
  return switch (getFormattedMonth(month)) {
    '01' => 'فروردین',
    '02' => 'اردیبهشت',
    '03' => 'خرداد',
    '04' => 'تیر',
    '05' => 'مرداد',
    '06' => 'شهریور',
    '07' => 'مهر',
    '08' => 'آبان',
    '09' => 'آذر',
    '10' => 'دی',
    '11' => 'بهمن',
    '12' => 'اسفند',
    _ => '',
  };
}
