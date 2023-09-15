/// # [IsValidNationalCode] documentation :
///
/// An extension on `String` that adds a method to validate Iranian National Codes (Melli Codes).
///
/// This extension provides a `isValidNationalCode` method to check if a given string
/// represents a valid Iranian National Code. Iranian National Codes, also known as
/// "کد ملی" (Melli Code) in Persian, are unique identification numbers assigned to
/// Iranian citizens.
///
/// Example usage:
/// ```dart
/// final nationalCode = '0012345678';
/// final isValid = nationalCode.isValidNationalCode();
/// ```
///
/// Returns `true` if the provided string is a valid Iranian National Code; otherwise, `false`.
extension IsValidNationalCode on String {
  /// Validates whether the string is a valid Iranian National Code (Melli Code).
  ///
  /// Returns `true` if the string is a valid Iranian National Code; otherwise, `false`.
  bool isValidNationalCode() {
    var code = this;
    var codeLength = code.length;

    // Check if the code length is less than 8 or starts with '0'.
    if (codeLength < 8 || int.parse(code, radix: 10) == 0) return false;
    // Normalize the code to 10 characters by adding leading '0's.
    code = ('0000$code').substring(codeLength + 4 - 10);
    // Check if the middle 6 digits of the code are all zeros.
    if (int.parse(code.substring(3, 9), radix: 10) == 0) return false;

    var c = int.parse(code.substring(9, 10), radix: 10);
    var s = 0;
    for (var i = 0; i < 9; i++) {
      s += int.parse(code.substring(i, i + 1), radix: 10) * (10 - i);
    }
    // Calculate the remainder when dividing the weighted sum by 11.
    s = s % 11;
    // Validate the code based on the calculated verification digit and remainder.
    return (s < 2 && c == s) || (s >= 2 && c == (11 - s));
  }
}

/// # [Separator] documentation :
///
/// An extension on `String` that adds a method to format numbers with separators.
///
/// This extension provides an `addSeparator` method that can be used to add
/// separators (e.g., commas) to a numeric string to improve its readability.
///
/// Example usage:
/// ```dart
/// final number = '1234567';
/// final formattedNumber = number.addSeparator();
/// // formattedNumber is '1,234,567'
/// ```
///
/// Parameters:
///
/// - `qty`: The number of digits between separators. Default is `3`.
/// - `separator`: The separator string to insert between groups of digits. Default is `","`.
///
/// The `addSeparator` method can be used to format both positive and negative
/// numbers, as well as numbers with decimal places.
///
/// Note: This method is designed for formatting strings that represent numbers.
/// It does not perform any numeric conversions or arithmetic operations.
extension Separator on String {
  /// Adds separators to the numeric string for improved readability.
  ///
  /// Returns the numeric string with separators added at specified intervals.
  /// The default separator is a comma (`,`), and the default interval is every
  /// three digits.
  ///
  /// - [qty]: The number of digits between separators. Must be a positive integer.
  /// - [separator]: The separator string to insert between groups of digits.
  ///
  /// Example:
  /// ```dart
  /// final number = '1234567';
  /// final formattedNumber = number.addSeparator();
  /// // formattedNumber is '1,234,567'
  /// ```
  String addSeparator({int? qty = 3, String? separator = ","}) {
    assert(qty! >= 1, '[qty] value as the number separator must be positive!');
    assert(separator! != '',
        '[separator] value as the number separator must not be empty!');

    String tempNum = this;
    String sign = '';
    String decimal = '';

    if (RegExp(r'^[-+]?[0-9](\d+\.?\d*|\.\d+)').hasMatch(this)) {
      if (this[0] == '+' || this[0] == '-') {
        sign = this[0];
        tempNum = substring(1);
      }
      if (tempNum.contains('.')) {
        decimal = '.${tempNum.split('.')[1]}';
        tempNum = tempNum.split('.')[0];
      }
    }

    return sign +
        (tempNum
            .split('')
            .reversed
            .join()
            .replaceAllMapped(
              RegExp(r'(.{})(?!$)'.replaceAll('''{}''', '''{$qty}''')),
              (m) => '${m[0]}$separator',
            )
            .split('')
            .reversed
            .join()) +
        decimal;
  }
}

/// # [CoverUndefineValue] documentation :
///
/// An extension on `String` that covers undefined or empty values.
///
/// This extension provides a `coverUndefineValue` method that can be used to
/// replace undefined or empty string values with a specified default value,
/// which is "undefined" by default.
///
/// Example usage:
/// ```dart
/// final text = 'null';
/// final coveredText = text.coverUndefineValue();
/// // coveredText is 'undefined'
/// ```
///
/// The `coverUndefineValue` method checks if the string is composed of
/// undefined or empty characters (e.g., 'null', ' ', '-', '_', '&') and, if so,
/// replaces them with the default "undefined" value.
///
/// Parameters:
///
/// - `defaultValue`: The value to use as a replacement for undefined or empty strings.
///
/// The `coverUndefineValue` method returns the original string if it contains
/// non-empty and defined characters; otherwise, it returns the default value.
///
/// Note: This method does not handle null references or objects other than strings.
extension CoverUndefineValue on String {
  /// Covers undefined or empty values with a specified default value.
  ///
  /// Returns the original string if it contains non-empty and defined characters.
  /// If the string consists of undefined or empty characters (e.g., 'null', ' ', '-', '_', '&'),
  /// it replaces them with the specified `defaultValue`, which is "undefined" by default.
  ///
  /// - [defaultValue]: The value to use as a replacement for undefined or empty strings.
  ///
  /// Example:
  /// ```dart
  /// final text = 'null';
  /// final coveredText = text.coverUndefineValue();
  /// // coveredText is 'undefined'
  /// ```
  String coverUndefineValue() {
    return replaceAll(RegExp(r'[null| |\-|_|&]'), '') == ''
        ? 'un defined'
        : this;
  }
}

/// # [LimitedEllipses] documentation :
///
/// An extension on `String` that limits the length of a string and appends ellipses if exceeded.
///
/// This extension provides a `limitedEllipses` method that can be used to
/// limit the length of a string to a specified `maxLength`. If the string's length
/// exceeds the maximum length, it truncates the string and appends ellipses "...".
///
/// Example usage:
/// ```dart
/// final text = 'Lorem ipsum dolor sit amet';
/// final limitedText = text.limitedEllipses(maxLength: 10);
/// // limitedText is 'Lorem ip...'
/// ```
///
/// The `limitedEllipses` method checks if the string length is less than or equal
/// to `maxLength`. If so, it returns the original string. If the length exceeds `maxLength`,
/// it truncates the string to `maxLength - 4` characters and appends "..." to indicate
/// that the string has been limited.
///
/// Parameters:
///
/// - `maxLength`: The maximum length of the string before truncation and appending ellipses.
///
/// The `limitedEllipses` method returns the original string if its length is within
/// the specified limit; otherwise, it returns the truncated string with ellipses.
///
/// Note: This method does not handle null references or objects other than strings.
extension LimitedEllipses on String {
  /// Limits the length of a string and appends ellipses if exceeded.
  ///
  /// Returns the original string if its length is less than or equal to [maxLength].
  /// If the length exceeds [maxLength], it truncates the string to [maxLength - 4]
  /// characters and appends ellipses "..." to indicate that the string has been limited.
  ///
  /// - [maxLength]: The maximum length of the string before truncation and appending ellipses.
  ///
  /// Example:
  /// ```dart
  /// final text = 'Lorem ipsum dolor sit amet';
  /// final limitedText = text.limitedEllipses(maxLength: 10);
  /// // limitedText is 'Lorem ip...'
  /// ```
  String limitedEllipses({required int maxLength}) {
    if (length <= maxLength) {
      return this;
    } else {
      final truncatedText = substring(0, maxLength - 4);
      return '$truncatedText ...';
    }
  }
}

/// # [WorkWithStrings] documentation :
///
/// An extension on `String` that allows reversing the characters of a string.
///
/// This extension provides a `reversed` getter that can be used to reverse the
/// characters of a string and obtain the reversed version of the original string.
///
/// Example usage:
/// ```dart
/// final text = 'Hello, World!';
/// final reversedText = text.reversed;
/// // reversedText is '!dlroW ,olleH'
/// ```
///
/// The `reversed` getter splits the original string into individual characters,
/// reverses their order, and then joins them back together into a new string.
///
/// Example:
/// ```dart
/// final text = 'Hello';
/// final reversedText = text.reversed;
/// // reversedText is 'olleH'
/// ```
///
/// Note: This extension method does not handle null references or objects other
/// than strings.
extension WorkWithStrings on String {
  /// Reverses the characters of a string.
  ///
  /// Returns a new string with the characters of the original string reversed.
  ///
  /// Example:
  /// ```dart
  /// final text = 'Hello, World!';
  /// final reversedText = text.reversed;
  /// // reversedText is '!dlroW ,olleH'
  /// ```
  String get reversed => split('').reversed.join();
}
