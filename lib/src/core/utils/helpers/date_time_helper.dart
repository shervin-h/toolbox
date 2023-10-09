import 'package:shamsi_date/shamsi_date.dart';
import 'package:toolbox/src/core/enums/app_enums.dart';

/// ## [timeNormalizer] Function :
///
/// Normalizes a [Jalali] time object by formatting it as "HH:mm" (hour:minute) with
/// leading zeros for single-digit hours and minutes.
///
/// This function is useful for formatting time values consistently, ensuring that
/// both hours and minutes are represented with two digits each.
///
/// ### Parameters:
/// - [timeParam]: A [Jalali] time object to be normalized.
///
/// ### Returns:
/// A string representation of the time in the "HH:mm" format.
///
/// ### Example:
/// ```dart
/// Jalali currentTime = Jalali.now();
/// String formattedTime = timeNormalizer(currentTime);
/// print(formattedTime); // Example Output: "09:05" (if the current time is 9:05 AM)
/// ```
String timeNormalizer(Jalali jalali) {
  String currentHour = '';
  String currentMinutes = '';

  /// Check if the hour is less than 10 and add a leading zero if necessary.
  if (jalali.hour < 10) {
    currentHour = "0${jalali.hour}";

    /// Check if the minute is less than 10 and add a leading zero if necessary.
    if (jalali.minute < 10) {
      currentMinutes = "0${jalali.minute}";
    } else {
      currentMinutes = jalali.minute.toString();
    }
  } else {
    currentHour = jalali.hour.toString();
    if (jalali.minute < 10) {
      /// Check if the minute is less than 10 and add a leading zero if necessary.
      currentMinutes = "0${jalali.minute}";
    } else {
      currentMinutes = jalali.minute.toString();
    }
  }
  return "$currentHour:$currentMinutes";
}

/// ## [normalizeJalaliDate] Function :
///
/// Normalizes a [Jalali] date object by formatting it as "YYYY/MM/DD" (year/month/day)
/// with leading zeros for single-digit months and days.
///
/// This function is useful for formatting date values consistently, ensuring that
/// both months and days are represented with two digits each.
///
/// ### Parameters:
/// - [dateParam]: A [Jalali] date object to be normalized.
///
/// ### Returns:
/// A string representation of the date in the "YYYY/MM/DD" format.
///
/// ### Example:
/// ```dart
/// Jalali currentDate = Jalali.now();
/// String formattedDate = normalizeJalaliDate(currentDate);
/// print(formattedDate); // Example Output: "1402/05/15" (if the current date is May 15, 1402)
/// ```
String normalizeJalaliDate(Jalali jalali) {
  String currentMonth = '';
  String currentDay = '';

  /// Check if the month is less than 10 and add a leading zero if necessary.
  if (jalali.month < 10) {
    currentMonth = "0${jalali.month}";
    if (jalali.day < 10) {
      /// Check if the day is less than 10 and add a leading zero if necessary.
      currentDay = "0${jalali.day}";
    } else {
      currentDay = jalali.day.toString();
    }
  } else {
    currentMonth = jalali.month.toString();
    if (jalali.day < 10) {
      /// Check if the day is less than 10 and add a leading zero if necessary.
      currentDay = "0${jalali.day}";
    } else {
      currentDay = jalali.day.toString();
    }
  }

  /// Combine the year, month, and day to create the formatted date string.
  return "${jalali.year}/$currentMonth/$currentDay";
}

/// ## [currentJalaliDate] Function :
///
/// Retrieves the current date in the Jalali (Shamsi) calendar format and returns it as a string
/// in the "YYYY/MM/DD" (year/month/day) format.
///
/// This function utilizes the [Jalali] class to get the current date in the Jalali calendar
/// and then formats it as a string with the year, month, and day components separated by slashes.
///
/// ### Returns:
/// A string representing the current date in the "YYYY/MM/DD" format in the Jalali calendar.
///
/// ### Example:
/// ```dart
/// String currentDate = currentJalaliDate();
/// print(currentDate); // Example Output: "1402/05/15" (if the current date is May 15, 1402)
/// ```
String currentJalaliDate() {
  /// Get the current date in the Jalali (Shamsi) calendar format.
  final Jalali now = Jalali.now();

  /// Format and return the date as a string in "YYYY/MM/DD" format.
  return '${now.year}/${now.month}/${now.day}';
}

/// ## [jalaliToday] Function :
///
/// Retrieves the current date in the Jalali (Shamsi) calendar format and returns it as a normalized string.
///
/// This function utilizes the [Jalali] class to get the current date in the Jalali calendar
/// and then normalizes it using the [normalizeJalaliDate] function, which ensures that single-digit
/// months and days are prefixed with a leading zero if necessary.
///
/// ### Returns:
/// A string representing the current date in the Jalali calendar with normalized month and day components.
///
/// ### Example:
/// ```dart
/// String todayDate = jalaliToday();
/// print(todayDate); // Example Output: "1402/05/15" (if the current date is May 15, 1402)
/// ```
String jalaliToday() {
  /// Get the current date in the Jalali (Shamsi) calendar format.
  final Jalali today = Jalali.now();

  /// Normalize the date and return it as a string.
  return normalizeJalaliDate(today);
}

/// ## [parseFormattedStringToJalali] Function :
///
/// Parses a formatted string into a Jalali (Persian) date string based on the specified [JalaliMode].
///
/// The [formattedString] is a string representing a date in a standard format, such as "YYYY-MM-DD".
/// The function parses this formatted string into a Jalali date string based on the provided [mode].
///
/// The [mode] parameter allows you to specify the level of detail in the resulting Jalali date string.
/// It is an optional parameter and defaults to [JalaliMode.all], which includes the year, month, and day.
///
/// If the [formattedString] is empty or whitespace, an empty string ('') is returned.
///
/// ### The following modes are available:
///
/// - [JalaliMode.all]: Display the complete Jalali date in the format "YYYY/MM/DD".
/// - [JalaliMode.year]: Display only the year in the format "YYYY".
/// - [JalaliMode.month]: Display the year and month in the format "MM".
/// - [JalaliMode.day]: Display the year, month, and day in the format "DD".
/// - [JalaliMode.monthDay]: Display the month and day with space in between, e.g., "MM / DD".
///
/// ### Example usage:
/// ```dart
/// final formattedDate = '2023-08-31';
/// final jalaliDate = parseFormattedStringToJalali(formattedDate, mode: JalaliMode.all);
/// print(jalaliDate); // Output: '1402/06/09'
/// ```
///
/// Returns the Jalali date string based on the specified [JalaliMode].
String parseFormattedStringToJalali(String formattedString,
    {JalaliMode mode = JalaliMode.all}) {
  if (formattedString.trim().isEmpty) {
    return '';
  }
  final Jalali jalali = DateTime.parse(formattedString).toJalali();

  return switch (mode) {
    JalaliMode.year => jalali.year.toString(),
    JalaliMode.month => jalali.month.toString(),
    JalaliMode.day => jalali.day.toString(),
    JalaliMode.monthDay => '${jalali.month} / ${jalali.day}',
    _ => '${jalali.year}/${jalali.month}/${jalali.day}',
  };
}

/// ## [getDifferenceInDays] Function :
///
/// A function to calculate the difference in days between two input dates.
///
/// This function takes two date strings as input and converts them into
/// DateTime objects. It then calculates the difference in days between
/// these two dates and returns it as a string.
///
/// ### Inputs:
///   - `start`: The start date as a string.
///   - `end`: The end date as a string.
///
/// ### Output:
///   - A string containing the difference in days between the two input dates.
///
/// ### Example:
/// ```dart
/// String startDate = '2023-08-01';
/// String endDate = '2023-08-10';
/// String difference = getDifferenceInDays(start: startDate, end: endDate);
/// print('Difference in days: $difference days');
/// ```
///
/// This example would print: "Difference in days: 9 days"
String getDifferenceInDays({required String start, required String end}) {
  /// Convert the date strings to DateTime objects
  final DateTime startDate = DateTime.parse(start.replaceAll('/', '-'));
  final DateTime endDate = DateTime.parse(end.replaceAll('/', '-'));

  /// Calculate the difference in days between the two dates
  Duration difference = endDate.difference(startDate);
  int daysDifference = difference.inDays;

  return '$daysDifference';
}
