import 'package:flutter_test/flutter_test.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:toolbox/src/core/utils/helpers/date_time_helper.dart';

void main() {
  group(
    'timeNormalizer test',
    () {
      test(
        'should be return `09:50`',
        () {
          var result = timeNormalizer(
              DateTime.parse('2021-03-29T05:50:06.7199222-04:00').toJalali());
          expect(result, '09:50');
        },
      );

      test(
        'The length of normalized time should be `5`',
        () {
          var result = timeNormalizer(DateTime.now().toJalali());

          expect(result.length, 5);
        },
      );
    },
  );

  group(
    'currentJalaliDate tests',
    () {
      test('should be return `yy/mm/dd`', () {
        var result = currentJalaliDate();
        expect(result.split('/').length, 3);
      });
    },
  );
}
