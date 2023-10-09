import 'package:flutter_test/flutter_test.dart';
import 'package:toolbox/src/core/utils/extensions/string_extensions.dart';

void main() {
  group(
    'national code tests',
    () {
      test(
        'should be return `true`',
        () {
          var result = '9171607757'.isValidNationalCode();
          expect(result, true);
        },
      );

      test(
        'should be return `false`',
            () {
          var result = '1234567890'.isValidNationalCode();
          expect(result, false);
        },
      );

      test(
        'should be return `true`',
            () {
          var result = '9732478926'.isValidNationalCode();
          expect(result, true);
        },
      );
    },
  );
}