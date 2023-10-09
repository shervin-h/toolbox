import 'package:flutter_test/flutter_test.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:toolbox/src/core/utils/helpers/date_time_helper.dart';

void main() {
  test(
    'should be return ``',
    () {
      var result = timeNormalizer(
          DateTime.parse('2021-03-29T05:50:06.7199222-04:00').toJalali());
      print(result);
      expect(result, '');
    },
  );
}
